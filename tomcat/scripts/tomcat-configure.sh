#!/bin/bash

sudo find /usr/local/tomcat/webapps -mindepth 1 -delete
sudo cp ${ROOT_war} /usr/local/tomcat/webapps/ROOT.war


echo "brooklyn.example.db.url=jdbc:${DB_URL}/visitors?user=brooklyn&password=br00k11n" | sudo tee -a /usr/local/tomcat/conf/catalina.properties
echo "brooklyn.example.db.driver=${DB_DRIVER}" | sudo tee -a /usr/local/tomcat/conf/catalina.properties
echo "configured" | sudo tee /usr/local/tomcat/logs/configure_db.log
