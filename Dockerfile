FROM maven
WORKDIR /example
COPY . .
RUN mvn clean  install
RUN ls ./target
COPY ./target/example-1.1.jar example-1.1.jar
ENV server.port=8082
ENTRYPOINT ["java","-jar","example-1.1.jar"]