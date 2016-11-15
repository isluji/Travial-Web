#!/bin/bash

# Instalar Heroku CLI
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
# Hacer login en Heroku
heroku login
# Clonar repositorio de la aplicacion
git clone https://github.com/isma94/Travial-Web
cd Travial-Web
# Crear aplicacion en heroku
heroku create
# Desplegar aplicacion
git push heroku master
# Asegurarse de que se esta ejecutando
heroku ps:scale web=1
# Lanzar aplicacion
heroku open
