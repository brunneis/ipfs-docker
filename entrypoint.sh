ipfs init --profile flatfs
ipfs config profile apply server
sed -i 's/127.0.0.1/0.0.0.0/g' /root/.ipfs/config
rm -f /root/.ipfs/repo.lock
ipfs id
ipfs daemon --enable-gc
