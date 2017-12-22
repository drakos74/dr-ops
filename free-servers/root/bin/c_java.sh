#!/usr/bin/env bash

source /root/bin/test/__test_java.sh

setup_host=$1
setup_user_dir=$2
setup_user_file=$setup_user_dir/$setup_host.profile_java

echo "Current java version is $java_current"

if [ "$java_current" == "$dr_java_version" ]; then
 echo "Java version $dr_java_version is already installed"
else
 echo "Installing java version $dr_java_version"
 mkdir $dr_java_install_dir
 cd $dr_java_install_dir
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
echo "Exporting user.profile to $setup_user_file"
echo "export JAVA_HOME=$dr_java_install_dir/$dr_java_version" >> $setup_user_file
echo "export JRE_HOME=$dr_java_install_dir/$dr_java_version/jre" >> $setup_user_file
echo "export PATH=\$PATH:$dr_java_install_dir/$dr_java_version/bin:$dr_java_install_dir/$dr_java_version/jre/bin" >> $setup_user_file
echo "Done _java"
