# Travial-Web [![Build Status](https://travis-ci.org/isma94/Travial-Web.svg?branch=master)](https://travis-ci.org/isma94/Travial-Web) [![Deploy (Heroku)](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/isma94/Travial-Web) [![Try (Heroku)](./img/tryButton.jpg)](https://travial-web.herokuapp.com/) [![DockerHub](./img/docker.png)](https://hub.docker.com/r/isluji/travial-web/)


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

Más detalles en el [siguiente enlace](https://github.com/isma94/Travial-Web/blob/doc/documentacion/1_descripcion.md).


### INTEGRACIÓN CONTINUA (CI)

Se lleva a cabo mediante el servicio Travis-CI. Este servicio se configura mediante el fichero **[.travis.yml](./.travis.yml)**, en el cual indicamos la versión de Python y las dependencias necesarias (recopiladas en el archivo **[requirements.txt](./requirements.txt)**). Entre otras dependencias, se encuentra el marco de pruebas que queremos que Travis utilice (en este caso, he elegido la herramienta nose, mediante un envoltorio para Django denominado django-nose).

Más detalles en el [siguiente enlace](https://github.com/isma94/Travial-Web/blob/doc/documentacion/2_integracionContinua.md).


### DESPLIEGUE CONTINUO (CD)

Para desplegar la aplicación y ponerla a disposición de los usuarios, utilizo el PaaS Heroku. Este PaaS utiliza el fichero **[Procfile](./Procfile)** para saber qué comando ha de ejecutar para lanzar el servicio web. Previamente, tal como hace el servicio de CI, instala las dependencias especificadas en el **requirements.txt**. Además, utiliza el archivo **[app.json](./app.json)** para obtener los metadatos de la aplicación (podemos verlos cuando utilizamos el botón "Deploy to Heroku") y determinar variables de entorno y add-ons.

Más detalles en el [siguiente enlace](https://github.com/isma94/Travial-Web/blob/doc/documentacion/3_desplieguePaaS.md).


## CONTENERIZACIÓN

Utilizo el sistema Docker junto con su extensión Docker Compose para generar un contenedor con la aplicación y orquestarlo con los contenedores de sus dependencias. Docker utiliza el fichero **[Dockerfile](./Dockerfile)** para especificar cómo ha de construirse la imagen de la aplicación, además del **[.dockerignore](./.dockerignore)** para excluir ficheros innecesarios o sensibles de la imagen. Docker Compose permite definir los servicios necesarios para el funcionamiento de la aplicación, y generar el ecosistema de contenedores de forma automatizada. Esto lo lleva a cabo mediante la familia de archivos **[docker-compose.*.yml](./compose)**, que especifican la infraestructura de contenedores y permiten adaptarla a cada entorno de operación (desarrollo, staging, producción).

Más detalles en el [siguiente enlace](https://github.com/isma94/Travial-Web/blob/doc/documentacion/4_docker.md).


## Instrucciones de despliegue en Heroku

Si quieres desplegar tu propia copia de la aplicación, puedes hacerlo de varias formas:

* Utilizando el botón disponible junto al título de este documento, que te llevará al asistente de Heroku para desplegar la aplicación.

* Mediante el toolbelt de Heroku (Heroku CLI), que se puede instalar en Ubuntu ejecutando el siguiente comando:

 ```bash
 wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
 ```
 Una vez instalado, puedes ejecutar [este script](./scriptDeploy.sh) para desplegar la aplicación en tu cuenta de Heroku, o [este otro](./scriptLocal) para lanzar localmente la aplicación.


## Instrucciones de despliegue con Docker

Si quieres desplegar la aplicación usando Docker, primero has de instalar tanto Docker como Docker Compose. Si usas Ubuntu, puedes utilizar [este script](./scripts/installDocker_Ubuntu.sh) para ello.

Una vez hecho esto, puedes desplegar la aplicación ejecutando un simple script. Puedes elegir entre 2 opciones:

* [Ejecutar en un entorno de desarrollo](./compose/deployDockerCompose_dev.sh), con la cual podrás acceder a la aplicación desde tu navegador con http://localhost:8000/

* [Ejecutar simulando un entorno de producción](./compose/deployDockerCompose_prod.sh), con la cual podrás acceder a la aplicación tal como si estuviera desplegada en el mismo host (utilizando la URL http://localhost/)


## Despliegue en un IaaS con Vagrant

Como objetivo final, he configurado un sistema para la creación, lanzamiento, provisionamiento y despliegue automatizados de una MV en un IaaS (en este caso, ```Microsoft Azure```), de forma que funcione como servidor web de la app.

Para ello, he utilizado la herramienta ```Vagrant```. Esta herramienta funciona con un fichero Ruby denominado **[Vagrantfile](./Vagrantfile)**, que al ejecutarlo se encarga de crear y lanzar las MVs (el *proveedor* por defecto es VirtualBox, por lo que para conectar con Azure es necesario instalar su plugin) y de provisionarlas, con la ayuda también de otro tipo de herramientas denominadas *provisionadores*.

En este caso, el provisionador que he usado es ```Ansible```. Esta herramienta funciona con ficheros YAML denominados **[playbooks](./playbook.yml)**, que especifican las tareas a realizar para provisionar la MV, utilizando los denominados *módulos* (apt, git, pip, etc.).

Finalmente, para controlar la ejecución de nuestra app en la MV, utilizamos la herramienta ```Fabric```. Esta herramienta se encarga de ejecutar métodos de forma remota en nuestra MV, definidos en un fichero Python denominado **[fabfile.py](./fabfile.py)**

Si tienes un sistema Debian o Ubuntu, puedes instalar las herramientas necesarias para el proceso ejecutando [este script](./vagrant/installVagrantAndRequirements.sh).

Una vez dispongas de una cuenta en Azure con la posibilidad de crear MVs Linux, puedes desplegar la aplicación con el [tutorial detallado en la documentación](https://github.com/isma94/Travial-Web/blob/doc/documentacion/5_IaaS.md).
