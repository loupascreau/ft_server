FROM	debian:buster

ENV		AUTOINDEX=on

RUN		apt-get -y 	update && apt-get -y install \
					wget \
					unzip \
					nginx \
					mariadb-server \
					php7.3-fpm php7.3-common php7.3-zip php7.3-curl php7.3-xml php7.3-xmlrpc php7.3-json php7.3-mysql php7.3-pdo php7.3-gd php7.3-imagick php7.3-ldap php7.3-imap php7.3-mbstring php7.3-intl php7.3-cli php7.3-recode php7.3-tidy php7.3-bcmath php7.3-opcache

COPY	./srcs/server-conf /etc/nginx/sites-available/my_domain
RUN		ln -s /etc/nginx/sites-available/my_domain /etc/nginx/sites-enabled/my_domain
RUN		rm -rf /etc/nginx/sites-enabled/default

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip
RUN		unzip phpMyAdmin-5.0.2-all-languages.zip -d /var/www/my_domain/
RUN		mv /var/www/my_domain/phpMyAdmin-5.0.2-all-languages /var/www/my_domain/phpmyadmin
COPY	./srcs/config.inc.php /var/www/my_domain/phpmyadmin/	

RUN		wget https://fr.wordpress.org/wordpress-latest-fr_FR.zip
RUN		unzip wordpress-latest-fr_FR.zip -d /var/www/my_domain/
COPY	./srcs/wp-config.php /var/www/my_domain/wordpress/

RUN		chown -R www-data /var/www/*
RUN		chmod -R 755 /var/www/*

COPY	./srcs/script.sh ./

CMD		bash script.sh 
