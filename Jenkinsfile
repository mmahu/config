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
                sh './gradlew clean assemble -PbuildNumber=1.0.$BUILD_NUMBER'
            }
        }
        stage('imaging') {
            steps {
                sh 'docker build . -t mmahu-main:5000/mmahu-config:1.0.$BUILD_NUMBER'
                sh 'docker push mmahu-main:5000/mmahu-config'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker service rm mmahu-config || true'
                sh 'docker service create --limit-memory 512M --network dev --hostname mmahu-config --no-resolve-image --replicas 1 --name mmahu-config -p 8080:8080  mmahu-main:5000/mmahu-config:1.0.$BUILD_NUMBER'
            }
        }
    }
}