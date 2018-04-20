#!/usr/bin/env groovy
node('docker') {
    stage 'Building image'
        checkout scm
        def image = docker.build "zappa"
    stage 'Push Image'
        docker.withRegistry("https://490553117019.dkr.ecr.us-east-1.amazonaws.com") {
            image.push("${env.BUILD_TAG}")
            if (env.BRANCH_NAME == 'master') {
                image.push("latest")
            }
        }
}