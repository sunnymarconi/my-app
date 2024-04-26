@Library("tomcatlibs") _
pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git branch: 'develop', credentialsId: 'git-id', url: 'https://github.com/sunnymarconi/my-app.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
            post {
              success {
                echo "build was successfully done"
              }
            }
        }
        stage("tomcat deploy"){
            steps{
                tomcatdeploy("172.31.80.36","ec2-user","tomcat-dev")
            }
            input {
              message 'Are you sure?'
              ok 'yes'
            }
        }
    }
}
