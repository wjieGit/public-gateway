pipeline {
    agent any
    environment{
       def dockerPath = tool 'docker' //全局配置里的docker
       def JAVA_HOME = tool 'JAVA_HOME'
       def MAVEN_HOME = tool 'MAVEN_HOME'
       PATH = "${dockerPath}/bin:${env.PATH}:${JAVA_HOME}/bin:${MAVEN_HOME}/bin" //添加了系统环境变量上
       def DEPOSITORY_URL = 'registry.cn-hangzhou.aliyuncs.com'//镜像仓库域名
       def DEPOSITORY_HOST = 'spring-cloud-wjie/gateway'//镜像仓库命名空间
       def DEPOSITORY_NAME= 'login_name'//镜像仓库登录名
       def DEPOSITORY_PWD = 'login_pwd'//远程镜像仓库密码
   }
    stages {
        stage('Checkout') {
             steps {
                echo 'Checkout'
                checkout([$class: 'GitSCM', branches: [[name: '${Tag}']],
                 doGenerateSubmoduleConfigurations: false,
                 extensions: [],
                 submoduleCfg: [],
                 userRemoteConfigs: [[credentialsId: '8a44dbd5-79b8-49ec-a336-cb3fd0bfba89',
                 url: 'https://github.com/wjieGit/gateway']]])
             }
        }
        stage('Build') {
            steps {
                echo 'Building'
                sh  'mvn clean package -Dmaven.test.skip=true'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('build and push image') {
            steps {
                echo 'build and push image'
                sh '''
                 docker login --username=${DEPOSITORY_NAME} --password=${DEPOSITORY_PWD}  ${DEPOSITORY_URL}
                 docker build -t ${DEPOSITORY_URL}/${DEPOSITORY_HOST}:${Tag} .
                 docker push ${DEPOSITORY_URL}/${DEPOSITORY_HOST}:${Tag}
                 docker rmi ${DEPOSITORY_URL}/${DEPOSITORY_HOST}:${Tag}
                '''
                echo 'Deploying'
            }
        }
        stage('Deploy to k8s') {
             steps {
                 echo 'Deploy to k8s'

             }
        }
    }
}