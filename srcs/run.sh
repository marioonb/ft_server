#CERTIFICAT SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mbelorge/CN=localhost" -keyout ft_server.key -out ft_server.crt
mv ft_server.key /etc/nginx/ssl/
mv ft_server.crt /etc/nginx/ssl/
chmod 600 /etc/nginx/ssl/*

#NGINX
mkdir var/www/localhost
mv default etc/nginx/sites-available/default
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled

chown -R www-data:www-data /var/www/localhost

#config wordpress
rm latest-fr_FR.tar.gz
mv wordpress /var/www/localhost
mv ./wp-config.php /var/www/localhost/wordpress

#config php
rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin

service php7.3-fpm start
service mysql start

if [ "$INDEX" != "ON" ]; then
	sed -i '30 s/on/off/' /etc/nginx/sites-enabled/default
fi

#config MYSQL
echo "CREATE DATABASE BDD_Marion;" | mysql -u root
echo "CREATE USER 'mbelorge'@'localhost' IDENTIFIED BY 'mbelorge';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON BDD_Marion.* TO 'mbelorge'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service nginx start
sleep infinity
