pipeline {
    agent any
    environment {
        ORG = 'liatrio'
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t sample-app-api .'
            }
        }
        stage('Run Locally') {
            steps {
                sh 'docker image ls'
            }
        }
    }
}
