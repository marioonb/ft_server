
mkdir -p var/www/localhost					#creait un dossier localhost
mv ./default etc/mnginx/sites-available   #mmove default dans le dossier de base


service nginx start
sleep infinity
