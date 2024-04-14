FROM tomcat:9-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY /opt/jenkins-slave/workspace/paac1/target/Example-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
