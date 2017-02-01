node {
	stage 'Checkout'
	checkout scm

	stage('nodejs'){
		def buildEnv = docker.build('hellokapow')
		buildEnv.inside {
		   echo "inside kapow build env"
		}
	}
}
