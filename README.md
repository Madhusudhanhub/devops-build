# 🚀 DevOps CI/CD Pipeline for Dockerized React App

This project demonstrates a full DevOps pipeline setup from code commit to production, using:

- 🐙 GitHub (source code version control)
- 🐳 Docker (containerization)
- 🧪 Jenkins (CI/CD automation)
- ☁️ DockerHub (image registry)
- 📊 Prometheus + Grafana (monitoring & alerting)
- 🔔 Email Alerts (on system health)

---

## 🏗️ Tech Stack

| Tool         | Role                                 |
|--------------|--------------------------------------|
| React        | Frontend Application (Static Build)  |
| Docker       | Containerization                     |
| Jenkins      | CI/CD Pipelines                      |
| GitHub       | Source Repo + Webhooks               |
| DockerHub    | Public Image Registry                |
| Prometheus   | Metrics Scraper                      |
| Grafana      | Dashboards + Alerts                  |

---

## 🌐 GitHub Repository

This repo includes:

- `Dockerfile` – to build the image  
- `docker-compose.yml` – for deployment  
- `Jenkinsfile` – for `dev` pipeline (staging)  
- `Jenkinsfile.prod` – for `main` pipeline (production)  
- `deploy.sh` – deploys the app via Docker Compose

---

## 🔁 CI/CD Workflow

### ➤ dev → `devops-build-dev` Pipeline

- Builds image from Dockerfile
- Pushes to DockerHub: `madhusudhan143/devops-build-dev`
- Deploys to EC2 via Docker Compose

### ➤ main → `devops-build-prod` Pipeline

- Builds and tags prod image
- Pushes to DockerHub: `madhusudhan143/devops-build-prod`
- Deploys production container

### ✅ Triggered Automatically via GitHub Webhook

---

## 📊 Monitoring with Prometheus + Grafana

Services are defined via Docker Compose:

- `node_exporter` – exports EC2 system metrics
- `prometheus` – scrapes all metrics
- `grafana` – dashboards and alerting

> Prometheus scrapes every 15s.  
> Grafana dashboard imported via ID `1860`.

### Email Alerts Configured:
- Alert triggers when CPU > 80% for 1 minute
- Emails are sent via Gmail SMTP using Grafana alerting

---

## 🚀 Getting Started

### ✅ Clone the Repo

```bash
git clone https://github.com/Madhusudhanhub/devops-build.git
cd devops-build

