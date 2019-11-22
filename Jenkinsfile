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
                sh 'docker build . -t mmahu-main:5000/mmahu-config:latest'
                sh 'docker push mmahu-main:5000/mmahu-config'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker service create --no-resolve-image --name="mmahu-config" -p 8888:8888 mmahu-main:5000/mmahu-config:latest'
            }
        }
    }
}