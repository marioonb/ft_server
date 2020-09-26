#installation pile LEMP  (linux, nginx,  maria db, php)
FROM debian:buster

RUN apt-get update \
	&& apt-get -y install nginx \
	wget \
	mariadb-server mariadb-client \
	php-fpm php-mysql \
	vim

# installation de php my admin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& tar -zxf phpMyAdmin-4.9.0.1-all-languages.tar.gz

# installation de wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz \
	&& tar -xzf latest-fr_FR.tar.gz

COPY srcs/essai.sh ./
COPY srcs/wp-config.php ./
COPY srcs/default ./


CMD bash /essai.sh
