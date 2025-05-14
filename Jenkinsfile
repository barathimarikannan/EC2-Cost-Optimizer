pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/barathimarikannan/EC2-Cost-Optimizer.git'
      }
    }

    stage('Terraform Init') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials'],
          sshUserPrivateKey(credentialsId: 'my__ssh__key', keyFileVariable: 'SSH_KEY')
        ]) {
          dir('env/dev') {
            sh '''
              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

              # Generate public key file from private key
              ssh-keygen -y -f "$SSH_KEY" > jenkins_key.pub

              terraform init
            '''
          }
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials'],
          sshUserPrivateKey(credentialsId: 'my__ssh__key', keyFileVariable: 'SSH_KEY')
        ]) {
          dir('env/dev') {
            sh '''
              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

              # Ensure public key exists (if not already)
              ssh-keygen -y -f "$SSH_KEY" > jenkins_key.pub

              terraform plan -var-file="terraform.tfvars"
            '''
          }
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials'],
          sshUserPrivateKey(credentialsId: 'my__ssh__key', keyFileVariable: 'SSH_KEY')
        ]) {
          dir('env/dev') {
            sh '''
              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

              # Ensure public key exists (if not already)
              ssh-keygen -y -f "$SSH_KEY" > jenkins_key.pub

              terraform apply -auto-approve -var-file="terraform.tfvars"
            '''
          }
        }
      }
    }
  }
}
