# Construir conjunto de contenedores con la estructura de desarrollo
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build

# Aplicar migraciones de la base de datos
docker-compose -f docker-compose.yml -f docker-compose.prod.yml run web python manage.py migrate

# Detener servidor de apache (para liberar puerto 80 de forma que podamos acceder
# al contenedor con http://localhost/)
sudo service apache2 stop

# Lanzar ecosistema de contenedores
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up
