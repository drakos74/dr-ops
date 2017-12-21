#!/usr/bin/env bash

java_current=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`