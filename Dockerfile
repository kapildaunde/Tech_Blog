# Use Maven to build the project
FROM maven:3.8.8-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use Tomcat to run the app
FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=builder /app/target/Tech_Blog.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
