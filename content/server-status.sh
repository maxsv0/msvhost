#!/bin/sh
echo "=== status report started ==="

apt-get -y update 
apt-get -y install curl

curl -s http://msvhost.com/content/report-status.sh>status.sh
chmod +x status.sh

echo "Running status reporting script ... "
./status.sh>status.log 2>&1

curl -F file=@status.log http://msvhost.com/api/instance-status/

tail status.log
echo "=== done! ==="