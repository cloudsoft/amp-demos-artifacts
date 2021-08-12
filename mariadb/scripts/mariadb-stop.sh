#!/bin/bash

sudo systemctl status mariadb | grep 'running' > /dev/null 2>&1
if [ $? == 0 ]; then
  echo "MariaDB is up. Shutting it down..."
  sudo systemctl stop mariadb
else
  echo "MariaDB is already down."
fi