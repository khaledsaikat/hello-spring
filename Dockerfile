# Build the jar file
FROM maven:3.6-jdk-8 AS build-env
WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

# Run the jar file on jre
FROM openjdk:8-jre-alpine
COPY --from=build-env /app/target/hello-spring-*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]