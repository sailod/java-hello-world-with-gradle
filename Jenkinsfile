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