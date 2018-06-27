#!/bin/sh
if [ -e msv-install.sh ]
  then
    echo "[ERROR] MSV install script (msv-install.sh) already exists."
	exit 1
fi

echo "[OK] Start"

apt-get -y update 
apt-get -y install curl

curl -s http://msvhost.com/content/sitograph-production-install.sh>msv-install.sh
chmod +x msv-install.sh

echo "[OK] Run install script"
./msv-install.sh>msv-install.log 2>&1

tail -n 7 msv-install.log
echo "[OK] Done"

tail -n 1 msv-install.log>msv-mysql-password.txt

exit 0