pipeline {
    agent {
        label 'agent-ubuntu'
    }
    stages {
        stage ('build') {
            when {
                  environment NAME: 'DEPLOY_TO', VALUE: 'staging'  
                }
            steps {
                echo "hi"
              }
        }
    }
}
