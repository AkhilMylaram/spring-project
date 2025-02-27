FROM ubuntu:latest AS base
RUN apt update -y && apt install openjdk-17-jdk maven -y

WORKDIR /app

# Copy the project files to the /app directory
COPY . .

# Ensure the directory and war file exist after build
RUN mvn clean install
RUN ls -l /app/target/  # This will help debug if the WAR file is present

FROM tomcat:9-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the war file from the base stage to the Tomcat webapps folder
COPY --from=base /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
