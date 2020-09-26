#CERTIFICAT SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=FR/ST=Paris/L=Paris/O=42/OUmbelorge/CN=localhost" -keyout ft_server.key -out ft_server.crt
mv ft_server.key /etc/nginx/ssl/
mv ft_server.crt /etc/nginx/ssl/
#chmod 600 /etc/nginx/ssl/*
#NGINX
mkdir var/www/localhost
mv default etc/nginx/sites-available/default
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled

chown -R www-data:www-data /var/www/localhost

#SSL
#mv localhost.dev.crt etc/ssl/certs/
#mv localhost.dev.key etc/ssl/private/
#concernant NGINX

# le fcihier default se trouve dans etc/nginx/sites-enabled
# Un lien symbolique fait référence à un fichier enregistré ailleurs dans le système.
#Ainsi, si vous demandez à ouvrir nginx/sites-enabled/defaut, le système ouvrira nginx/sites-available/default.
#Vous devez donc :
#créer un nouveau fichier dans sites-available ;
#ajouter un lien symbolique dans sites-enabled grâce à la commande ln.
#chown -R www-data /var/www/* # -R modifie tous ses sous-répertoires et ses sous-fichiers d'une manière récursive.


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
rm latest-fr_FR.tar.gz
mv wordpress /var/www/localhost
mv ./wp-config.php /var/www/localhost/wordpress

#config php
rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin

service php7.3-fpm start
service mysql start

#config MYSQL
echo "CREATE DATABASE BDD_Marion;" | mysql -u root
echo "CREATE USER 'mbelorge'@'localhost' IDENTIFIED BY 'mbelorge';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON BDD_Marion.* TO 'mbelorge'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service nginx start
sleep infinity
