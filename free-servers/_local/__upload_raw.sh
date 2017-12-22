#!/usr/bin/env bash

source __upload_config.sh

echo "Uploading script : "$local_file
scp -rp $local_file $remote_user@$dr_server_1:$remote_dir