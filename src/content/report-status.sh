#!/bin/sh
echo "Gathering Status Report ... "
echo "----------------------------------"

echo "OS info ... "
lsb_release -a
echo "----------------------------------"

echo "Services  ... "
service --status-all
echo "----------------------------------"

echo "Disk  ... "
df -h
echo "----------------------------------"

echo "Webserver ... "
apachectl -v
echo "----------------------------------"

echo "Apache Modules ... "
apache2ctl -M
echo "----------------------------------"

echo "PHP ... "
php -v
echo "----------------------------------"

echo "Database ... "
mysql -V
echo "----------------------------------"

echo "FTP ... "
proftpd --version
echo "----------------------------------"

echo "Time now ... "
date -R
echo "----------------------------------"
 
