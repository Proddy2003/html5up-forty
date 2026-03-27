# Utiliser l'image officielle Nginx basée sur Alpine
FROM nginx:alpine

# Mettre à jour les paquets pour corriger zlib
# et afficher la version installée pour vérification
RUN apk update && apk upgrade && apk info zlib

# Copier les fichiers statiques dans le répertoire par défaut de Nginx
COPY index.html /usr/share/nginx/html/
COPY elements.html /usr/share/nginx/html/
COPY generic.html /usr/share/nginx/html/
COPY landing.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY images /usr/share/nginx/html/images
COPY LICENSE.txt /usr/share/nginx/html/
COPY README.txt /usr/share/nginx/html/

# Exposer le port 80 (Nginx écoute par défaut sur ce port)
EXPOSE 80

# Commande de démarrage du conteneur
CMD ["nginx", "-g", "daemon off;"]