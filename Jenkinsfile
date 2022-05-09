pipeline {
    agent any


    options {
        timeout(time: 5, unit: 'MINUTES')
    }

    environment {
        ARTIFACT_ID = "luisito666/m2-api-rest:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }

    stages {
        
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("${env.ARTIFACT_ID}", "-f ./Dockerfile .") 
                }
            }
        }

        stage('Publish master') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry("", "DockerHubCredentials") {
                        dockerImage.push()
                    }
                }
            }
        }

    }

}