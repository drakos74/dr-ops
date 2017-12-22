#!/usr/bin/env bash

source ../../free-servers-private/config/path.properties.sh
source ../../free-servers-private/config/script.properties.sh

remote_server=$1
host_name=$2

user_name=$3

# check parameters

if [ -z "$remote_server" ]; then
 echo "Error: no remote_server ip entered [1] Exiting."
 exit 1
fi

if [ -z "$host_name" ]; then
 echo "Error: no host_name entered [2] Exiting."
 exit 1
fi

if [ -z "$user_name" ]; then
 echo "Error: no user_name entered [3] Exiting."
 exit 1
fi

remote_user_path=/home/$user_name
remote_bin_path=$remote_user_path/bin

echo "Upload/Overwrite remote dirs ... "
scp -rp $local_user_bin_path $user_name@$remote_server:$remote_user_path

echo "Installing Tomcat ... "
ssh $user_name@$remote_server 'bash -s' < $local_user_bin_path/$tomcat_install_script
