#Stage 1

FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /src

COPY . /src

RUN mvn clean install -DskipTests=true

#Stage 2

FROM openjdk:17-alpine

COPY --from=builder /src/target/*.jar src/target/bankapp.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "src/target/bankapp.jar"]
