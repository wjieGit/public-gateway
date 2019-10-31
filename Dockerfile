FROM hub.c.163.com/library/java:8-alpine
MAINTAINER wjie wangj@ijia120.com
ADD target/gateway-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]