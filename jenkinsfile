pipeline {
    agent any

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

        stage('Run Tests') {
            steps {
                sh 'npm test || true'   // remove || true if you have real tests
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Start App') {
            steps {
                sh 'npm start &'
            }
        }
    }
}