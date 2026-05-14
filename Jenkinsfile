pipeline {
    agent any

    stages {
        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i /var/jenkins_home/inventory.ini ${WORKSPACE}/playbook.yml'
            }
        }

        stage('Health Check') {
            steps {
                sh 'ansible-playbook -i /var/jenkins_home/inventory.ini ${WORKSPACE}/healthcheck.yml'
            }
        }
    }

    post {
        failure {
            sh 'ansible-playbook -i /var/jenkins_home/inventory.ini ${WORKSPACE}/rollback.yml'
        }
    }
}
