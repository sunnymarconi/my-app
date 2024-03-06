@Library("sunnylibs") _
pipeline{
    agent any
    stages{
        stage("Checkout Git"){
            steps{
              git branch: 'develop', 
              credentialsId: 'github-creds', 
              url: 'https://github.com/sunnymarconi/my-app.git'  
            }
            
        }
        stage("Maven build"){
            steps{
                sh "mvn clean package"
                echo "Build is successfull"
            }
            
        }
        stage("Deployment"){
            steps{
                deployTomcat("172.31.25.115","ec2-user","Tomcat-Dev")
                echo"${env.BRANCH_NAME}"
                
            }
            
        }
    }
}
