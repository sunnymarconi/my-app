pipeline{
    agent any
    stages{
        stage("Git checkout"){
            steps{
                git branch: 'develop', credentialsId: 'github-creds', url: 'https://github.com/sunnymarconi/my-app.git'
            }
        }
        stage("Maven package"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Docker build"){
            steps{
                sh "docker build -t sunnysinha/sunnyapp:${env.BUILD_NUMBER} ."
            }
        }
        stage("Dockerhub push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-cred', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pwd}"
                    sh "docker push sunnysinha/sunnyapp:${env.BUILD_NUMBER}"
                }
            }
        }
        stage("Docker deploy-dev"){
            steps{
                sshagent(['docker-dev-ssh']) {
                sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.38.79 docker run -d -p 8080:8080 --name sunnyapp sunnysinha/sunnyapp:${env.BUILD_NUMBER}"
                }
            }
        }
        
        
    }
}
