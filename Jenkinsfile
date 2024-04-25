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
                echo "Deployed to dev...."
                sh "branch name ${env.BRANCH_NAME}"

            }
        }
        stage("Deploy to qa"){
            when {
                branch 'qa'
            }
            steps {
                echo "deploying to qa ...."
                echo "  ${env.BRANCH_NAME} "
            }
        }
        stage("Deploy to production"){
            when {
                branch 'master'
            }
            steps{
                echo "Deployed to production"
                echo "${env.BRANCH_NAME}"
            }
            
        }
    }
}
