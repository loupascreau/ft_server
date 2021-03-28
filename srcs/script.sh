#!/bin/bash

service mysql start

#config SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/my_domain.pem -keyout /etc/nginx/ssl/my_domain.key -subj "/C=SN/ST=Ziguinchor/L=Ziguinchor/O=42Paris/OU=lpascrea/CN=my_domain"

#config MySQL for wordpress
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

if [[ $AUTOINDEX == "off" ]]
then
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/my_domain
fi

service php7.3-fpm start
service nginx start
bash
