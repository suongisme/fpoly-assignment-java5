FROM openjdk:latest
FROM maven:3.8.1-jdk-11
WORKDIR /home/app
COPY /target/assignment.war /home/app
CMD ["java","-jar","assignment.war","--spring.datasource.username=${MYSQL_USERNAME}","--spring.datasource.password=${MYSQL_PASSWORD}","--spring.datasource.url=${MYSQL_URL}"]