# Créer un Dockerfile pour cette application en mode production

# Image Node.js
FROM node:lts

# Répertoire pour l'image Docker
WORKDIR /app

# Copie des packages dans le repertoire
COPY package*.json ./

# Installation des dépendances
RUN npm install --save --quiet

# Copie de tout le contenu dans le repertoire
COPY . .

# Exposition port 3000 serveur Vite.js
EXPOSE 5173

# Commande de démarrage de l'app Vite.js
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
