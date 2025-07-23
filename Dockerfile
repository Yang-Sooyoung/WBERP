# 1단계: Maven 빌드
FROM maven:3.8.6-openjdk-8 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# 2단계: Tomcat에 배포
FROM tomcat:9.0-jdk8-openjdk

ENV JAVA_OPTS="-Xms128m -Xmx512m -XX:+UseSerialGC"

# 불필요한 디폴트 앱 제거
RUN rm -rf /usr/local/tomcat/webapps/* \
           /usr/local/tomcat/logs/* \
           /usr/local/tomcat/temp/* \
           /usr/local/tomcat/work/* \
           /usr/local/tomcat/webapps.dist

COPY --from=build /app/target/ibk-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
