pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mukesh0612/hello'  // Your DockerHub image
    }

    stages {
        stage('Clone Repo') {
            steps {
                // Explicitly cloning the 'main' branch to avoid branch not found error
                git branch: 'main', url: 'https://github.com/Mukesh-Swami-0612/hello.git'
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
                withDockerRegistry([credentialsId: 'hello', url: '']) {
                    script {
                        docker.image("${IMAGE_NAME}").push("latest")
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "docker rmi ${IMAGE_NAME} || true"
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
