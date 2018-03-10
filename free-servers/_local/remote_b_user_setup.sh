#!/usr/bin/env bash

source __config.properties.sh

echo "TODO:Please check if already initilized for every component..."

user_name=$1

if [ -z "$user_name" ]; then
 echo "Error: no user name entered [1] Exiting."
 exit 1
fi

# TODO : call for all servers ...
bash _remote_user_setup.sh $dr_server_1 $dr_host_1 $user_name