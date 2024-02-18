# Créer un Dockerfile pour cette application en mode production
# Utiliser l'image de base Node.js
FROM node:lts

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installer les dépendances
RUN npm install --quiet --save

# Copier tous les fichiers du répertoire de l'application local dans le répertoire de travail du conteneur
COPY . .

# Construire l'application Next.js pour la production
RUN npm run build

# Exposer le port 3000 sur le conteneur
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["npm", "start"]