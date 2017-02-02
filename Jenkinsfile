node {
    stage "Checkout"
	checkout scm
    stage "Build"
	def buildEnv = docker.image 'my-env'

	buildEnv.inside {
	    echo 'inside my-env build env'
      sh './gradlew clean assembleDebug'
	}
}
