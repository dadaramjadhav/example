FROM maven
WORKDIR /example
COPY . .
RUN mvn clean  install
COPY ./target/example-1.1.jar example-1.1.jar
ENV server.port=8080
ENTRYPOINT ["java","-jar","example-1.1.jar"]
