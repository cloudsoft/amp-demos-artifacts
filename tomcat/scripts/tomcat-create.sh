#!/bin/bash

which curl || sudo apt --assume-yes install curl

# Install java if needed
if ( which java ) ; then
  echo "Java already installed."
else
  echo "Trying to install java."
  # occasionally AWS comes up without this repo
  sudo add-apt-repository -y ppa:openjdk-r/ppa || echo could not add repo, will continue trying java install anyway
  sudo apt-get update || echo could not apt-get update, will continue trying java install anyway

  sudo apt --assume-yes install openjdk-8-jdk-headless
  sudo apt --assume-yes install openjdk-8-jre-headless
fi

# Install jq so we can set vars
if ( which jq ) ; then
  echo "jq already installed."
else
  echo "Trying to install jq."
  sudo apt --assume-yes install jq
fi

# Install Apache Tomcat
if [ -f /usr/local/tomcat/bin/startup.sh ] ; then
  echo "Tomcat already installed."
else
  sudo mkdir /usr/local/tomcat
  curl ${TOMCAT_gz} | sudo tar x -C /usr/local/tomcat --strip-components=1
  sudo chmod 750 /usr/local/tomcat/bin
  sudo sed --in-place 's#<Connector port="8080" protocol="HTTP/1.1"#\0 address="0.0.0.0"#g' /usr/local/tomcat/conf/server.xml
fi
