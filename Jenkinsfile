pipeline{
    agent any
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Docker Build"){
            steps{
                sh "docker build -t sunnysinha/mavenproj:${env.BUILD_NUMBER} ."
            }
        }
        stage("Docker push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerId', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pwd}"
                    sh "docker push sunnysinha/mavenproj:${env.BUILD_NUMBER}"
                }
            }
        }
        stage("Docker Deploy to PROD"){
            steps{
                sshagent(['docker-id']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.17.72 docker run -d -p 7070:8080 --name mavencontPROD sunnysinha/mavenproj:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
