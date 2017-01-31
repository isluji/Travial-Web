#!/bin/bash

# Instalar git, python y pip por si no están instalados
sudo apt-get install git python python-pip

# Clonar repositorio de la aplicacion
git clone https://github.com/isma94/Travial-Web
cd Travial-Web
# Hacer login en Heroku
heroku login
# Instalar dependencias en el entorno local
pip install -r requirements.txt
# Lanzar la aplicacion de forma local
heroku local
