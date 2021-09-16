#!/usr/bin/env python3

import argparse
import PySimpleGUI as sg
import os.path as osp
import os
from typing import List
from typing import Dict
import subprocess
from subprocess import CompletedProcess
import os.path as osp
import os
import pathlib
from datetime import datetime
from pathlib import Path
import json


DATAF="./data/commands.json"
DATAITEMS=["Usage", "History", "Package"]

def run(cmd:str) -> CompletedProcess:
    return subprocess.run(cmd.split(" "), capture_output=True, text=True)

def input_content() -> str:

    content_types:List[str] =  os.listdir("./content")
    for i, c in enumerate(content_types):
        print(i, ":", c)
    return content_types[int(input("content (int):"))] 


def live(opt):

    type_line = input("animated typed line:")
    print_line = input("output line:")

    type_line = "\\$ " + type_line

    try:
        os.execvp("bash" ,["bash","-c", "live -t \"%s\" -p \"%s\" > ./static/%s.svg" % (type_line, print_line, opt.filename)])
    except Exception as e:
        print(e)
        exit(1)

def publish(_):
    # Build and rsync to remote server
    os.execl("./.uploadremote", "./uploadremote")


def spellchk(_):
    # Use aspell to do spellchecking
    content_t = input_content()

    try:
        os.execvp("bash" ,["bash","-c", "for f in ./content/" + content_t + "/*.md ;do aspell check $f;done"])
    except Exception as e:
        print(e)
        exit(1)


def push(_):
    # Push repository to GitHub

    dir_ = str(Path(__file__).parent)
    res: CompletedProcess = run("git -C %s add ." % dir_)

    if res.returncode != 0:
        print(res.stdout)
        exit(1)

    print(res.stdout)

    date = datetime.strftime(datetime.now(), "%y-%m-%d-%H-%M")
    res = run("git -C %s commit -m %s" % (dir_, date))

    if res.returncode != 0:
        print(res.stdout)
        exit(1)

    print(res.stdout)

    res = run("git -C %s push" % dir_)

    if res.returncode != 0:
        print(res.stdout)
        exit(1)

    print(res.stdout)
    exit(0)

def content(opt):
    # Create a new .md file

    values: Dict
    data: Dict
    txt_size = (10,1)

    if osp.exists(DATAF):
        with open(DATAF,"r") as f:
            data = json.load(f)
    else:
        print("Missing data file")
        exit(1)

    layout = [
        [sg.Radio(text=dir_, group_id=1, default= dir_=="builtins") for dir_ in os.listdir("./content")],
    [sg.Text("Name:",txt_size), sg.Input(key="Name")],
    [sg.Text("Usage:",txt_size), sg.Input(key="Usage")],
    [sg.Text("Package:",txt_size), sg.Input(key="Package")],
    [sg.Text("History:",txt_size), sg.Input(key="History")],
    [sg.Button("Submit"), sg.Button("Cancel")]
    ]

    window = sg.Window("Data", layout)

    while True:
        event, values = window.read()
        if event == 'Submit':
            data[values["Name"]] = {k:v for k,v in values.items() if k in DATAITEMS}
            break
        if event == sg.WINDOW_CLOSED or event == 'Cancel':
            exit(0)

    window.close()

    try:
        res = run("hugo new %s/%s.md" % (os.listdir("./content")[list(filter(lambda x:x[1] is True, values.items()))[0][0]], values["Name"]))
    except Exception as e:
        print(e)
        exit(1)

    if res.returncode != 0:
        print(res.stdout)
        print(res.stderr)
        exit(1)

    with open(DATAF, "w") as f:
        json.dump(data, indent=3,fp=f)


    if (input("open editor? [y] or n:") != "n"):
        
        if os.getenv("EDITOR") != "":
            res = subprocess.run([str(os.getenv("EDITOR")), list(filter(lambda w: values["Name"] + ".md" in w[2], os.walk("./content")))[0][0] + "/" + values["Name"] + ".md" ])
        else:
            print("requires $$EDITOR set")
            exit(0)
    
    print(res)


def data(opt):
    """
    Add to json data
    """

    filename = opt.name

    data: Dict

    p = pathlib.Path(__file__)
    os.chdir(p.parent.absolute())

    if osp.exists(DATAF):
        with open(DATAF,"r") as f:
            data = json.load(f)
    else:
        print("Missing data file")
        exit(1)

    usage = data[filename]["Usage"] if filename in data else ""
    package = data[filename]["Package"] if filename in data else ""
    history = data[filename]["History"] if filename in data else ""

    layout = [[sg.Input(key="Usage", tooltip="usage", default_text=usage)],
              [sg.Input(key="Package", tooltip="package", default_text=package)],
              [sg.Input(key="History", tooltip="history", default_text=history)],
              [sg.Button('Submit'), sg.Button('Cancel')]
              ]

    window = sg.Window("Data", layout)

    while True:
        event, values = window.read()

        if event == 'Submit':
            data[filename]= values
            break

        if event == sg.WINDOW_CLOSED or event == 'Cancel':
            break

    with open(DATAF, "w") as f:
        json.dump(data, indent=3,fp=f)

    window.close()
    exit(0)


if __name__ == "__main__":
    p_a = argparse.ArgumentParser()
    p_subs = p_a.add_subparsers()

    p_data = p_subs.add_parser("data", description="add data to file <name> (no extension)")
    p_data.add_argument("name")
    p_data.set_defaults(func=data)

    p_content = p_subs.add_parser("content", description="hugo add new .../<filename> (no extension)")
    p_content.set_defaults(func=content)
    
    p_content = p_subs.add_parser("push", description="push everything to github repository")
    p_content.set_defaults(func=push)

    p_content = p_subs.add_parser("publish", description="build and rsync to remote server")
    p_content.set_defaults(func=publish)

    p_content = p_subs.add_parser("spellchk", description="run aspell on every markdown file")
    p_content.add_argument("--filename")
    p_content.set_defaults(func=spellchk)

    p_content = p_subs.add_parser("live", description="use live to create animated typing svg for <filename> (no extension)")
    p_content.add_argument("filename")
    p_content.set_defaults(func=live)


    opt = p_a.parse_args()


    if len(opt.__dict__) != 0:
        opt.func(opt)
    else:
        p_a.print_help()



