#!/usr/bin/env bash

# https://www.dotkam.com/2009/03/10/run-commands-remotely-via-ssh-with-no-password/

echo "merging ssh authorized_keys..."

host1=$1
host2=$2

auth_dir=~/Projects/dr-eek/free-servers-private/_local
authorized_keys=$auth_dir/authorized_keys

echo "clear file "$authorized_keys
cat > "$authorized_keys" &
echo "appending authorized_keys_$host1"
cat "$auth_dir/authorized_keys_$host1" >> "$authorized_keys" &
echo "appending authorized_keys_$host2"
cat "$auth_dir/authorized_keys_$host2" >> "$authorized_keys" &

echo "uploading $authorized_keys"
echo "uploading to selfie@$host1:~/.ssh/authorized_keys"
scp -rp "$authorized_keys" selfie@$host1:"~/.ssh/authorized_keys"
echo "uploading to selfie@$host2:~/.ssh/authorized_keys"
scp -rp "$authorized_keys" selfie@$host2:"~/.ssh/authorized_keys"