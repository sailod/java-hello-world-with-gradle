FROM openjdk:8
COPY build/install/HelloWorld /myapp/
WORKDIR /myapp
CMD ["/HelloWorld/bin/HelloWorld"]