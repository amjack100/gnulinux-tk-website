#!/usr/bin/env python3

import argparse
import os.path as osp
import os
from typing import List, NoReturn
from typing import Dict
import subprocess
from subprocess import CompletedProcess
import os.path as osp
import os
import pathlib
from datetime import datetime
from pathlib import Path
import json


def run(cmd:str) -> CompletedProcess:
    return subprocess.run(cmd.split(" "), capture_output=True, text=True)

def input_content() -> str:

    content_types:List[str] =  os.listdir("./content")
    for i, c in enumerate(content_types):
        print(i, ":", c)
    return content_types[int(input("content (int):"))] 


def spellchk(opt):
    """
    Use aspell to do spellchecking
    """

    content_t = input_content()

    try:
        os.execvp("bash" ,["bash","-c", "for f in ./content/" + content_t + "/*.md ;do aspell check $f;done"])
    except Exception as e:
        print(e)
        exit(1)


def push(_):
    """
    Push repository to GitHub
    """

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
    """
    Create a new .md file
    """

    content_type = input_content()

    if opt.filename[-3:] == ".md":
        print("no extension")
        exit(1)

    try:
        res = run("hugo new %s/%s.md" % (content_type, opt.filename))
    except Exception as e:
        print(e)
        exit(1)

    if res.returncode != 0:
        print(res.stdout)
        print(res.stderr)
        exit(1)
    
    if (input("open editor? [y] or n:") != "n"):
        
        if os.getenv("EDITOR") != "":
            res = subprocess.run([str(os.getenv("EDITOR")), "./content/" + content_type + "/" + opt.filename + ".md"])
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
    DATAI=["Usage", "History", "Package"]
    DATAF="./data/commands.json"

    p = pathlib.Path(__file__)
    os.chdir(p.parent.absolute())

    if osp.exists(DATAF):
        with open(DATAF,"r") as f:
            data = json.load(f)
    else:
        print("Missing data file")
        exit(1)

    data[filename]= {key: input(key + ":") for key in DATAI}

    with open(DATAF, "w") as f:
        json.dump(data, indent=3,fp=f)

    exit(0)


if __name__ == "__main__":
    p_a = argparse.ArgumentParser()
    p_subs = p_a.add_subparsers()

    p_data = p_subs.add_parser("data")
    p_data.add_argument("name")
    p_data.set_defaults(func=data)

    p_content = p_subs.add_parser("content")
    p_content.add_argument("filename")
    p_content.set_defaults(func=content)
    
    p_content = p_subs.add_parser("push")
    p_content.set_defaults(func=push)

    p_content = p_subs.add_parser("spellchk")
    p_content.add_argument("--filename")
    p_content.set_defaults(func=spellchk)


    opt = p_a.parse_args()


    if len(opt.__dict__) != 0:
        opt.func(opt)
    else:
        p_a.print_help()



