## Build stage
FROM maven:3.9.9-eclipse-temurin-11-alpine as build
WORKDIR /app
COPY . .
RUN mvn install -DskipTests
## Run stage
FROM eclipse-temurin:11-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
## End
