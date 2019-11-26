def name = 'e-config'
def port = '8001:8001'
def registry = 'master:5000'
def buildNumber = '1.0.$BUILD_NUMBER'

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
                sh './gradlew clean assemble -PbuildNumber=${buildNumber}'
            }
        }
        stage('imaging') {
            steps {
                sh 'docker build . -t ${registry}/${name}:${buildNumber}'
                sh 'docker push ${registry}/${name}'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker service rm ${name} || true'
                sh 'docker service create \
                    --limit-memory 512M \
                    --no-resolve-image \
                    --name ${name} \
                    --publish ${port} \
                    ${registry}/${name}:${buildNumber}'
            }
        }
    }
}