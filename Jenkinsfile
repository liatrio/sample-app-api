pipeline {
    agent any
    environment {
        ORG = 'liatrio'
        SKAFFOLD_DEFAULT_REPO = 'docker.artifactory.liatr.io/liatrio'
    }
    stages {
        stage('Run Sonar') {
            steps
{                sh 'echo running sonar'
                // Create sonar.properties for sonar maven plugin
                //  withCredentials([string(credentialsId: 'sonarqube', variable: 'sonarqubeToken')]) {
                //    sh "echo 'sonar.login=${sonarqubeToken}' >> sonar.properties"
                //  }
            }
        }
        stage('Build') {
          agent {
            docker {
              image 'docker.artifactory.liatr.io/liatrio/builder-image-skaffold:v1.0.13'
              registryUrl 'https://docker.artifactory.liatr.io'
              registryCredentialsId 'artifactory'
            }
          }
              steps {
                  script {
                  // Create and test image with skaffold
                      sh 'skaffold -p dev build'
                  }
              }
         }
        stage('Run Locally') {
            steps {
                sh 'echo start docker container'
            }
        }
        stage('Run tests locally') {
            steps {
                sh 'echo start docker container'
            }
        }
        stage('deploy to staging') {
            steps {
                sh 'echo staging container'
            }
        }
        stage('Run tests against staging') {
            steps {
                sh 'echo testing against staging'
            }
        }
        stage('Deploy production') {
            steps {
                sh 'echo deploy to production'
            }
        }
    }
}
