#!/usr/bin/env bash

source /root/config/config.properties.sh

source /root/bin/test/__test_java.sh

if [ "jdk$java_current" == "$dr_java_version" ]; then
 echo "Java version $dr_java_version is already installed"
else
 echo "Installing java version $dr_java_version"
 mkdir /opt/java
 cd /opt/java
 wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$dr_java_remote$dr_java_jdk.tar.gz"
 tar xzf $dr_java_jdk.tar.gz
 rm $dr_java_jdk.tar.gz
 cd $dr_java_version/
 update-alternatives --install /usr/bin/java java /opt/java/$dr_java_version/bin/java 100
 update-alternatives --config java
 # optional
 update-alternatives --install /usr/bin/javac javac /opt/java/$dr_java_version/bin/javac 100
 update-alternatives --config javac
 update-alternatives --install /usr/bin/jar jar /opt/java/$dr_java_version/bin/jar 100
 update-alternatives --config jar
fi
# TODO : append JAVA_HOME to etc/environment ... TODO !!!
# create .profile sample
echo "export JAVA_HOME=/opt/java/$dr_java_version" >> $setup_selfie
echo "export JRE_HOME=/opt/java/$dr_java_version/jre" >> $setup_selfie
echo "export PATH=\$PATH:/opt/java/$dr_java_version/bin:/opt/java/$dr_java_version/jre/bin" >> $setup_selfie
echo "Done _java"
