library 'pipeline-library'

pipeline {
    agent {
        label "jenkins-maven-java11"
    }
    environment {
        ORG = 'liatrio'
        APP_NAME = 'sample-app-api'
        CHARTMUSEUM_CREDS = credentials('jenkins-x-chartmuseum')
    }
    stages {
        stage('Build') {
            steps {
                mavenJxBuild()
            }
        }
        stage('Promote to Environments') {
            when {
                branch 'master'
            }
            steps {
                promoteJx()
            }
        }
        stage('Run functional tests') {
            steps {
                sh "printenv"
            }
        }
    }
    post {
        always {
//            logstashSend failBuild: true, maxLines: 1000
            cleanWs()
        }
    }
}
