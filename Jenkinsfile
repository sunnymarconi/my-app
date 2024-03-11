pipeline{
    agent any
    stages{
        stage("Maven Build"){
            when {
                branch "develop"
            }
            steps{
                sh"mvn clean package"
            }
        }
        stage("Deploy to Development"){
            when {
                branch "develop"
            }
            steps{
                echo "Deployed to dev...."
                sh "branch name ${env.BRANCH_NAME}"
            }
        }
        stage("Deployed to qa"){
            when {
                branch "qa"
            }
            steps {
                echo "deploying to qa ...."
                echo "  ${env.BRANCH_NAME} "
                
            }
        }
        stage("deploy to production"){
            when {
                branch "master"
            }
            steps{
                echo "deploying to production..."
            }
        }
    }
}
