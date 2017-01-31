
# Vagrant 1.9.1 (la versión de apt está desactualizada)
wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb
sudo dpkg -i vagrant_1.9.1_x86_64.deb
rm vagrant_1.9.1_x86_64.deb

# Plugin proveedor de Azure para Vagrant (v2.0)
vagrant plugin install vagrant-azure --plugin-version '2.0.0.pre1'

# Instalar python y pip por si no están (Ansible y Fabric son paquetes Python)
sudo apt-get install python python-pip

# Ansible y Fabric
pip install ansible fabric
