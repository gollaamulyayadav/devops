pipeline {
  environment {
    registry = "amulyayadav/dockerhub"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
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
    //stage('Cloning Git') {
      //steps {
        //git 'https://github.com/gollaamulyayadav/devops.git'
      //}
    //}
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
}
    
  
