pipeline {
  agent {
    docker {
      image "bitriseio/android-ndk"
    }
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
      // git branch: 'main', url: 'https://gitlab.com/beeper/android-sms'
      checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], userRemoteConfigs: [[url: 'git branch: \'main\', url: \'https://gitlab.com/beeper/android-sms\'']]])
    }
    stage('build') {
      sh('./mautrix.sh')
    }

    stage('configure') {
      sh('mkdir -p app/src/main/assets/')
      sh('curl -qs https://github.com/mautrix/imessage/blob/master/example-config.yaml > app/src/main/assets/config.yaml')
    }

    stage('package') {
      sh('./gradlew package')
      sh('find');
    }
  }
}
