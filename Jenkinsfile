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
          sh './gradlew build && ls'
        }
        container('docker') {
          sh 'echo BUSYBOX_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}'
          sh 'ls'
          sh 'docker build -t docker-registry-1630870070.default:30000/gradle-hello-world:v1 .'
          sh 'docker push docker-registry-1630870070.default:30000/gradle-hello-world:v1'
        }
      }
    }
  }
}