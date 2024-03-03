pipeline{
    agent any
    stages{
        stage("Git checkout"){
            steps{
                git branch: 'develop', credentialsId: 'jenkin-creds', url: 'https://github.com/sunnymarconi/my-app.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
            
        }
        stage("Deploy Tomcat"){
            steps{
                sshagent(['Tomcat-Dev']) {
            // copy war
            sh "scp target/myweb-0.0.9.war ec2-user@172.31.25.115:/opt/tomcat9/webapps"
            sh "ssh ec2-user@172.31.25.115 /opt/tomcat9/bin/shutdown.sh"
            sh "ssh ec2-user@172.31.25.115 /opt/tomcat9/bin/startup.sh"
                }   
            }
            
        }
    }
}
