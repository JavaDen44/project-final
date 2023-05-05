FROM maven:3.8.1-openjdk-17-slim AS maven-builder
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
RUN mkdir /app
COPY --from=maven-builder app/target/jira-1.0.jar /jira-1.0.jar
WORKDIR /app
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "/jira-1.0.jar"]
