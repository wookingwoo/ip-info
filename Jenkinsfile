pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                script {
                    // 도커 컴포즈 실행
                    sh 'docker compose up --build -d'
                }
            }
        }
    }
}
