pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', credentialsId: 'github-token', url: 'https://github.com/Mukesh-Swami-0612/hello.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('mukesh0612/hello')
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-deploy', url: 'https://index.docker.io/v1/']) {
                        docker.image('mukesh0612/hello').push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
