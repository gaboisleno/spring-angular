# Spring-boot with Angular integration

Springboot application, inside `src/main/webapp` there is an Angular project.

### Boostrap instalation

`npm install bootstrap`

Add to angular.json bootstrap files

````
"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "src/styles.scss"
],
"scripts": [
  "node_modules/bootstrap/dist/js/bootstrap.min.js"
]
```

### Dockerfile

Dockerfile has three steps inside

- First installs and build angular app
- Second copy `dist` Angular folder inside `static` folder within springboot, and finally build maven project
- Last step launchs jar packeged project
````
