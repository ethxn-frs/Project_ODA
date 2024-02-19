# Image  Rust avec support nightly pour Rocket
FROM rustlang/rust:nightly

# Installation des dépendances pour PostgreSQL et Diesel CLI
RUN apt-get update && apt-get install -y libpq-dev pkg-config libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    cargo install diesel_cli --no-default-features --features postgres

# Répertoire de travail
WORKDIR /usr/src/app

# Copie des fichiers actuel dans le repertoire de travail
COPY . .

# Compilation de l'app en mode release
RUN cargo build --release

# Copie du binaire compilé pour un accès plus facile
RUN cp target/release/blog .

# Exposition port 8000
EXPOSE 8000

# Commande pour exécuter les migrations et run l'application
CMD diesel migration run && ./blog
