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

  ## Install the MariaDB server
  sudo apt update && sudo apt -y upgrade # required because a system upgrade is necessary to support maria-db
  if [ ! -z "${DB_gz}" ] ; then
    curl -L -k -f -o mariadb.tar.gz "${DB_gz}"
  fi
  tar xf mariadb.tar.gz
  PREV=`pwd`
  cd mariadb
  while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/{lock,lock-frontend} >/dev/null 2>&1; do
    echo 'Waiting for release of dpkg/apt locks...';
    sleep 5
  done
  sudo ./dbmanager.sh install
  cd $PREV

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
