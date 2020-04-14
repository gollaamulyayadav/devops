pipeline {
    agent any
    stages {
        stage('Build') { 
             steps {
                sh 'mvn clean package'
        }
        }
        stage('SonarQube analysis') { 
             steps {
                withSonarQubeEnv('sonar') { 
                sh 'mvn sonar:sonar'
                }
        }
        }
        stage ('build image'){
            steps {
           sh 'docker build -t java_app .'
            }
        }
        stage('push '){
            steps{
           sh 'docker push'
      }
        }
        stage('deploy'){
            steps{
        sh 'docker run image'
        }
        }
    }
}

        
