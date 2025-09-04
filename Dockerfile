# Stage 1: Build the project with Maven
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run on Tomcat
FROM tomcat:9.0-jdk17-temurin
COPY --from=builder /app/target/Tech_Blog.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
