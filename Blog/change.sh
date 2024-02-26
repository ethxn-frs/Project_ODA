#!/bin/bash

# Chemin vers le fichier .env
chemin_env=".env"

# Vérifier si le fichier .env existe
if [ -f "$chemin_env" ]; then
    # Vérifier si un argument a été fourni
    if [ "$#" -eq 1 ]; then
        # Utiliser l'argument comme nouveau port
        nouveau_port=$1
    else
        echo "Veuillez fournir le nouveau port en argument."
        exit 1
    fi

    # Modifier le port dans le fichier .env en utilisant sed
    sed -i "s/PORT=[0-9]*/PORT=$nouveau_port/" "$chemin_env"

    echo "Le port dans le fichier .env a été mis à jour avec le port $nouveau_port."
else
    echo "Erreur : Le fichier .env n'existe pas dans le répertoire actuel."
fi