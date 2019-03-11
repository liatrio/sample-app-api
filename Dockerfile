FROM maven:3-jdk-11 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-stretch
COPY --from=builder /app/target/sample-app-api.jar /app/
EXPOSE 8080
ENTRYPOINT java -jar /app/sample-app-api.jar
