#!/bin/bash
set -e

IMAGE_NAME="madhusudhan143/devops-build-dev:latest"

echo "[+] Building Docker image..."
docker build -t $IMAGE_NAME .

