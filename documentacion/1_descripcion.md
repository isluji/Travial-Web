
# Travial-Web

## MOTIVACIÓN DEL PROYECTO

Cuando a un jugador le gusta un videojuego, suele pasar tiempo leyendo cosas sobre él, ver vídeos, sus rankings, etc. Este servicio web está pensado para servir de portal a todas esas actividades, sirviendo tanto de introducción a los nuevos jugadores (tutoriales, soporte, etc.) como de punto de encuentro para jugadores habituales (estadísticas, rankings, mensajes, etc.).

Este proyecto participa en el **certamen de proyectos libres de la UGR**.

## HERRAMIENTAS A UTILIZAR

Los servicios en la nube conformarán una infraestructura virtual que servirá de back-end tanto para la web como para la aplicación. Desarrollaré la aplicación utilizando el framework MVC de Python denominado Django.

Para que los usuarios accedan a la página, necesitaremos un servicio de registro y login/logout de usuarios.
Toda la información dinámica del servicio web (credenciales de usuario, datos, logs) estará almacenada utilizando sistemas de bases de datos en la nube, mientras que alojaremos la información estática (ficheros, imágenes, vídeos) en un servicio de alojamiento en la nube. Tendremos el siguiente esquema de bases de datos:

  - Credenciales de usuario => Utilizaremos una base de datos PostgreSQL
  - Estadísticas del jugador + Logs => Utilizaremos una base de datos MongoDB

También necesitaremos servicios en la nube para herramientas de configuración, prueba, despliegue, integración continua, herramientas de construcción, entornos virtuales y testeo. Como no conozco aún estas características, pospondré la elección de las herramientas correspondientes para posteriores semanas.
