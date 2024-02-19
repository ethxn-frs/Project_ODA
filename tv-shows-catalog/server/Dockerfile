# Créer un Dockerfile pour cette application en mode production

# Image de Node.js
FROM node:lts

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie des packages dans le répertoire
COPY package*.json ./

# Installer les dépendances
RUN npm install --quiet --save

# Copier tous les fichiers dans le répertoire de travail
COPY . .

# Construire l'app Next.js
RUN npm run build

# Exposer port 3000
EXPOSE 3000

# Commande pour démarrer l'app
CMD ["npm", "start"]