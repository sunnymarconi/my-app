pipeline{
    agent any
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Dokcer Build"){
            steps{
                sh "docker build -t sunnysinha/appimage:${env.BUILD_NUMBER} ."
            }
        }
        stage("Docker push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker-id', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pwd}" 
                    sh "docker push sunnysinha/appimage:${env.BUILD_NUMBER}"
                }
            }
        }
        stage("Deploy to Development-tomcat"){
            when {
                branch "develop"
            }
            steps{
                sh "docker run -d -p 7070:8080 --name dockerCont${env.BUILD_NUMBER} sunnysinha/appimage:${env.BUILD_NUMBER}"
                echo "Branch name-${env.BRANCH_NAME}"
            }
        }
        stage("Deploy to QA-tomcat"){
            when {
                branch "qa"
            }
            steps{
                sshagent(['docker-id']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.17.72 docker run -d -p 8080:8080 --name dockerCont${env.BUILD_NUMBER} sunnysinha/appimage:${env.BUILD_NUMBER}"
                    echo "Branch name-${env.BRANCH_NAME}
                }
            }
        }
    }
}
