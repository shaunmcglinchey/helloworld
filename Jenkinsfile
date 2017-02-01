node {
    stage "Checkout"
	checkout scm
    stage "Build"
	def buildEnvironment = docker.build 'hellokapow'
	
	buildEnvironment.inside {
	    echo "inside kapow build env"
	}
}
