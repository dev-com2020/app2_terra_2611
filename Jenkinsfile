pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'automatyka',
                    url: "https://github.com/dev-com2020/app2_terra_2611.git"
            }
        }

        stage("Terraform Init" ) {
            steps {
                sh "terraform init"
            }
        }

        stage("Terraform Plan") {
            steps {
                sh "terraform plan -out=tfplan"
            }
        }

        stage("Terraform Apply") {
            steps {
                sh "terraform apply -auto-approve tfplan"
            }
        }
    }
}