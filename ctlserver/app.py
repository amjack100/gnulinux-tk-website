#!/usr/bin/env python3

import os

os.chdir(os.path.split(__file__)[0])
print(os.path.split(__file__)[0])

from face_recognition.api import face_landmarks
from flask import Flask
import subprocess
import re
from flask import render_template
from livereload import Server
from flask import request, redirect, url_for
from werkzeug.datastructures import ImmutableMultiDict
from werkzeug.utils import secure_filename
from http.client import HTTPResponse
from werkzeug.wrappers import response
from os.path import join, exists
import numpy as np
from PIL import Image
import face_recognition
from urllib.parse import urlparse
from urllib.request import urlopen

UPLOAD_FOLDER = "static"
app = Flask(__name__)

app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER


global face_imgs
global full_imgs
global done_imgs


@app.route("/", methods=["GET", "POST"])
def hello(name=None):

    return render_template("hello.html", **globals())


if __name__ == "__main__":
    face_imgs = list(filter(lambda x: x[:4] == "face", os.listdir("static")))
    full_imgs = list(filter(lambda x: x[:4] == "full", os.listdir("static")))
    done_imgs = list(filter(lambda x: x[:4] == "done", os.listdir("static")))
    app.jinja_env.auto_reload = True
    app.config["TEMPLATES_AUTO_RELOAD"] = True
    server = Server(app.wsgi_app)
    server.serve(port=4999, debug=True)

# return "/uploads/resize.jpeg"
