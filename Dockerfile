FROM tomcat:9.0-jdk8-openjdk

COPY target/ibk-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
