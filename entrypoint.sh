#!/bin/bash
ipfs init --profile server 2> /dev/null
ipfs id 2> /dev/null
sed -i 's/127.0.0.1/0.0.0.0/g' /root/.ipfs/config
rm -f /root/.ipfs/repo.lock
ipfs daemon
