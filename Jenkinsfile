node ('pi1_agent') {
    stage('Checkout repo') {
        // checkout code from a GitHub repository
        checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/develop']], extensions: [], userRemoteConfigs: [[credentialsId: 'pi1', url: 'git@github.com:TheLastBlackArrow/openJDK11_Zulu.git']])
    }
    stage('Build') {
        // Run the docker build
        if (isUnix()) {
            sh 'docker build .'
        }
    }
}
