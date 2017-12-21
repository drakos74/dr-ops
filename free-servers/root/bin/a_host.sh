#!/usr/bin/env bash

$hostname=$1

echo "Checking HostName ... $hostname"

source /root/config/path.properties.sh

# creates $host_name_ok property
source /root/bin/test/__test_hostname.sh $hostname

if [ "$host_name_ok" = 1 ]; then
    source /root/config/os.properties.sh

    # https://www.centosblog.com/script-update-centos-linux-servers-hostname/
    old_hostname="$( hostname )"
    new_hostname="$1"

    if [ -z "$new_hostname" ]; then
     echo "Error: no hostname entered. Exiting."
     exit 1
    fi

    echo "Changing hostname from $old_hostname to $new_hostname..."
    hostname "$new_hostname"


    echo "Changing hostname in $sys_network_config_file..."
    # CentOs
    sed -i "s/HOSTNAME=.*/HOSTNAME=$new_hostname/g" $sys_network_config_file
    # Debian
    # cat $new_hostname > $sys_network_hostname_file

    echo "Changing hostname in $hosts_file..."
    if [ -n "$( grep "$old_hostname" $hosts_file )" ]; then
     sed -i "s/$old_hostname/$new_hostname/g" $hosts_file
    else
    # if [does not contain already...]
      echo -e "$( hostname -I | awk '{ print $1 }' )\t$new_hostname" >> $hosts_file
    # fi
    fi

    #if ! grep -v -f "$remote_path/$custom_hosts" "$hosts_file";then
    echo "Appending cluster's to $hosts_file..."
    cat $remote_path/$custom_hosts >> $hosts_file
    #fi
fi

echo "Done _host"