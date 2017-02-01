node {
    stage "Checkout'
	checkout scm
	def buildEnvironment = docker.build 'hellokapow'
	
	buildEnvironment.inside {
	    echo "inside kapow build env"
	}
}
