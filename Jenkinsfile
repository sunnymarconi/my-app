pipeline{
    agent any
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Docker build"){
            steps{
                sh "docker build -t sunnysinha/tomcatapp:v1 ."
            }
        }
        stage("Docker Push"){
            steps{
                echo "Pushing to Docker hub"
            }
        }
        stage("Deploy to Development"){
            when {
                branch 'develop'
            }
            steps{
                echo "Deployed to Development"
            }
        }
        stage("Deploy to qa"){
            when {
                branch 'qa'
            }
            steps{
                echo "Deployed to qa"
            }
        }
        stage("Deploy to production"){
            when {
                branch 'master'
            }
            steps{
                echo "Deployed to production"
            }
            
        }
    }
}
