créer l'image :
> docker build -t *nomimage* .

lister les images créées :
> docker images

Supprimer une image ou la totalité des images :
> docker rmi *nomimageouid*
> docker rmi $(docker images -a -q)
pour forcer :
> docker rmi $(docker images -a -q) -f

lancer le conteneur (ici on ouvre le port 80) :
> docker run -d -p 80:80 --name=*nomconteneur* *nomimage*
lancer le conteneur (ici on ouvre le port 80 et 443) :
> docker run -d -p 80:80 -p 443:443 --name=*nomconteneur* *nomimage*

Vérifie les conteneurs qui tournent et la totalité des conteneurs :
> docker ps
> docker ps -a

Arrêter un conteneur, supprimer un conteneur et supprimer la totalité des conteneurs :
> docker stop *nomconteneurouid*
> docker rm *nomduconteneur*
> docker rm $(docker ps -a -q)

Entrer dans le conteneur :
> docker exec -ti *nomconteneurouid* bash

lancer un conteneur en desactivant l'index :
> docker run -d -p 80:80 -p 443:443 --env INDEX="OFF" --name=*nomconteneur* *nomimage*

lancer le conteneur sous linux (appler localhost:9090 et retaper localhost au lieu de ft_Server en https)
> > docker run -d -p 9090:80 -p 443:443 --name=*nomconteneur* *nomimage*
