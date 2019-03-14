library 'pipeline-library@ENG-311'

pipeline {
    agent {
        label "jenkins-maven-java11"
    }
    environment {
        ORG = 'liatrio'
        TEAM_NAME = 'flywheel'
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
        stage("functional test") {
            steps {
                sh "printenv"
                sendBuildEvent(eventType:'test')
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        fixed {
            sendHealthyEvent()
        }
        regression {
            sendUnhealthyEvent()
        }
    }
}
