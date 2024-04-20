FROM alpine

WORKDIR /app

RUN apk add openjdk17-jdk
RUN apk add --update nodejs npm
RUN npm i -g @angular/cli
RUN apk add maven

COPY src/ ./src/
COPY pom.xml .

RUN mvn clean package -DskipTests=true
RUN ls -l
COPY /app/target/*.jar /app/app.jar


ENTRYPOINT [ "java", "-jar", "/app.jar" ]
