FROM java:8
EXPOSE 8080
ADD target/maven-demo-1.0.0-SNAPSHOT.jar maven-demo.jar
ENTRYPOINT ["java","-jar","maven-demo.jar"]
