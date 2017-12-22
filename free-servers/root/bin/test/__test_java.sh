#!/usr/bin/env bash

source /root/config/config.properties.sh

tmp_java_current=`$dr_java_install_dir/$dr_java_version/bin/java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
java_current="jdk-$tmp_java_current"