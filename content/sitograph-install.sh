#!/bin/sh
echo "Installing MSV Server ... "

add-apt-repository universe
apt-get -y update 

# install utils
apt-get -y install debconf-utils unzip pwgen git curl 

# generate passwords
MASTER_PASS=$(pwgen -c -1 12)
DB_PASS=$(pwgen -c -1 12)
FTP_PASS=$(pwgen -c -1 12)
ADMIN_PASS=$(pwgen -c -1 12)

# install LAMP stack
echo "mysql-server mysql-server/root_password password $MASTER_PASS" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MASTER_PASS" | sudo debconf-set-selections
apt-get -y install lamp-server^

# create database
mysql -h 127.0.0.1 -uroot -p$MASTER_PASS -e "CREATE USER 'msv'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -h 127.0.0.1 -uroot -p$MASTER_PASS -e "GRANT USAGE ON *.* TO 'msv'@'localhost' IDENTIFIED BY '$DB_PASS' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;"
mysql -h 127.0.0.1 -uroot -p$MASTER_PASS -e "CREATE DATABASE IF NOT EXISTS msv;"
mysql -h 127.0.0.1 -uroot -p$MASTER_PASS -e "GRANT ALL PRIVILEGES ON msv.* TO 'msv'@'localhost';"

# install CMS dependency
phpversion="$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,3)"
if [ $phpversion -lt 70 ]
then
	apt-get -y install php5-gd php5-curl
else
    apt-get -y install php7.0-xml php7.0-gd php7.0-mbstring php-curl
fi

# clone CMS and copy files
git clone https://github.com/maxsv0/sitograph
cp -ar sitograph/src/.  /var/www/html
cp -ar sitograph/src/templates/default/.  /var/www/html/templates/custom/

# install Apache config file
cp sitograph/scripts/sitograph.conf  /etc/apache2/conf-available/
a2enconf sitograph
a2enmod rewrite headers expires deflate
service apache2 restart

# create FTP account
adduser --disabled-password --gecos "" --ingroup www-data devftp  -shell /bin/false -home /var/www 
echo devftp:$FTP_PASS | chpasswd
chown -R devftp:www-data /var/www
find /var/www/html -type d -exec chmod 775 {} \;
find /var/www/html -type f -exec chmod 664 {} \;

# install FTP server
echo "proftpd-basic shared/proftpd/inetd_or_standalone select standalone" | sudo debconf-set-selections
apt-get -y install proftpd-basic  

# generate FTP config file
SERVER_IP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | sed -n '$p')
printf "<Global>
    RootLogin	off
    RequireValidShell off
</Global>
<Limit LOGIN>
    DenyUser !devftp
</Limit>
DefaultRoot  ~
PassivePorts 60000 65000
MasqueradeAddress $SERVER_IP\n">proftpd.conf

# install FTP config file
cp proftpd.conf /etc/proftpd/conf.d/sitograph.conf 
service proftpd restart

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
rm proftpd.conf
rm mod-pagespeed-*.deb 

# done!
echo "Install Successfull"
echo "----------------------------------"
echo "Master Password: $MASTER_PASS"
echo "Mysql MSV Password: $DB_PASS"
echo "FTP Password: $FTP_PASS"
echo "Admin Password: $ADMIN_PASS"
echo "IP: $SERVER_IP"