# Travial-Web
#
# VERSION               1.0

# The first instruction must be `FROM` in order to
# specify the Base Image from which you are building
FROM python:2.7

ENV PYTHONUNBUFFERED 1

MAINTAINER Ismael Luque Jimenez <isma94@correo.ugr.es>

# Aunque vayamos a utilizar Docker Compose para crear y conectar los servicios,
# necesitamos instalar postgresql para que funcione el script wait-for-postgres.sh
# que se encarga de esperar a que el contenedor de Postgres esté listo)
RUN apt-get -y update
RUN apt-get install -y postgresql

# Clonar repositorio en el contenedor
#RUN apt-get install -y git
#RUN git clone https://github.com/isma94/Travial-Web

RUN mkdir /Travial-Web
ADD . /Travial-Web
WORKDIR /Travial-Web

# Instalar dependencias de Python
RUN pip install -r requirements.txt
