FROM alpine

COPY . .

RUN apk add openjdk17-jdk
RUN apk add --update nodejs npm
RUN npm i -g @angular/cli
RUN apk add maven

RUN mvn clean package

COPY target/*.jar app.jar

ENTRYPOINT [ "java", "-jar", "/app.jar" ]