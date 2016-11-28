#!/bin/bash

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
