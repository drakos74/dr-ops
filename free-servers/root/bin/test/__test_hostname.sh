#!/usr/bin/env bash

# TODO : check also host files etc ...

if [ "$hostname" = "$1" ] || [ "$HOSTNAME" = "$1" ]; then
 echo "OK: Hostname == "$1
 host_name_ok=0
else
 echo "ERROR: Hostname != "$1
 host_name_ok=1
fi