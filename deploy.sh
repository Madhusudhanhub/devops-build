#!/bin/bash
set -e

echo "[+] Stopping and removing old container if exists..."
docker stop react-static-site || true
docker rm -f react-static-site || true
docker-compose down || true

echo "[+] Starting new container..."
docker-compose up -d

