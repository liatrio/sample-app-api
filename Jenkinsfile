pipeline {
    agent {
        label "jenkins-maven-java11"
    }
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
