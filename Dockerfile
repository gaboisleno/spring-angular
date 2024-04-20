FROM alpine

VOLUME /tmp

RUN apk add openjdk17-jdk
RUN apk add --update nodejs npm
RUN npm i -g @angular/cli
RUN apk add maven

COPY src ./src
COPY pom.xml .

RUN mvn clean package

COPY target/*.jar app.jar

ENTRYPOINT [ "java", "-jar", "/app.jar" ]