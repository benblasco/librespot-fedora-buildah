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
    post {
        always {
            archiveArtifacts artifacts: 'librespot', fingerprint: true
            //mail to: 'team@example.com',
              //subject: "Librespot build result: ${currentBuild.fullDisplayName}",
              //body: "This is what we did ${env.BUILD_URL}"
        }
    }
}