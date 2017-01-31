from fabric.api import task, run, local, hosts, cd, env

# Lanzar la aplicacion
def start_app():
    run('cd /home/vagrant/Travial-Web/ && sudo gunicorn travial_web.wsgi -b 0.0.0.0:80 --log-file -')

# Detener la aplicacion
def stop_app():
    run('sudo service gunicorn stop')
    
# Eliminar la aplicacion
def remove_app():
    run('sudo rm -R /home/vagrant/Travial-Web')
    
# Ejecutar los tests de la aplicacion
def test_app():
    run('sudo python /home/vagrant/Travial-Web/manage.py test')
