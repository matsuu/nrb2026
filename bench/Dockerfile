# syntax=docker/dockerfile:1

# ============================================================
# Stage 1: Build bench binary (Rust workspace → -p bench)
# ============================================================
FROM rust:1.86-slim-bookworm AS builder
WORKDIR /app

COPY Cargo.toml Cargo.lock rust-toolchain.toml ./
COPY seed-data/ seed-data/
COPY seed-gen/ seed-gen/
COPY bench/ bench/
RUN cargo build --release -p bench

# ============================================================
# Stage 2: Runtime
# ============================================================
FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/bench /usr/local/bin/bench

EXPOSE 9999

CMD ["/usr/local/bin/bench"]
