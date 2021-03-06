# -*- coding: utf-8 -*-

from flask import Flask
from flask import render_template
from flask import redirect

import nexus

app = Flask(__name__)

app.debug = True


@app.route('/')
def index():
    return redirect('/hello')


@app.route('/users/')
def get_users():
    data = nexus.get_users()['data']
    return render_template('users.html', data=data)


@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
