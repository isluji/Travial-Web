
# Construir conjunto de contenedores con la estructura de desarrollo
docker-compose -f docker-compose.yml -f docker-compose.dev.yml build

# Aplicar migraciones de la base de datos
docker-compose -f docker-compose.yml -f docker-compose.dev.yml run web python manage.py migrate

# Lanzar ecosistema de contenedores
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up
