pipeline {
    agent any
    stages {
        stage("git"){
            steps{
                sh "curl https://raw.githubusercontent.com/iLikeDendy/ORIL/main/Hello.txt -o Hello.txt"
                sh "cat Hello.txt"
            }
        }
    }
}
