node {
	stage 'Checkout'
	checkout scm

	stage('nodejs'){
		def nodejs = docker.image('node')
		nodejs.inside {
			sh("node --version")
		}
	}
}
