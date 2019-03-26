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
                logstashSend failBuild: false, maxLines: 1

            }
        }
        stage('Promote to Environments') {
            when {
                branch 'master'
            }
            steps {
                promoteJx()
                logstashSend failBuild: false, maxLines: 1
            }
        }
        stage("functional test") {
            steps {
                sendBuildEvent(eventType:'test')
                container('maven') {
                    sh "cd functional-tests && mvn clean test -DappUrl=${APP_URL}"
                }
                logstashSend failBuild: false, maxLines: 1
            }
        }
        stage("deploy it") {
            steps {
                sendBuildEvent(jobType:'deploy')
                logstashSend failBuild: false, maxLines: 1
            }
        }
    }
    post {
        always {
            logstashSend failBuild: false, maxLines: 1
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
