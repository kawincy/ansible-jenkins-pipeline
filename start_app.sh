#!/bin/bash
PID_FILE=/home/ansibleuser/project/app.pid

# Stop existing process if running
if [ -f "$PID_FILE" ]; then
    kill $(cat $PID_FILE) 2>/dev/null || true
    rm $PID_FILE
    sleep 1
fi

# Start app and save PID
nohup python3 /home/ansibleuser/project/app.py > /home/ansibleuser/project/app.log 2>&1 &
echo $! > $PID_FILE
disown#!/bin/bash
pkill -f "python3 app.py" || true
sleep 1
nohup python3 /home/ansibleuser/project/app.py > /home/ansibleuser/project/app.log 2>&1 &
disown
