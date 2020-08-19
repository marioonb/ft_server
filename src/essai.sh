mkdir -p var/www/localhost					#creait un dossier localhost
mv ./default etc/mnginx/sites-available   #mmove default dans le dossier de config linux etc
# le fcihier default se trouve dans etc/nginx/sites-enabled
# Un lien symbolique fait référence à un fichier enregistré ailleurs dans le système.
#Ainsi, si vous demandez à ouvrir nginx/sites-enabled/defaut, le système ouvrira nginx/sites-available/default.
#Vous devez donc :
#créer un nouveau fichier dans sites-available ;
#ajouter un lien symbolique dans sites-enabled grâce à la commande ln.
ln -s /etc/nginx/sites-available/default /etc/nginx/site-enabled
chown -R $USER:$USER /var/www/
chmod -R 755 /var/www/

service nginx start
sleep infinity
