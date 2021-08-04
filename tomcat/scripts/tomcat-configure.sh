#!/bin/bash

sudo find /usr/local/tomcat/webapps -mindepth 1 -delete
sudo cp ${ROOT_war} /usr/local/tomcat/webapps/ROOT.war
