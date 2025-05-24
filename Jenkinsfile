pipeline {
    agent any
    environment {
        IMAGE_NAME_PUBLIC  = "madhusudhan143/devops-react"
        IMAGE_NAME_PRIVATE = "madhusudhan143/devops-react-private"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Running on branch: ${env.BRANCH_NAME}"
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/Madhusudhanhub/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == "main") ? "prod" : "dev"
                    sh "docker build -t ${IMAGE_NAME_PUBLIC}:${tag} ."
                }
            }
        }

        stage('Push to Docker Hub - Public') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == "main") ? "prod" : "dev"
                    sh """
                        echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin
                        docker push ${IMAGE_NAME_PUBLIC}:${tag}
                    """
                }
            }
        }

        stage('Push to Docker Hub - Private') {
            steps {
                script {
                    def tag = (env.BRANCH_NAME == "main") ? "prod" : "dev"
                    sh """
                        docker tag ${IMAGE_NAME_PUBLIC}:${tag} ${IMAGE_NAME_PRIVATE}:${tag}
                        docker push ${IMAGE_NAME_PRIVATE}:${tag}
                    """
                }
            }
        }

        stage('Deploy') {
            when {
                anyOf {
                    branch 'main'
                    branch 'dev'
                }
            }
            steps {
                sshagent(['ec2-ssh']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@ec2-107-23-54-101.compute-1.amazonaws.com 'cd ~/devops-build && ./deploy.sh'
                    '''
                }
            }
        }
    }
}
