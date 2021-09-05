#!/usr/bin/env python3

import argparse


def poo(opt):
    print(opt)
    print("inside poo")

if __name__ == "__main__":
    a = argparse.ArgumentParser()
    # a.add_argument("data")
    # a.add_argument("item")

    subs = a.add_subparsers()

    p_data = subs.add_parser("data")
    p_data.set_defaults(func=poo)
    opt = a.parse_args()

    opt.func(opt)

    # print(asdf)
    
    # print(opt["data"])

