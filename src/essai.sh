#CERTIFICAT SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout ft_server.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OUmbelorge/CN=localhost"
mv ft_server.key /etc/nginx/ssl/
mv ft_server.crt /etc/nginx/ssl/
chmod 600 /etc/nginx/ssl/*
#NGINX
mkdir var/www/localhost
mv default etc/nginx/sites-available/default
#ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
#chown -R www-data /var/www/*
#chmod -R 755 /var/www/*

#SSL
#mkdir /etc/nginx/ssl
#openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/L=PARIS/OU=mbelorge/O=42Paris/CN=localhost" -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key
#openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"
#chmod 600 localhost.dev.*
#mv localhost.dev.crt etc/ssl/certs/
#mv localhost.dev.key etc/ssl/private/
#concernant NGINX
#mkdir -p var/www/localhost					#creait un dossier localhost
#mkdir var/www/localhost
#mv ./default etc/nginx/sites-available   #mmove default dans le dossier de config linux etc
#vim etc/nginx/sites-available/default
# le fcihier default se trouve dans etc/nginx/sites-enabled
# Un lien symbolique fait référence à un fichier enregistré ailleurs dans le système.
#Ainsi, si vous demandez à ouvrir nginx/sites-enabled/defaut, le système ouvrira nginx/sites-available/default.
#Vous devez donc :
#créer un nouveau fichier dans sites-available ;
#ajouter un lien symbolique dans sites-enabled grâce à la commande ln.
#ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
#chown -R www-data /var/www/* # -R modifie tous ses sous-répertoires et ses sous-fichiers d'une manière récursive.
#chmod -R 755 /var/www/* #domer es droit ecr, lec, exe a tous les repertoire etc...
#www-data est l'utilisateur que les serveurs Web sur Ubuntu (Apache, nginx, par exemple) utilisent par défaut
#pour un fonctionnement normal. Le processus du serveur Web peut accéder à tous les fichiers auxquels www-data peut accéder.
#Cela n'a pas d'autre importance.
# 755 -> RWXR-XR-X


#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key
#-out /etc/ssl/certs/nginx-selfsigned.crt < /etc/ssl.txt
#* openssl *: Il s’agit de l’outil de ligne de commande de base pour la création et la gestion de certificats OpenSSL,
#de clés et d’autres fichiers.
# * req *: Cette sous-commande indique que nous souhaitons utiliser la gestion de la demande de signature de certificat X.509.
#«X.509» est une norme d’infrastructure à clé publique à laquelle SSL et TLS adhèrent pour la gestion de ses clés
# et de ses certificats.
#* -nodes *: Ceci indique à OpenSSL de sauter l’option permettant de sécuriser notre certificat
#avec une phrase secrète. Nginx doit pouvoir lire le fichier, sans intervention de l’utilisateur,
# au démarrage du serveur. Un mot de passe empêcherait cela, car nous devions le saisir après chaque redémarrage.
#* -days 365 *: Cette option définit la durée pendant laquelle le certificat sera considéré comme valide.
#Nous le fixons pour un an ici.
#* -newkey rsa: 2048 *: Ceci spécifie que nous voulons générer un nouveau certificat et une nouvelle clé en même temps.
# Nous n’avons pas créé la clé requise pour signer le certificat lors d’une étape précédente. Nous devons donc le créer avec
# le certificat. La partie + rsa: 2048 + lui dit de créer une clé RSA de 2048 bits.
# * -keyout *: Cette ligne indique à OpenSSL où placer le fichier de clé privée généré que nous sommes en train de créer.
# * -out *: Ceci indique à OpenSSL où placer le certificat que nous créons.
# Nous voulons créer un nouveau certificat X.509, nous utilisons donc cette sous-commande.

#config wordpress
cp -a wordpress/. /var/www/localhost/wordpress
mv ./wp-config.php /var/www/localhost/wordpress
chown www-data:www-data /var/www/html/wordpress


#config php
rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin
#config MYSQL
mysql < /var/www/wordpress/phpmyadmin/sql/create_tables.sql -u root
echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'mbelorge'@'localhost' IDENTIFIED BY 'mbelorge';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
#setup wordpress
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mbelorge'@'localhost' IDENTIFIED BY 'mbelorge';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "ALTER USER 'mbelorge'@'localhost' IDENTIFIED BY 'mbelorge';" | mysql -u root

service nginx start
#service nginx status
service php7.3-fpm restart
service nginx restart
service mysql start
#mysql -uroot < /etc/mysql.txt
#service php7.3-fpm restart
sleep infinity
