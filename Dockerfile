FROM openjdk:11
COPY build/libs/jb-hello-world-0.1.0.jar /myapp/
WORKDIR /myapp
CMD ["java", "-jar", "/myapp/jb-hello-world-0.1.0.jar"]