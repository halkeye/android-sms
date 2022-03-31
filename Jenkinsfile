pipeline {
  agent { dockerfile true }
  environment {
    HOME="${WORKSPACE}/.home"
    GOPATH="${WORKSPACE}/.go"
    NDK_ROOT="/opt/android-ndk"
  }
  options {
    skipDefaultCheckout()
    timeout(time: 60, unit: 'MINUTES')
    ansiColor('xterm')
    disableConcurrentBuilds(abortPrevious: true)
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')
  }
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://gitlab.com/beeper/android-sms.git'
        sh 'git submodule init && git submodule update'
      }
    }
    stage('build') {
      steps {
        sh '''
          curl -qs https://raw.githubusercontent.com/halkeye/android-sms/main/mautrix.sh > mautrix.sh
          bash -x ./mautrix.sh
        '''
      }
    }

    stage('configure') {
      steps {
        sh '''
          mkdir -p app/src/main/assets/
          curl -qs https://github.com/mautrix/imessage/blob/master/example-config.yaml > app/src/main/assets/config.yaml
        '''
      }
    }

    stage('package') {
      steps {
        sh '''
          ./gradlew package
          find
        '''
      }
    }
  }
}
