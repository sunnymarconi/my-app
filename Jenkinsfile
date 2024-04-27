@Library("sunnylibs") _
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
        stage("tomcat deploy development"){
            when {
                branch "develop"
            }
            steps{
                tomcatDeploy("172.31.80.36","ec2-user","tomcat-dev")
            }
        }
        stage("tomcat deploy qa"){
            when {
                branch "qa"
            }
            steps{
                tomcatDeploy("172.31.23.164","ec2-user","tomcat-dev")
            }
        }
    }
}
