#installation pile LEMP  (linux, nginx,  maria db, php)
FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN apt-get install -y wget
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline

# installation de php my admin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
#&& mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin \
#&& mv ./config.inc.php var/www/localhost/phpmyadmin \
#&& RUN curl -LO "https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz" \
#&& tar -xzf phpMyAdmin-4.9.4-all-languages.tar.gz -C /usr/local --strip-components=1 \
# && rm phpMyAdmin-4.9.4-all-languages.tar.gz
# installation de wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -xzf latest-fr_FR.tar.gz
#&& mkdir var/www/localhost/wordpress \
#&& cp -a wordpress/. /var/www/localhost/wordpress \
#&& mv ./wp-config.php /var/www/localhost/wordpress \
COPY src/essai.sh ./
#COPY srcs/wp-config.php ./
#COPY srcs/config.inc.php ./
#COPY srcs/default ./
#COPY src/essai.sh ./

CMD bash /essai.sh
#service php7.3-fpm start
#service mysql start

EXPOSE 80
EXPOSE 443


