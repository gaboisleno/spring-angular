# Spring Boot with Angular Integration

This project demonstrates the integration of a Spring Boot backend with an Angular frontend.

## Project Structure:

- The Spring Boot application resides in the typical directory structure.
- The Angular project is located within `src/main/webapp` (consider revisiting this placement for separation of concerns).

## Bootstrap Installation:

- 1. Install Bootstrap using npm:

```bash
npm install bootstrap
```

- 2. Update angular.json to include Bootstrap styles and scripts:

```json
"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "src/styles.scss"
],
"scripts": [
  "node_modules/bootstrap/dist/js/bootstrap.min.js"
]
```

## Explanation of Dockerfile Stages:

Dockerfile has three steps inside

- First installs and builds Angular app.
- Second copy `src/main/webapp/dist` Angular folder inside `src/main/resources/static` folder within springboot, and finally build maven project.
- Creates the final image with the Spring Boot JAR and exposes port 8080.

## CI/CD with GitHub Actions:

Create a workflow in your GitHub Actions to automate building and pushing the Docker image to DockerHub.
Store sensitive credentials (DockerHub username and password) as GitHub Secrets for security.

## Serving the Application:

For development purposes, you can run the Spring Boot application directly using

```bash
mvn spring-boot:run
```

and to run Angular

```bash
npm run start
```

To serve my Docker image, I'm using [https://render.com/]
Website where you can deploy, small projects, without any cost.
Only with learning proposes.
