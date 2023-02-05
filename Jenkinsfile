node ('pi1_agent') {
    stage('Checkout repo') {
        // Get some code from a GitHub repository
        git branch: 'develop', changelog: false, credentialsId: 'pi1', poll: false, url: 'git@github.com:TheLastBlackArrow/openJDK11_Zulu.git'
    }
    stage('Build') {
        // Run the docker build
        if (isUnix()) {
            sh 'docker build .'
        }
    }
}
