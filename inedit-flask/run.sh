#!/bin/bash
../restart_apache.sh
export FLASK_APP=inedit.py
export FLASK_ENV=development
flask run --host=0.0.0.0
