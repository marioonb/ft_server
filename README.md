creer l'image :
> docker build -t *nomimage* .

Vérifie si l'image est crée :
> docker images

Supprimer une image ou la totalité des images avec :
> docker rmi *nomimageouid*
> docker rmi $(docker images -a -q)
pour forcer :
> docker rmi $(docker images -a -q) -f

lancer le conteneur (ici on ouvre le port 80) :
> docker run -d -p 80:80 --name=*nomconteneur* *nomimage*

Vérifie les conteneurs qui tournent et la totalité des conteneurs avec :
> docker ps
> docker ps -a

Arrêter un conteneur et arrêter la totalité des conteneurs :
> docker stop *nomconteneurouid*
> docker rm $(docker ps -a -q)

Entrer dans le conteneur :
> docker exec -ti *nomconteneurouid* bash
