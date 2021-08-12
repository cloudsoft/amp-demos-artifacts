#!/bin/bash

# When MariaDB is stopped `systemctl status mariadb` returns `Active: inactive (dead)`
# reminder: test for what you expect
sudo systemctl status mariadb | grep 'dead' > /dev/null 2>&1
if [ $? != 0 ] ; then
  echo "MariaDB is running when configure is called. Skipping configuration assuming it has already been done. If this is not correct then stop the DB before invoking this."
else
  echo "Configuring MariaDB..."
  # When MariaDB is up `systemctl status mariadb` returns `Active: active (running)`
  sudo systemctl start mariadb

  if [ -f ${CREATION_SCRIPT} ] ; then
        echo "Running creation-script.sql"
        sudo mariadb -u root < ${CREATION_SCRIPT}
  fi
fi