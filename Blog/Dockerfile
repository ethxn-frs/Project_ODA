# Image de base Rust avec support de nightly pour Rocket
FROM rustlang/rust:nightly

# Installation des dépendances nécessaires pour PostgreSQL et Diesel CLI
RUN apt-get update && apt-get install -y libpq-dev pkg-config libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    cargo install diesel_cli --no-default-features --features postgres

# Répertoire de travail
WORKDIR /usr/src/app

# Copie du code source dans le conteneur
COPY . .

# Compilation de l'application en mode release
RUN cargo build --release

# Copie du binaire compilé pour un accès plus facile
RUN cp target/release/blog .

# Exposition du port
EXPOSE 8000

# Commande pour exécuter les migrations et démarrer l'application
CMD diesel migration run && ./blog
