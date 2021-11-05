#!/usr/bin/env python3

import argparse
from posixpath import basename
import PySimpleGUI as sg
import os.path as osp
import os
from typing import List, NoReturn
from typing import Dict
import subprocess
import os.path as osp
import os
import pathlib
from datetime import datetime
from pathlib import Path
from dataclasses import dataclass
import json

from PySimpleGUI.PySimpleGUI import Radio


global focused_file
DATAF = "./data/commands.json"
DATAITEMS = ["Usage", "History", "Package"]
FRONTMATTERITEMS = ["description"]
ARCHETYPES = list(map(lambda x: os.path.abspath(x), os.listdir("./archetypes")))
EDITOR: str = str(os.getenv("EDITOR")) if os.getenv("EDITOR") is not None else ""

if os.path.exists(".focus"):
    with open(".focus", "r") as f:
        focused_file = f.read()
else:
    focused_file = ""


class Cmd:
    def __init__(self, args: List[str]) -> None:
        self.args = args
        pass

    @classmethod
    def new(cls, args: List[str]):
        return cls(args)

    @classmethod
    def fromstr(cls, cmd: str):
        return cls(cmd.split(" "))

    def subprocess(self) -> bool:

        try:
            res = subprocess.run(self.args, capture_output=True, text=True)
            if res.returncode != 0:
                return False
            return True

        except:
            return False

    def execvp(self) -> NoReturn:
        os.execvp(self.args[0], self.args)


@dataclass
class Groups:
    keys_content = ["c_" + x for x in os.listdir("content")]
    keys_archetypes = ["a_" + x for x in map(lambda y: os.path.basename(y), ARCHETYPES)]
    radio_content = [
        sg.Radio(text=x, group_id=1, default=x == "builtins", key="c_" + x)
        for x in os.listdir("content")
    ]
    radio_archetypes = [
        sg.Radio(text=x, group_id=2, default=x == "builtins.md", key="a_" + x)
        for x in map(lambda y: os.path.basename(y), ARCHETYPES)
    ]


def focus(opt):

    focused = ""

    for x, _, z in os.walk("content"):
        for filename in z:
            fullpath = os.path.join(x, filename)
            if x + "/" + opt.filename + ".md" == fullpath:
                focused = fullpath

    if focused == "":
        return
    else:
        print(focused)

    with open(".focus", "w") as f:
        f.write(focused)


def insertline(filepath: str, linenum: int, content: str) -> None:

    f = open(filepath, "r+")
    lines = f.readlines()
    f.seek(0)

    for i, line in enumerate(lines):

        if i == linenum:
            f.write(content + "\n")
        f.write(line)


def run(cmd: str) -> bool:

    try:
        res = subprocess.run(cmd.split(" "), capture_output=True, text=True)
        if res.returncode != 0:
            return False
        return True

    except:
        return False


def input_content() -> str:

    content_types: List[str] = os.listdir("./content")
    for i, c in enumerate(content_types):
        print(i, ":", c)
    return content_types[int(input("content (int):"))]


def live(opt):

    type_line = input("animated typed line:")
    type_line = "\\$ " + type_line
    print_line = input("output line:")

    cmd = 'live -t "%s" -p "%s" > ./static/%s.svg' % (
        type_line,
        print_line,
        opt.filename,
    )

    Cmd.new(["bash", "-c", cmd]).execvp()


def publish(_):
    # Build and rsync to remote server
    os.execl("./.uploadremote", "./uploadremote")


def spellchk(_):
    # Use aspell to do spellchecking
    content_t = input_content()
    cmd = "for f in ./content/" + content_t + "/*.md ;do aspell check $f;done"

    Cmd.new(["bash", "-c", cmd]).execvp()


def push(_):
    # Push repository to GitHub

    dir_ = str(Path(__file__).parent)
    date = datetime.strftime(datetime.now(), "%y-%m-%d-%H-%M")

    if not run("git -C %s add ." % dir_):
        print("git add err")
        exit(1)

    if not run("git -C %s commit -m %s" % (dir_, date)):
        print("git commit err")
        exit(1)

    if not run("git -C %s push" % dir_):
        print("git push err")
        exit(1)

    exit(0)


def new(_):
    # Create a new .md file

    values: Dict
    data: Dict
    content = ""
    archetype = ""

    txt_size = (10, 1)

    try:
        with open(DATAF, "r") as f:
            data = json.load(f)
    except FileNotFoundError as e:
        print(e)
        exit(1)

    layout = [
        [sg.Text("Content:", txt_size), *Groups.radio_content],
        [sg.Text("Archetype:", txt_size), *Groups.radio_archetypes],
        [sg.Text("Name:", txt_size), sg.Input(key="Name")],
    ]

    for d in DATAITEMS:
        layout.append([sg.Text(d, txt_size), sg.Input(key=d)])

    layout.append([sg.Button("Submit"), sg.Button("Cancel")])

    window = sg.Window("Data", layout)

    while True:
        event, values = window.read()
        if event == "Submit":
            data[values["Name"]] = {k: v for k, v in values.items() if k in DATAITEMS}
            break
        if event == sg.WINDOW_CLOSED or event == "Cancel":
            exit(0)

    window.close()

    for k, v in values.items():

        if v and k in Groups.keys_content:
            content = k[2:]

        if v and k in Groups.keys_archetypes:
            archetype = k[2:]

    cmd = "hugo new -k %s %s/%s.md" % (archetype[:-3], content, values["Name"])

    if not Cmd.fromstr(cmd).subprocess():
        print("Err running %s" % cmd)
        exit(1)

    with open(DATAF, "w") as f:
        json.dump(data, indent=3, fp=f)

    if EDITOR != "":
        Cmd.fromstr(EDITOR + " content/%s/%s.md" % (content, values["Name"])).execvp()
    else:
        print("No $$EDITOR set")
        exit(0)


def edit(_):

    if EDITOR != "":
        Cmd.fromstr(EDITOR + " " + focused_file).execvp()
    else:
        print("No $$EDITOR set")
        exit(0)


def data(_):
    """
    Add to json data
    """

    filename = os.path.basename(focused_file)[:-3]

    data: Dict

    p = pathlib.Path(__file__)
    os.chdir(p.parent.absolute())

    if osp.exists(DATAF):
        with open(DATAF, "r") as f:
            data = json.load(f)
    else:
        print("Missing data file")
        exit(1)

    usage = data[filename]["Usage"] if filename in data else ""
    package = data[filename]["Package"] if filename in data else ""
    history = data[filename]["History"] if filename in data else ""

    layout = [
        [sg.Input(key="Usage", tooltip="usage", default_text=usage)],
        [sg.Input(key="Package", tooltip="package", default_text=package)],
        [sg.Input(key="History", tooltip="history", default_text=history)],
        [sg.Button("Submit"), sg.Button("Cancel")],
    ]

    window = sg.Window("Data", layout)

    while True:
        event, values = window.read()

        if event == "Submit":
            data[filename] = values
            break

        if event == sg.WINDOW_CLOSED or event == "Cancel":
            break

    with open(DATAF, "w") as f:
        json.dump(data, indent=3, fp=f)

    window.close()
    exit(0)


if __name__ == "__main__":
    p_a = argparse.ArgumentParser()
    p_subs = p_a.add_subparsers()

    p_data = p_subs.add_parser(
        "data", description="add data to file <name> (no extension)"
    )
    p_data.add_argument("name")
    p_data.set_defaults(func=data)

    p_content = p_subs.add_parser(
        "new", description="hugo add new .../<filename> (no extension)"
    )
    p_content.set_defaults(func=new)

    p_content = p_subs.add_parser(
        "push", description="push everything to github repository"
    )
    p_content.set_defaults(func=push)

    p_content = p_subs.add_parser(
        "publish", description="build and rsync to remote server"
    )
    p_content.set_defaults(func=publish)

    p_content = p_subs.add_parser(
        "spellchk", description="run aspell on every markdown file"
    )
    p_content.add_argument("--filename")
    p_content.set_defaults(func=spellchk)

    p_content = p_subs.add_parser(
        "live",
        description="use live to create animated typing svg for <filename> (no extension)",
    )
    p_content.add_argument("filename")
    p_content.set_defaults(func=live)

    p_edit = p_subs.add_parser("edit", description="edit the focused file")
    p_edit.set_defaults(func=edit)

    p_focus = p_subs.add_parser("focus", description="set focus to a content file")
    p_focus.add_argument("filename")
    p_focus.set_defaults(func=focus)

    opt = p_a.parse_args()

    if len(opt.__dict__) != 0:
        opt.func(opt)
    else:
        p_a.print_help()
        print("\nFOCUS: %s\n" % focused_file)
