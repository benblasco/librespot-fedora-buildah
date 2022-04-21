pipeline {
    environment {
        repoUrl = "https://github.com/benblasco/librespot-fedora-buildah"
    }
    agent any
    stages {
        stage('Identify build node') {
            steps {
                echo 'Ben is identifying node'
                sh 'hostnamectl'
            }
        }
        stage('Clone Repo') {
            steps {
                echo 'Ben is cloning the repo'
                git url: repoUrl, branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Ben is Building Librespot'
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