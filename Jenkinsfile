pipeline {
	agent any 
	stages {
		stage('git scm update') {
			steps {
				git url: 'https://github.com/beomtaek/freestyle.git', branch: 'master'
			}
		}
		stage('docker build and push') {
			steps {
				sh '''
				docker build -t 192.168.8.100:5000/webtest:2.0 .
				docker push 192.168.8.100:5000/webtest:2.0
				'''
			}
		}
		stage('deployment and loadbalancer') {
			steps {
				sh '''
				kubectl create deploy pipeweb --image=192.168.8.100:5000/webtest:2.0
				kubectl expose deploy pipeweb --type=LoadBalancer --port=8080 \
				                              --target-port=80 --name=pipeweb-svc
				'''                              
			}
		}
	}
}
