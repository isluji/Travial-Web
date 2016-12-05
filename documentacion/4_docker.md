
Antes del despliegue a producción, en el desarrollo de una aplicación tiene lugar la etapa de **staging**: probar la aplicación en un entorno aislado. Este entorno de pruebas ha de ser idéntico al que utilizaremos en producción.

Para esto, se suelen utilizar los denominados **contenedores**, que utilizan técnicas de ***virtualización ligera***: no requieren un hipervisor que emule algún hardware para funcionar, sino que los procesos del contenedor se ejecutan sobre el kernel de la propia máquina anfitriona, pudiendo observarlos desde fuera del contenedor. Esto conlleva una gran mejora del rendimiento con respecto a la virtualización tradicional, aunque limita los contenedores soportados a aquellos que tengan el mismo kernel y CPU que la máquina anfitriona. Además, estos contenedores se pueden utilizar también como entorno de producción, desplegando el contenedor en aquellos IaaS que lo soporten.

Existen diversos sistemas de gestión de contenedores, entre ellos LXC, Docker, rkt o tredly. En esta práctica, vamos a usar Docker (el más extendido) para diseñar un contenedor que funcione como entorno de pruebas de nuestra aplicación. Como mi aplicación es un app web de Django, he utilizado [este tutorial](https://docs.docker.com/compose/django/) para ello.

Primero, hemos de instalar Docker. Al contrario de muchos programas en Linux, la instalación no es trivial, por lo que he escrito un script para instalar Docker en sistemas Ubuntu. Además, el script instala la herramienta Docker Compose, necesaria para crear e iniciar los servicios asociados a la aplicación, y orquestarlos entre sí. Opcionalmente, para facilitar el uso de Docker Compose, podemos instalar el add-on Command Completion en nuestra shell siguiendo [estas instrucciones](https://docs.docker.com/compose/completion/).

**[Script para instalar Docker en Ubuntu](https://github.com/isma94/Travial-Web/blob/master/scripts/installDocker_Ubuntu.sh)**

El daemon de Docker se ejecuta en root, por lo que para que el CLI pueda conectar con él hemos de ejecutar todo comando ```docker``` con ```sudo```. Para evitar tener que hacer esto, añadimos nuestro usuario al grupo **docker** con este comando:

```
sudo usermod -aG docker USUARIO
```

Para automatizar el proceso de creación del contenedor, Docker utiliza un fichero denominado Dockerfile, en el que especificamos una imagen inicial desde la que partimos, y mediante una serie de instrucciones, instalamos y configuramos los paquetes y ficheros necesarios para ejecutar nuestra aplicación. Este Dockerfile es el archivo necesario para construir nuestra imagen, y por tanto, lo que utilizamos para subirla al Docker Hub.

**[Dockerfile](https://github.com/isma94/Travial-Web/blob/master/Dockerfile)**

Además, existe otro fichero denominado .dockerignore que se encarga de excluir determinados ficheros y directorios del "build context", de forma que no sean enviados al daemon de Docker para construir el contenedor, evitando exponer ficheros sensibles o incluir ficheros innecesarios en la imagen (su funcionamiento es similar al .gitignore de GitHub).

**[.dockerignore](https://github.com/isma94/Travial-Web/blob/master/.dockerignore)**

Combinando estos dos servicios, he creado la imagen de mi aplicación con ```docker build -t isluji/travial-web:compose .``` y la he subido a DockerHub con ```docker push isluji/travial-web```, con lo que cualquiera puede descargarla utilizando ```docker pull``` para crear sus propios contenedores a partir de ella.

**[Repositorio de DockerHub](https://hub.docker.com/r/isluji/travial-web/)**

Sin embargo, esta aplicación utiliza además otros servicios, los cuales vamos a configurar creando un contenedor para cada uno a partir de su propia imagen Docker oficial en vez de instalarlo todo en el mismo contendor de la aplicación (sería poco escalable). Esto sería muy tedioso de hacer a mano, puesto que habría que crear cada uno de los contenedores, observar sus IPs y puertos y conectarlos a la aplicación mediante variables de entorno.

Sin embargo, con la herramienta Docker Compose se facilita en gran medida esta tarea. Con un fichero denominado docker-compose.yml, definimos la infraestructura de servicios que la aplicación necesita, y Compose se encarga de crear los contenedores, iniciar los servicios y conectarlos al contenedor de la aplicación.

Además, tal como se indica en [este enlace](https://docs.docker.com/compose/extends/), podemos especificar un archivo base (el ya mencionado) con la estructura básica (imágenes y dependencias entre ellas), y crear un archivo "override" para cada entorno (desarrollo, staging, producción) añadiendo aquellas configuraciones que nos sean necesarias. De esta forma, ejecutamos docker-compose "fusionando" el docker-compose.yml con el fichero del entorno utilizado en cada momento.

**[docker-compose.yml](https://github.com/isma94/Travial-Web/blob/master/compose/docker-compose.yml)**
**[Extensión para desarrollo](https://github.com/isma94/Travial-Web/blob/master/compose/docker-compose.dev.yml)**
**[Extensión para producción](https://github.com/isma94/Travial-Web/blob/master/compose/docker-compose.prod.yml)**

Con esto surge un problema, y es que los servicios se inician en orden de dependencia, pero no se esperan unos a otros; por ejemplo, Compose no espera a que el contenedor de Postgres esté preparado para recibir peticiones para lanzar el contenedor web. Esto puede resultar en que el servidor web se ejecute cuando la BD aún no está lista, lo que en condiciones normales conlleva a la terminación del proceso.

Para evitar esto, he utilizado el script wait-for-postgres.sh sugerido en [este enlace](https://docs.docker.com/compose/startup-order/). Este script hace de "entrypoint" para el contenedor web, no permitiéndole ejecutar su servicio hasta haber comprobado que el contenedor de Postgres está activo y listo para recibir peticiones.

**[docker-compose.yml](https://github.com/isma94/Travial-Web/blob/master/wait-for-postgres.sh)**

Finalmente, lo que el usuario quiere es que desplegar la aplicación sea algo sencillo. Para ello, he creado un script que crea y despliega localmente la pila de contenedores y, además, aplica las migraciones necesarias en la base de datos. Según queramos crear un entorno de desarrollo o simular un entorno de producción, utilizaremos uno de estos dos scripts:

**[Script de despliegue con Docker Compose para desarrollo](https://github.com/isma94/Travial-Web/blob/master/compose/deployDockerCompose_dev.sh)**
**[Script de despliegue con Docker Compose para producción](https://github.com/isma94/Travial-Web/blob/master/compose/deployDockerCompose_prod.sh)**

Me hubiera gustado también tener el servicio ejecutándose en un IaaS pero, en aplicaciones configuradas con Docker Compose, [esto se puede hacer de 2 formas](https://docs.docker.com/compose/production/): o modificando determinadas variables de entorno para desplegar la aplicación en un único host, o utilizando Docker Swarm para ejecutar la aplicación en un cluster de contenedores. También se podría hacer teniendo la aplicación y la BD instaladas en el mismo contenedor, pero para ello tendría que cambiar la configuración de BD de Django que he tenido que utilizar para desplegar con Compose.
