#!/bin/bash

sudo systemctl status mariadb | grep 'running' > /dev/null 2>&1
if [ $? == 0 ]; then
  echo "MariaDB is up. All is well with the world."
else
  echo "MariaDB is down. Starting it."
  sudo systemctl start mariadb
fi