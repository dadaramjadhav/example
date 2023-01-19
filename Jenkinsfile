pipeline {
    // agent {
    //     docker {
    //         image 'maven'
    //     }
    // }
    agent any
    tools {
        maven 'maven'
        jdk 'jdk-11'
    }
    
    stages {
        stage('checkout code') {
             steps {
                 git branch: 'main', credentialsId: 'github', url: 'git@github.com:dadaramjadhav/example.git'
            }
        }
        stage('build code') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('build dokcer image ') {
            steps {
                sh 'docker build -t dadaramjadhav/example .'
            }
        }
        stage('push dokcer image ') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerPassword', variable: 'dockerPassword')]) {
                        sh "docker login -u dadaramjadhav -p ${env.dockerPassword}"
                        sh 'docker push dadaramjadhav/example'
                    }
                }
            }
        }
    }
}
