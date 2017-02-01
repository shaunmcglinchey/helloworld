node {
    def workspace = pwd()
    echo "\u2600 workspace=${workspace}"

    stage "Checkout"
	checkout scm
    stage "Build"
	def buildEnvironment = docker.build 'hellokapow'

	buildEnvironment.inside {
	    echo "inside kapow build env"
      sh 'gradlew assembleDebug'
	}
}
