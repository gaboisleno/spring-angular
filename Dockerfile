#Etapa 1: Preparacion del entorno de Angular
FROM node:18 AS frontend
WORKDIR /app
COPY src/main/webapp ./src/main/webapp/
COPY pom.xml .
RUN cd src/main/webapp && npm install && npm run build && pwd

#Etapa 2: Preparacion del entorno de Maven y construccion de la app
FROM maven:3.8.5-openjdk-17 AS maven
WORKDIR /app
COPY src/ ./src/
COPY --from=frontend /app/src/main/webapp/dist /app/src/main/resources/static
COPY pom.xml .
RUN mvn clean package -DskipTests=true

#Etapa 3: Configuracion de la imagen final
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=maven /app/target/*.jar /app/app.jar

ENTRYPOINT [ "java", "-jar", "/app/app.jar" ]
