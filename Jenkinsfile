pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mukesh0612/hello'  // ✅ Your DockerHub image name
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Mukesh-Swami-0612/hello.git'  // ✅ Your GitHub repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub-credentials', url: '' ]) {
                    script {
                        docker.image("${IMAGE_NAME}").push("latest")
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "docker rmi ${IMAGE_NAME}"
            }
        }
    }
}
