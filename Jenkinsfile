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
                dir('charts/preview') {
                    sh "make preview"
                    sh "jx preview --app $APP_NAME --dir ../.."
                }
            }
        }
        stage('Build Release') {
            when {
                branch 'master'
            }
            steps {
                mavenJxBuild()
                sh "jx step post build --image $DOCKER_REGISTRY/$ORG/$APP_NAME:\$(cat VERSION)"
            }
        }
        stage('Promote to Environments') {
            when {
                branch 'master'
            }
            steps {
                container('maven') {
                    dir('charts/sample-app-api') {
                        sh "jx step changelog --version v\$(cat ../../VERSION)"

                        // release the helm chart
                        sh "jx step helm release"

                        // promote through all 'Auto' promotion Environments
                        sh "jx promote -b --all-auto --timeout 1h --version \$(cat ../../VERSION)"
                    }
                }
            }
        }
    }
    post {
        always {
            logstashSend failBuild: true, maxLines: 1000
            cleanWs()
        }
    }
}
