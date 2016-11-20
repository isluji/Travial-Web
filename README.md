# Travial-Web [![Build Status](https://travis-ci.org/isma94/Travial-Web.svg?branch=master)](https://travis-ci.org/isma94/Travial-Web) [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/isma94/Travial-Web) [![Try](./img/tryButton.jpg)](https://travial-web.herokuapp.com/)


## Proyecto para la asignatura Infraestructura Virtual de Ismael Luque Jiménez

Este proyecto participa en el [**certamen de proyectos libres de la UGR**](http://osl.ugr.es/bases-de-los-premios-a-proyectos-libres-de-la-ugr/).


### DESCRIPCIÓN

Este curso voy a realizar como TFG el desarrollo de una aplicación móvil basada en la gamificación para fomentar el turismo en Granada. Como apoyo a esta aplicación, desarrollaré un servicio web complementario en el que los jugadores podrán acceder a las siguientes funcionalidades:

* Acceder a tutoriales que expliquen el funcionamiento del juego
* Consultar sus estadísticas (lugares visitados, porcentaje de acierto, etc.)
* Comprobar su posición en el ranking de su comunidad y en el nacional
* Contactar con el soporte para resolución de dudas y planteamiento de sugerencias y quejas


### MOTIVACIÓN DEL PROYECTO

Cuando a un jugador le gusta un videojuego, suele pasar tiempo leyendo cosas sobre él, ver vídeos, sus rankings, etc. Este servicio web está pensado para servir de portal a todas esas actividades, sirviendo tanto de introducción a los nuevos jugadores (tutoriales, soporte, etc.) como de punto de encuentro para jugadores habituales (estadísticas, rankings, mensajes, etc.).


### HERRAMIENTAS UTILIZADAS

Desarrollaré la aplicación utilizando el framework MVC de Python Django, empleando Gunicorn como servidor web. Para la persistencia de los datos, utilizaré PostgreSQL para los usuarios y MongoDB para estadísticas de los mismos.


### INTEGRACIÓN CONTINUA (CI)

Se lleva a cabo mediante el servicio Travis-CI. Este servicio se configura mediante el fichero **[.travis.yml](./.travis.yml)**, en el cual indicamos la versión de Python y las dependencias necesarias (recopiladas en el archivo **[requirements.txt](./requirements.txt)**). Entre otras dependencias, se encuentra el marco de pruebas que queremos que Travis utilice (en este caso, he elegido la herramienta nose, mediante un envoltorio para Django denominado django-nose).


### DESPLIEGUE CONTINUO (CD)

Para desplegar la aplicación y ponerla a disposición de los usuarios, utilizo el PaaS Heroku. Este PaaS utiliza el fichero **[Procfile](./Procfile)** para saber qué comando ha de ejecutar para lanzar el servicio web. Previamente, tal como hace el servicio de CI, instala las dependencias especificadas en el **requirements.txt**. Además, utiliza el archivo **[app.json](./app.json)** para obtener los metadatos de la aplicación (podemos verlos cuando utilizamos el botón "Deploy to Heroku") y determinar variables de entorno y add-ons.


#### Instrucciones de despliegue

Si quieres desplegar tu propia copia de la aplicación, puedes hacerlo de varias formas:

* Utilizando el botón disponible junto al título de este documento, que te llevará al asistente de Heroku para desplegar la aplicación.

* Mediante el toolbelt de Heroku (Heroku CLI), que se puede instalar en Ubuntu ejecutando el siguiente comando:

 ```bash
 wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
 ```
 Una vez instalado, puedes ejecutar [este script](./scriptDeploy.sh) para desplegar la aplicación en tu cuenta de Heroku, o [este otro](./scriptLocal) para lanzar localmente la aplicación.
