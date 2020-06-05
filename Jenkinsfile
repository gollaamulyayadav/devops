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
               sh 'mvn package'
        }
        }
     //stage('SonarQube analysis') { 
       //      steps {
         //       withSonarQubeEnv('sonar') { 
           //     sh 'mvn clean package sonar:sonar'
             //   }
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

   ! 
  
