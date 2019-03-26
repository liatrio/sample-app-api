library 'pipeline-library'

pipeline {
    agent {
        label "jenkins-maven-java11"
    }
    environment {
        ORG = 'liatrio'
        TEAM_NAME = 'flywheel'
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
        stage("deploy it") {
            steps {
                sendBuildEvent(jobType:'deploy')
            }
        }
    }
    post {
        always {
            cleanWs()
            logstashSend failBuild: false, maxLines: 1
        }
        fixed {
            sendHealthyEvent()
        }
        regression {
            sendUnhealthyEvent()
        }
    }
}
