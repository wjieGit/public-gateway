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

    }
}