#!/bin/bash
PID_FILE=/home/ansibleuser/project/app.pid

if [ -f "$PID_FILE" ]; then
    kill $(cat $PID_FILE) 2>/dev/null || true
    rm $PID_FILE
    sleep 1
fi

nohup python3 /home/ansibleuser/project/app.py > /home/ansibleuser/project/app.log 2>&1 &
echo $! > $PID_FILE
disown