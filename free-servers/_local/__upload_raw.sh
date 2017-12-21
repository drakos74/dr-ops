#!/usr/bin/env bash

 echo "Uploading init script "$init_sh
  scp -rp $mirror_path""$init_sh root@$remote_host:$remote_path"init/"$init_sh
  echo "Uploading test script "$test_sh
  scp -rp $mirror_path""$test_sh root@$remote_host:$remote_path"init/"$test_sh