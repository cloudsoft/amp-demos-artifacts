#!/bin/bash

MARIADB_CFG=/etc/mysql/mariadb.conf.d/
sudo test -f "$MARIADB_CFG" && MARIADB_EXISTS="0"

if [ "$MARIADB_EXISTS" ]; then
  echo "MariaDB already installed."
else
  which curl || sudo apt --assume-yes install curl

  while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
     echo Waiting for other instances of apt to complete...
     sleep 5
  done

  sudo apt --assume-yes install mariadb-server

  sudo systemctl stop mariadb

  # yes, service is still called mysqld
  cat >/tmp/zz-bind-address.cnf <<ENDOFTEXT
[mysqld]
bind-address = 0.0.0.0
ENDOFTEXT
  # yes directory is still named mysql
  sudo mv /tmp/zz-bind-address.cnf /etc/mysql/mariadb.conf.d/
  sudo chown root:root /etc/mysql/mariadb.conf.d/zz-bind-address.cnf
fi
