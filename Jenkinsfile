@Library("sunnylibs") _
pipeline{
    agent any
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
            
        }
        stage("Deploy Tomcat"){
            steps{
                tomcatDeploy("172.31.25.115","ec2-user","Tomcat-Dev")
                 
            }
            
        }
    }
}
