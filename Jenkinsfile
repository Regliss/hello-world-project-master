pipeline {
  environment {
    registry = "raedbensaid1/hello-kubernetes"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  agent any

  stages {
    stage('Git checkout') {
      steps {
         checkout scm
      }
    }
    
    stage('Building image') {
      steps{
  
          script {
           dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Publish Image ') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push("latest")
          }
           echo "trying to push Docker Build to DockerHub"
        }
      }
    }

    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
/**
  stage('Deploy app to kubernetes') {
    steps {
    sshagent(['k8s_ssh']){
			sh 'scp -o StrictHostKeyChecking=no yaml/hello-deployment.yaml raed@192.168.99.100:~/'
			sh 'scp -o StrictHostKeyChecking=no yaml/hello-service.yaml raed@192.168.99.100:~/'			
			script {
				
					sh "ssh -o StrictHostKeyChecking=no raed@192.168.99.100 kubectl apply -f hello-deployment.yaml" 
          sh "ssh -o StrictHostKeyChecking=no raed@192.168.99.100 kubectl apply -f hello-service.yaml"
				
       }    
      
}
  
    
  steps {
			dir ('/hello-kubernetes/yaml/') 
        sh "kubectl --kubeconfig=C:\\Users\\raed\\.kube\\config apply -f hello-deployment.yaml"
				
				sh "kubectl --kubeconfig=C:\\Users\\raed\\.kube\\config apply -f hello-service.yaml"
			}

    


}
    
  steps {
			dir ('hello-kubernetes/yaml/') {
        sh "kubectl  apply -f hello-deployment.yaml"
				
				sh "kubectl  apply -f hello-service.yaml"
			}

}

  }
  */
}
  
}