#!/bin/sh
echo "Installing MSV Production Server ... "

add-apt-repository universe
apt-get -y update

# install utils
apt-get -y install debconf-utils unzip pwgen git curl

# generate passwords
MASTER_PASS=$(pwgen -c -1 12)
DB_PASS=$(pwgen -c -1 12)

# install LAMP stack
echo "mysql-server mysql-server/root_password password $MASTER_PASS" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MASTER_PASS" | sudo debconf-set-selections
apt-get -y install lamp-server^

# install CMS dependency
phpversion="$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,3)"
if [ $phpversion -lt 70 ]
then
	apt-get -y install php5-gd php5-curl
else
    apt-get -y install php7.0-xml php7.0-zip php7.0-gd php7.0-mbstring php-curl
fi

# install Mod Page Speed
if [ `getconf LONG_BIT` = "64" ]
then
    wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
else
    wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_i386.deb
fi
dpkg -i mod-pagespeed-*.deb
service apache2 restart

# clean up
rm /var/www/html/index.html
rm mod-pagespeed-*.deb

git clone https://github.com/maxsv0/sitograph
cd sitograph

# Copy Sitograph files and enable Apache configuration
sh scripts/install.sh /var/www/html

# Create MySQL database
sh scripts/mysqlcreate.sh root $MASTER_PASS msv $DB_PASS

# done!
echo "Install Successful"
echo "----------------------------------"
echo "MySQL root password:"
echo "$MASTER_PASS"
echo "----------------------------------"
echo "MySQL msv password:"
echo "$DB_PASS"