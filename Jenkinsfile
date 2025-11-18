pipeline {
    agent any

    environment {
        # MongoDB connection string
        MONGO_URI      = 'mongodb://mongo:27017/chatcall'
        SESSION_SECRET = 'your_random_session_secret'   
        IMAGE_NAME     = "chatcall-app"
        IMAGE_TAG      = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/1996sachin/chatcall.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Docker Build (Multi-Stage)') {
            steps {
                sh """
                docker build --build-arg NODE_ENV=production -t $IMAGE_NAME:$IMAGE_TAG .
                """
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                docker compose down
                docker compose up -d --build
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
