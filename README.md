# tpDockerDevOps

## 1 - Installer Docker et Docker-Compose
J'ai installé Docker Desktop qui comprend le DOcker-Compose
## 2 - Quelques commandes à tester
Toutes les commandes ont fonctionnés
## 3 - Ressources supplémentaires pour découvrir Docker
J'ai pu faire la Partie 2 : Containerize an application
Après avoir lancé toutes les commandes on a build une application depuis un zip vers un conteneur grâce à un Dockerfile.
## 4 - DÉBUT DU TP
## 5 - Exécuter un serveur web (apache, nginx, …) dans un conteneur docker
### A - Récupérer l’image sur le Docker Hub
J'ai récupéré l'image sur ce site : [Docker](https://hub.docker.com/_/nginx)

Où j'ai pu trouver la commande : `docker pull nginx`

Qui permet d'importer une image.

### B - Vérifier que cette image est présente en local
![graphique verification importation image](./img/localVerif.PNG)

Il est aussi possible de vérifier en ligne de commande grâce à : `docker ps`
### C - Créer un fichier index.html simple
![index html](./img/index.PNG)
### D - Démarrer un conteneur et servir la page html créée précédemment à l’aide d’un volume (option -v de docker run)
![cmd docker run -v](./img/dockerrunv.PNG)
### E - Supprimer le conteneur précédent et arriver au même résultat que précédemment à l’aide de la commande docker cp
![commande+result](./img/ec.PNG)

## 6 - Builder une image
### A - A l’aide d’un Dockerfile, créer une image (commande docker build)
Le Dockerfile :
```console
#image
FROM nginx

#index.html
COPY ./ usr/share/nginx/html/%
```
J'ai lancé la commande en me positionnant la où le Dockerfile était soit dans Documents

La Commande :
```console
C:\Users\garda\Documents>docker build .
[+] Building 0.3s (7/7) FINISHED                                                                         docker:default
 => [internal] load build definition from Dockerfile                                                               0.1s
 => => transferring dockerfile: 102B                                                                               0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                    0.0s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 1.01kB                                                                                0.0s
 => CACHED [1/2] FROM docker.io/library/nginx                                                                      0.0s
 => [2/2] COPY ./ usr/share/nginx/html/%                                                                           0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:ffbb33e50711e4b13d3d163fdd7730d2a2fd57b50fe1d0a2bf72fc8daa6c9ffa                       0.0s

View build details: docker-desktop://dashboard/build/default/default/ptoocvbw6z0ug5zd7n4qltvgm

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
```
### C - Différence

La méthode 5 est préférable pour les tests en raison de sa rapidité, cependant, pour une solution définitive, la méthode 6 est plus appropriée car elle nécessite une manipulation unique. Dans le contexte du développement et des opérations (DevOps) visant à automatiser les tâches récurrentes, nous favoriserons la méthode 6.

## 7 - Utiliser une base de données dans un conteneur docker
### A - Récupérer les images mysql:5.7 et phpmyadmin depuis le Docker Hub
```
docker pull mysql:5.7
docker pull phpmyadmin/phpmyadmin
```
### B - Exécuter deux conteneurs à partir des images et ajouter une table ainsi que quelques enregistrements dans la base de données à l’aide de phpmyadmin
```
docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=password mysql:5.7
```

```
docker run -d --name phpmyadmin-container --link mysql-container:db -p 8080:80 phpmyadmin/phpmyadmin

```
Résultat : 
![insrBd](./img/inserBd.PNG)