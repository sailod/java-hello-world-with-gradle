pipeline {
    agent {
        docker { image 'gradle:7-jdk' }
    }
    stages {
        stage('Build') {
            steps {
                sh 'gradle build && ls'
            }
        }
    }
}

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
          sh 'gradle build && ls'
        }
        container('docker') {
          sh 'echo BUSYBOX_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}'
          sh 'docker build -t test .'
          sh 'docker push test'
        }
      }
    }
  }
}