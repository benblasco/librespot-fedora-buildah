pipeline {
    agent any

    stages {
        stage('Clone') {
            String repoUrl = "https://github.com/benblasco/librespot-fedora-buildah.git"
            steps {
                echo 'Ben is cloning the repo'
                bash 'mkdir -p build'
                dir('build') {
                    git url: repoUrl
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Ben is Building Librespot'
                bash -x 'uname -a'
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