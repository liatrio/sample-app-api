library identifier: 'lib@master', retriever: modernSCM([
  $class: 'GitSCMSource',
  remote: 'https://github.com/liatrio/pipeline-library.git'
])
library identifier: 'slack-lib@master', retriever: modernSCM([
  $class: 'GitSCMSource',
  remote: 'https://github.com/liatrio/slack-pipeline-library.git'
])

pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        kubernetes {
          label 'jnlp-slave'
          defaultContainer 'jnlp'
        }
      }
      steps {
        sh "echo 'hello world'"
      }
    }
    stage('Promote to Environments') {
      agent {
        kubernetes {
          label 'jnlp-slave'
          defaultContainer 'jnlp'
        }
      }
      steps {
        sh "echo 'hello world'"
      }
    }
    stage("functional test") {
      agent {
        kubernetes {
          label 'jnlp-slave'
          defaultContainer 'jnlp'
        }
      }
      steps {
        sh "echo 'hello world'"
      }
    }
  }
}
