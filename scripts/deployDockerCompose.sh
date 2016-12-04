
# Clonar repositorio de la aplicacion
git clone https://github.com/isma94/Travial-Web
cd Travial-Web

# Construir y lanzar conjunto de contenedores definidos en docker-compose.yml
docker-compose build
docker-compose up

# Aplicar migraciones de la base de datos
docker-compose run web python manage.py makemigrations
docker-compose run web python manage.py migrate
