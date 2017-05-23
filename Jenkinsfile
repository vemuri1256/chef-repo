pipeline {
  agent any
  stages {
    stage('print') {
      steps {
        parallel(
          "print": {
            echo 'Hello world '
            
          },
          "error": {
            sleep 20
            
          }
        )
      }
    }
  }
}