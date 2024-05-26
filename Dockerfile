FROM maven:3.8.6-openjdk-18-slim AS build

COPY . .

RUN mvn clean package -Pprod -DskipTests=true

FROM openjdk:18-slim

COPY --from=build /target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]