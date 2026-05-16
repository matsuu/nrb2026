# syntax=docker/dockerfile:1

# ============================================================
# Stage 1: Build frontend (SPA)
# ============================================================
FROM node:22-slim AS frontend
WORKDIR /app
COPY frontend/package.json frontend/pnpm-lock.yaml ./
RUN corepack enable && pnpm install --frozen-lockfile
COPY frontend/ .
RUN pnpm build

# ============================================================
# Stage 2: Build webapp binary (Rust)
# ============================================================
FROM ubuntu:24.04


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        mysql-client \
        sudo \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd isucon \
    && useradd -m -s /bin/bash -g isucon isucon \
    && echo 'isucon ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/isucon \
    && mkdir -p /home/isucon/webapp && chown isucon:isucon /home/isucon/webapp

USER isucon

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain none \
    && /home/isucon/.cargo/bin/rustup default stable

WORKDIR /home/isucon/webapp
COPY --chown=isucon:isucon webapp/ ./
RUN /home/isucon/.cargo/bin/cargo build

COPY --chown=isucon:isucon --from=frontend /app/dist public

ENV PATH=/home/isucon/.cargo/bin:/usr/local/bin:/usr/bin:/bin
ENV STATIC_DIR=/home/isucon/webapp/public
ENV SQL_DIR=/home/isucon/webapp/sql
ENV PORT=80

EXPOSE 80
CMD ["/home/isucon/webapp/target/debug/webapp"]
