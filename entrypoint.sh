#!/bin/bash
CONFIG_FILE=/root/.ipfs/config

if [ ! -f "$CONFIG_FILE" ]; then
  ipfs init --profile flatfs
  ipfs config profile apply server
  sed -i 's/127.0.0.1/0.0.0.0/g' $CONFIG_FILE
else
  rm -f /root/.ipfs/repo.lock
fi

ipfs id
ipfs daemon --enable-gc
