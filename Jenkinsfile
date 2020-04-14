pipeline {
    environment {
        registry = "amulyayadav/dockerdemo"
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
        stage ('build image'){
            steps {
                script{
                    DockerImage = docker.build registry + ":$Build_Number"
            }
        }
        }
        stage('push '){
            steps{
                Script{
                    docker.withRegistry('',registryCredential){
                        dockerImage.push()
                    }
                }
            }
          
        }
    }

}   
