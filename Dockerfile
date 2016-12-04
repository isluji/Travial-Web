# Travial-Web
#
# VERSION               1.0

# The first instruction must be `FROM` in order to
# specify the Base Image from which you are building
FROM python:2.7

ENV PYTHONUNBUFFERED 1

MAINTAINER Ismael Luque Jimenez <isma94@correo.ugr.es>

# Instalar git para poder clonar el repositorio
RUN apt-get -y update
RUN apt-get install -y git

# Clonar repositorio en el contenedor
RUN git clone https://github.com/isma94/Travial-Web
WORKDIR /Travial-Web

# Instalar dependencias de Python
RUN pip install -r requirements.txt
