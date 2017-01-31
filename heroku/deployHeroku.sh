#!/bin/bash

# Instalar git, python y pip por si no están instalados
sudo apt-get install git python python-pip

# Clonar repositorio de la aplicacion
git clone https://github.com/isma94/Travial-Web
cd Travial-Web
# Hacer login en Heroku
heroku login
# Crear aplicacion en heroku
heroku create
# Desplegar aplicacion
git push heroku master
# Asegurarse de que se esta ejecutando
heroku ps:scale web=1
# Lanzar aplicacion
heroku open
