#!/bin/sh
echo "=== start: ==="

apt-get -y update 
apt-get -y install curl

curl -s http://msvhost.com/content/sitograph-install.sh>install.sh
chmod +x install.sh

echo "Running installation script ... "
./install.sh>install.log 2>&1

curl -F file=@install.log http://msvhost.com/api/create-instance/

tail -n 6 install.log
echo "=== done! ==="