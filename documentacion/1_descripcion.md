
# Travial-Web

## MOTIVACIÓN DEL PROYECTO

Cuando a un jugador le gusta un videojuego, suele pasar tiempo leyendo cosas sobre él, ver vídeos, sus rankings, etc. Este servicio web está pensado para servir de portal a todas esas actividades, sirviendo tanto de introducción a los nuevos jugadores (tutoriales, soporte, etc.) como de punto de encuentro para jugadores habituales (estadísticas, rankings, mensajes, etc.).

Este proyecto participa en el **certamen de proyectos libres de la UGR**.

## HERRAMIENTAS A UTILIZAR

Los servicios en la nube conformarán una infraestructura virtual que servirá de back-end tanto para la web como para la aplicación. Desarrollaré la aplicación utilizando el framework de Python basado en MVC Django.

Para acceder a las funcionalidades de la página, los usuarios habrán de identificarse con las mismas credenciales de usuario con las que se registraron en la aplicación, o registrar una cuenta si aún no la han probado. Por tanto, necesitaré un servicio de registro y login/logout de usuarios.

Todos los datos de los usuarios estarán almacenados utilizando un sistema de bases de datos. También contaremos con un servicio de almacenamiento para hospedar imágenes e información sobre los puntos de interés. Además, necesitaremos de un servidor de mensajería para implementar la función de intercambio de mensajes entre usuarios.

Todos estos servicios serán servicios cloud, tanto PaaS (servicios necesarios para desplegar la aplicación) como IaaS (infraestructura donde la desplegaremos).

También necesitamos servicios en la nube para herramientas de configuración, prueba, despliegue, integración continua, herramientas de construcción, entornos virtuales y testeo. Como no conozco aún estas características, pospondré la elección de las herramientas correspondientes para posteriores semanas.