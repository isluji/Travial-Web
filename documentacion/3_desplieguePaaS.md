
En este hito, he configurado mi repositorio de GitHub para combinar integración y despliegue continuos. De esta forma, cada ```git push``` envía la nueva versión del código al sistema de integración continua, que se encarga de ejecutar los test. Si esta nueva versión pasa los test, se envía finalmente al PaaS para que despliegue la aplicación.

* Elección de PaaS:

He elegido el servicio Heroku, puesto que tiene un servicio gratuito que es suficiente para

* Configuración de GitHub:

En la cuenta de GitHub no hay que modificar nada, sino que son los otros servicios los que han de conectarse con GitHub mediante opciones o ficheros de configuración.

* Configuración de integración continua:

Esta configuración consiste en un fichero .travis.yml que es el que contiene la infraestructura virtual, indicando a Travis-CI las características del proyecto (lenguaje, dependecias, marco de pruebas), además de la información necesaria para que lance el despliegue en el PaaS en caso de que la aplicación pase los test.

### Enlaces utilizados

- https://docs.travis-ci.com/user/deployment/heroku/
-


https://blog.travis-ci.com/2013-07-09-introducing-continuous-deployment-to-heroku/
