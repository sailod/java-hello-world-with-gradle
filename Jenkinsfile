pipeline {
  agent {
    kubernetes {
      yamlFile 'KubernetesPod.yaml'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'set'
        sh "echo OUTSIDE_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}"
        container('gradle') {
          sh 'echo MAVEN_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}'
          sh 'gradle init && gradle build && ls'
        }
        container('docker') {
          sh 'echo BUSYBOX_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}'
          sh 'ls'
          sh 'docker build -t test .'
          sh 'docker push test'
        }
      }
    }
  }
}