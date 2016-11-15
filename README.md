# Travial-Web [![Build Status](https://travis-ci.org/isma94/Travial-Web.svg?branch=master)](https://travis-ci.org/isma94/Travial-Web)

## Proyecto para la asignatura Infraestructura Virtual de Ismael Luque Jiménez

Este proyecto participa en el [**certamen de proyectos libres de la UGR**](http://osl.ugr.es/bases-de-los-premios-a-proyectos-libres-de-la-ugr/).

### DESCRIPCIÓN

Este curso voy a realizar como TFG el desarrollo de una aplicación móvil basada en la gamificación para fomentar el turismo en Granada. Como apoyo a esta aplicación, utilizaré este repositorio para desarrollar un servicio web complementario en el que los jugadores podrán acceder a las siguientes funcionalidades:

* Acceder a tutoriales que expliquen el funcionamiento del juego
* Consultar sus estadísticas (lugares visitados, porcentaje de acierto, etc.)
* Comprobar su posición en el ranking de su comunidad y en el nacional
* Contactar con el soporte para resolución de dudas y planteamiento de sugerencias y quejas


## MOTIVACIÓN DEL PROYECTO

Cuando a un jugador le gusta un videojuego, suele pasar tiempo leyendo cosas sobre él, ver vídeos, sus rankings, etc. Este servicio web está pensado para servir de portal a todas esas actividades, sirviendo tanto de introducción a los nuevos jugadores (tutoriales, soporte, etc.) como de punto de encuentro para jugadores habituales (estadísticas, rankings, mensajes, etc.).


## HERRAMIENTAS UTILIZADAS

Desarrollaré la aplicación utilizando el framework MVC de Python denominado Django. Los servicios en la nube conformarán una infraestructura virtual que servirá de back-end tanto para la web como para la aplicación. Entre estos servicios utilizados, están los sistemas de bases de datos PostgreSQL y MongoDB.

Para el desarrollo de la aplicación, estoy utilizando técnicas de integración y despliegue continuos, utilizando los servicios Travis-CI y Heroku respectivamente. Para ejecutar los tests, utilizo la herramienta django-nose.
