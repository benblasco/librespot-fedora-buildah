pipeline {
    environment {
        repoUrl = "https://github.com/benblasco/librespot-fedora-buildah.git"
    }
    agent any
    stages {
        stage('Check') {
            steps {
                echo 'Ben is identifying node'
            }
        }
        stage('Clone') {
            steps {
                echo 'Ben is cloning the repo'
                sh 'mkdir -p build'
                dir('build') {
                    git url: repoUrl
                }
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