
pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'public.ecr.aws/k3l8d5s4/jenkinsecr'
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_URI = "${ECR_REPO}:${IMAGE_TAG}"
        KUBECONFIG = '/var/lib/jenkins/.kube/config'
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/nanduanaji/Jenkinsandjava.git'
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                java -version
                mvn -version
                docker --version
                kubectl version --client
                aws --version
                '''
            }
        }

        stage('Build WAR') {
            steps {
                sh '''
                mvn clean package
                ls -ltr target/
                '''
            }
        }

       stage('Login to Public ECR') {
        steps {
            sh '''
            aws sts get-caller-identity
    
            aws ecr-public get-login-password \
            --region us-east-1 | \
            docker login \
            --username AWS \
            --password-stdin public.ecr.aws
            '''
        }
    }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t ${IMAGE_URI} .
                docker tag ${IMAGE_URI} ${ECR_REPO}:latest
                '''
            }
        }

        stage('Push Image To ECR') {
            steps {
                sh '''
                docker push ${IMAGE_URI}
                docker push ${ECR_REPO}:latest
                '''
            }
        }

        stage('Deploy To Kubernetes') {
            steps {
                sh '''
                export KUBECONFIG=/var/lib/jenkins/.kube/config

                kubectl apply -f deploymentjava.yaml
                kubectl apply -f servicelb.yaml

                kubectl set image deployment/java-app \
                java-app=${IMAGE_URI} --record=true

                kubectl rollout status deployment/java-app --timeout=180s
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                export KUBECONFIG=/var/lib/jenkins/.kube/config

                kubectl get deployment
                kubectl get pods -o wide
                kubectl get svc
                '''
            }
        }
    }

    post {
        success {
            echo 'Build, Push and Deployment Successful'
        }

        failure {
            echo 'Pipeline Failed'
        }

        always {
            sh 'docker image prune -f || true'
        }
    }
}

