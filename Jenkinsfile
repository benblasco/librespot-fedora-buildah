pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Ben is Building...'
                sh 'uname -a'
            }
        }
        stage('Test') {
            steps {
                echo 'Ben is Testing...'
                sh 'uptime'
                sh 'timedatectl'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Ben is Deploying...'
                sh 'whoami'
            }
        }
    }
}