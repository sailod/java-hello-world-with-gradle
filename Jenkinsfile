pipeline {
  agent {
    kubernetes {
      yamlFile 'KubernetesPod.yaml'
    }
  }
  stages {
    stage('Build') {
      steps {
        container('gradle') {
          sh './gradlew clean && ./gradlew installApp'
        }
        container('docker') {
          sh 'docker build -t docker-registry-1630870070.default:30000/gradle-hello-world:v1 .'
          sh 'docker push docker-registry-1630870070.default:30000/gradle-hello-world:v1'
        }
      }
    }
  }
}