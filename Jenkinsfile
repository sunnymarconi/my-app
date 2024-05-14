pipeline{
    agent any
    stages{
        stage("Git Checkout"){
              steps{
                  git branch: 'develop', credentialsId: 'git-id', url: 'https://github.com/sunnymarconi/my-app.git'
              }
        }
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
        stage("Docker Deploy to QA"){
            steps{
                sshagent(['docker-id']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.17.72 docker run -d -p 8080:8080 --name mavencontQA-${env.BUILD_NUMBER} sunnysinha/mavenproj:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
