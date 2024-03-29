pipeline {
    agent {
        label 'linux'
    }
    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
    }
    stages {
        stage('Workspace cleanup') {
            steps {
                cleanWs()
            }
        }
        stage('Git clone') {
            steps {
                git branch: 'main', url:'https://github.com/Veeresh2708/springboot.git'
            }
        }
        stage('build') {
            steps {
                sh '${MAVEN_HOME}/bin/mvn clean package -DskipTests=true'
                archive 'target/*.jar'
            }
        }
        stage('Unit Tests') {
            steps {
                sh '${MAVEN_HOME}/bin/mvn test jacoco:report'
            }
            post {
                always {
                junit 'target/surefire-reports/*.xml'
                jacoco execPattern: 'target/jacoco.exec'
                }
            }
        }
    }
}