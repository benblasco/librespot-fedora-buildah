pipeline {
    environment {
        repoUrl = "https://github.com/benblasco/librespot-fedora-buildah"
    }
    agent any
    stages {
        stage('Identify build node') {
            steps {
                echo 'Identify build node'
                sh 'hostnamectl'
            }
        }
        stage('Clone Repo') {
            steps {
                echo 'Clone build repo'
                git url: repoUrl, branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Build Librespot'
                sh 'pwd && buildah unshare bash -x librespot-buildah.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Test the build'
                sh 'uptime'
                sh 'timedatectl'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy artifact'
                sh 'whoami'
            }
        }
    }
}