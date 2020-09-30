FROM debian:buster

# Installation pile LEMP  (linux, nginx,  maria db, php)
RUN apt-get update \
	&& apt-get -y install nginx \
	wget \
	mariadb-server mariadb-client \
	php-fpm php-mysql \
	vim

# Installation de phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& tar -zxf phpMyAdmin-4.9.0.1-all-languages.tar.gz

# Installation de wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz \
	&& tar -xzf latest-fr_FR.tar.gz

COPY srcs/run.sh ./
COPY srcs/wp-config.php ./
COPY srcs/default ./

ENV INDEX ON

CMD bash /run.sh
