node {
    def workspace = pwd()
    echo "\u2600 workspace=${workspace}"

    stage "Checkout"
	checkout scm
    stage "Build"
	def buildEnv = docker.build 'hellokapow'

	buildEnv.inside {
	    echo 'inside kapow build env'
      sh './gradlew clean assembleDebug'
	}
}
