#!/usr/bin/python
# -*- coding: utf-8 -*-
import os
from flask import Flask
from flask import jsonify
app = Flask(__name__)

@app.route("/")
def hello():
    return jsonify(value=os.environ['max_conns'])

if __name__ == '__main__':
   app.run(host='0.0.0.0')
