# Créer un Dockerfile pour cette application en mode production

# Utilisation de l'image Node.js
FROM node:lts

# Création du répertoire de travail dans l'image Docker
WORKDIR /app

# Copie des fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installation des dépendances
RUN npm install --save --quiet

# Copie de tout le contenu du répertoire actuel dans le répertoire de travail de l'image Docker
COPY . .

# Exposition du port 3000 pour le serveur Vite.js
EXPOSE 5173

# Commande de démarrage de l'application Vite.js
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
