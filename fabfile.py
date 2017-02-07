from fabric.api import task, run, local, hosts, cd, env, hide

# Lanzar la aplicacion
def start_app():
    run('cd /home/vagrant/Travial-Web/ && sudo gunicorn travial_web.wsgi -b 0.0.0.0:80 --log-file -')
    
# Detener la aplicacion
def stop_app():
    run('sudo pkill gunicorn')
    
# Reiniciar la aplicacion
def restart_app():
    stop_app()
    start_app()
    
# Eliminar la aplicacion
def remove_app():
    run('sudo rm -R /home/vagrant/Travial-Web')
    
# Ejecutar los tests de la aplicacion
def test_app():
    run('sudo python /home/vagrant/Travial-Web/manage.py test')

# Inicializar la BD con un "population script"
def init_db():
    run('sudo -u postgres psql -d postgres -f /home/vagrant/Travial-Web/db_export.pgsql')
