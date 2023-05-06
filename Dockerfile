FROM maven:3.8.1-openjdk-17-slim
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY resources ./resources
COPY lombok.config ./lombok.config
COPY config/_application-prod.yaml ./src/main/resources/application-prod.yaml
RUN mvn clean package -DskipTests
RUN mv ./target/*.jar ./jira.jar
RUN rm -rf ./target
RUN rm -rf ./src
WORKDIR /app
ENTRYPOINT ["java", "-jar", "/app/jira.jar", "--spring.profiles.active=prod"]