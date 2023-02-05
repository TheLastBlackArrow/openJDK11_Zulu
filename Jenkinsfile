node ('pi1_agent') {
    stage('Checkout repo') {
        // Get some code from a GitHub repository
        git branch: "$GIT_BRANCH", changelog: false, credentialsId: 'pi1', poll: false, url: "$GIT_URL"
    }
    stage('Build') {
        // Run the docker build
        if (isUnix()) {
            sh 'docker build .'
        }
    }
}
