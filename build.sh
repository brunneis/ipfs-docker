#!/bin/bash
source env.sh
docker build --build-arg IPFS_VERSION=$IPFS_VERSION -t brunneis/ipfs .
