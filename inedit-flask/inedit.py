from flask import Flask
from flask import render_template

app = Flask(__name__)

"""
We then use the route() decorator to tell Flask what URL should trigger our function.
"""

@app.route('/')
def hello_world():
  return 'Fanis'

