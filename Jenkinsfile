node {
    def app
    
    stage('Clone repository') { // for display purposes
        cleanWs()
        checkout scm
    }
    stage('Build') {
        app = docker.build "dddmaster/dovecot-postfix"
    }
    
    stage('push') {
        // This step should not normally be used in your script. Consult the inline help for details.
        withDockerRegistry(credentialsId: 'dockerhub') {
            app.push('latest')
        }
    }
}
