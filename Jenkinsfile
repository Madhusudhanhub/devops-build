pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Jenkins Credentials ID
        IMAGE_NAME = "madhusudhan143/devops-react"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/Madhusudhanhub/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == "master") ? "prod" : "dev"
                    sh "docker build -t ${IMAGE_NAME}:${tag} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == "master") ? "prod" : "dev"
                    sh """
                        echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin
                        docker push ${IMAGE_NAME}:${tag}
                    """
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                echo "✅ Deploy to Production would happen here (via SSH, K8s, or ECS)"
                // You can run an SSH script here to your EC2 server
            }
        } 
    }
}

