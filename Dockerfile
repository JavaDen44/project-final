#FROM maven:3.8.1-openjdk-17-jdk-slim as maven-builder
#COPY src /app/src
#COPY pom.xml /app
#RUN mvn -f /app/pom.xml
#RUN mvn clean
#RUN mvn `-Dmaven.test.skip=true package
#FROM openjdk:17-jdk-slim
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} jira-1.0.jar
##COPY --from=maven-builder app/target/jira-1.0.jar /app-service/jira-1.0.jar
##WORKDIR /app-service
##EXPOSE 8080
#ENTRYPOINT ["java","-Dspring.profiles.active=prod","-jar","/jira-1.0.jar"]

#FROM maven:3.8.1-openjdk-17-slim
#WORKDIR /app
#COPY pom.xml .
#RUN mvn dependency:go-offline
#COPY src ./src
#COPY resources ./resources
#RUN mvn clean package -DskipTests
#RUN mv ./target/*.jar ./jira-1.0.jar
#ENTRYPOINT ["java","-jar","/app/jira-1.0.jar", "--spring.profiles.active=prod"]

#FROM openjdk:17-jdk-slim
#VOLUME /main-app
#ADD target/jira-1.0.jar app.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "/app.jar"]

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
#ENTRYPOINT ["java", "-jar", "/jira-1.0.jar"]