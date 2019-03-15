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
                sendBuildEvent(eventType:'test')
                container('maven') {
                    sh "cd functional-tests && mvn clean test -DappUrl=${APP_URL}"
                }
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
