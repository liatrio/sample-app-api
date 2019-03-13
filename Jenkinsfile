library 'pipeline-library@ENG-300'

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
        stage('CI Build and push snapshot') {
            when {
                branch 'PR-*'
            }
            environment {
                PREVIEW_VERSION = "0.0.0-SNAPSHOT-$BRANCH_NAME-$BUILD_NUMBER"
                PREVIEW_NAMESPACE = "$APP_NAME-$BRANCH_NAME".toLowerCase()
                HELM_RELEASE = "$PREVIEW_NAMESPACE".toLowerCase()
            }
            steps {
                mavenJxBuild()
            }
        }
        stage('Build Release') {
            when {
                branch 'master'
            }
            steps {
                mavenJxBuild()
            }
        }
        stage('Promote to Environments') {
            when {
                branch 'master'
            }
            steps {
                container('maven') {
                    dir('charts/sample-app-api') {
                        sh "jx step changelog --version $VERSION"

                        // release the helm chart
                        sh "jx step helm release"

                        // promote through all 'Auto' promotion Environments
                        sh "jx promote -b --all-auto --timeout 1h --version $VERSION"
                    }
                }
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
