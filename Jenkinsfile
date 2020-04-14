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
           sh 'docker build -t java_app .'
        }
        stage('push '){
           sh 'docker push'
      }
        stage('deploy'){
        sh 'docker run image'
        }
    }
}

        
