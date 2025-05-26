#!/bin/bash
set -e

echo "[+] Stopping old container..."
docker-compose down

echo "[+] Starting new container..."
docker-compose up -d

