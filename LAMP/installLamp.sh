#!/bin/bash

# Check for updates
echo "[!] This script can only run by a sudo-user or root."
echo "[*] Checking for Updates..."
sudo apt-get update

# Install Apache
echo "[*] Installing Apache."
sudo apt-get install apache2

echo "[*] Available Network Adapters:"
ifconfig | grep inet | awk '{print $2}'
echo 
echo 

# Install MySQL
echo "[*] Installing MySQL."
echo
sudo apt-get install mysql-server mysql-client

echo "MySQL was installed, please set it up now."
mysql_secure_installation

# Install PHP
echo "Installing PHP."
echo
sudo apt-get install php7.0 libapache2-mod-php7.0 
sudo apt-get install php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext

systemctl restart apache2

sudo apt-get install php7.0-opcache php-apcu

systemctl restart apache2

# Make sure to visit localhost/info.php to verify everything works.
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Fix the god awful permissions errors in /var
echo "==================================="
echo "Fixing permissions for development."
echo "==================================="

dev=""
while [[ $dev == "" ]];
do 
	echo "Please enter the username of the developer:"
	read dev
	adduser $dev www-data
done

chown -R www-data:www-data /var/www/html

# Install PHPmyadmin.
sudo apt-get install phpmyadmin
echo
echo "==========="
echo "Good to go!"
echo "==========="

