pipeline {
  agent any
  stages {
    stage('print') {
      steps {
        parallel(
          "print": {
            echo 'Hello world '
            
          },
          "": {
            sleep 20
            sh 'echo "Hello World"'
            timestamps() {
              sh 'echo "thisis last"'
            }
            
            
          }
        )
      }
    }
  }
}