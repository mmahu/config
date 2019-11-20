pipeline {
    agent any
    stages {
        stage('fetch') {
            steps {
                git url: 'https://github.com/mmahu/config.git', branch: 'master'
            }
        }
        stage('build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean assemble'
            }
        }
        stage('imaging') {
            steps {
                sh 'docker build -t mmahu-config:latest .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker run --name="mmahu-config" -p 8001:8080 mmahu-config:latest'
            }
        }
    }
}