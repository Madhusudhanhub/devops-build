pipeline {
    agent any

    environment {
        IMAGE_NAME = 'madhusudhan143/devops-build-dev:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'dev', url: 'https://github.com/Madhusudhanhub/devops-build.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}

