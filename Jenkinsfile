pipeline {
    agent any


    options {
        timeout(time: 5, unit: 'MINUTES')
    }

    environment {
        ARTIFACT_ID = "cappie10/Lab_devopsjr:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
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