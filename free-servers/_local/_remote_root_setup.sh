#!/usr/bin/env bash

source ../../free-servers-private/config/path.properties.sh
source ../../free-servers-private/config/script.properties.sh

remote_server=$1
host_name=$2

# check parameters

if [ -z "$remote_server" ]; then
 echo "Error: no remote_server ip entered [1] Exiting."
 exit 1
fi

if [ -z "$host_name" ]; then
 echo "Error: no host_name entered [2] Exiting."
 exit 1
fi

echo "Upload/Overwrite remote dirs ... "
scp -rp $local_bin_path root@$remote_server:$remote_root_path/
scp -rp $local_config_path root@$remote_server:$remote_root_path/

# TODO : install maven
echo "Executing remotely ... SET_HOSTNAME"
ssh root@$remote_server 'bash -s' < $local_bin_path/$hostname_init_script $host_name
echo "Executing remotely ... CREATE_SELFIE"
ssh root@$remote_server 'bash -s' < $local_bin_path/$hostname_init_script $host_name

echo "Executing remotely ... SET_JAVA"

