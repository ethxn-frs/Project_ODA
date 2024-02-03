# Image de rust
FROM rustlang/rust:nightly

# Pour pg
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

# Dir
WORKDIR /usr/src/app

# Pour copier le cs
COPY . .

# Compil
RUN cargo build --release

RUN cp target/release/blog .

# Definir le port ( localhost : 8000)
EXPOSE 8000

# Commande pour exec
CMD ["./blog"]
