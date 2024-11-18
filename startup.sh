#!/bin/bash
cd /home/ec2-user/tetris
source venv/bin/activate
gunicorn -b 0.0.0.0:8080 app:app
