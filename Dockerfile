FROM alpine

RUN apk add openjdk17-jdk
RUN apk add --update nodejs npm
RUN apk add maven

WORKDIR /app

COPY src/ ./src/
COPY pom.xml .


RUN cd /src/main/webapp && \
    npm install && \
    npm run build && \
    cd ../../..

RUN mvn clean package -DskipTests=true

RUN cp target/*.jar /app.jar


ENTRYPOINT [ "java", "-jar", "/app.jar" ]
