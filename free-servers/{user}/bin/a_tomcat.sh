#!/usr/bin/env bash

dr_tomcat_path=tomcat-9
dr_tomcat_version=v9.0.2
dr_tomcat_name=apache-tomcat-9.0.2

tomcat_url=http://www-us.apache.org/dist/tomcat/$dr_tomcat_path/$dr_tomcat_version/bin/$dr_tomcat_name.tar.gz

mkdir ~/Tomcat
cd ~/Tomcat
wget $tomcat_url
tar zxvf $dr_tomcat_name.tar.gz
