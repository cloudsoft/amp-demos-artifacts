#!/bin/bash

echo 'Stopping python web server ...'

kill -9 `cat ${PID_FILE:-/tmp/pid.txt}`

