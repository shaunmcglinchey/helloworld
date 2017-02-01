node {
	stage('nodejs'){
		def nodejs = docker.image('node')
		nodejs.inside {
			sh("node --version")
		}
	}
}
