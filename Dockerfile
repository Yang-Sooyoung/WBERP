# Tomcat + JDK11 기반 이미지 사용
FROM tomcat:9.0-jdk11

# 기존 webapps 제거 (필요 시)
RUN rm -rf /usr/local/tomcat/webapps/*

# WAR 파일 복사
COPY target/WBERP.war /usr/local/tomcat/webapps/ROOT.war

# 포트 설정
EXPOSE 8080

# 톰캣 실행
CMD ["catalina.sh", "run"]
