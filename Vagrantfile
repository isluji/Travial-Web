# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configuracion de Vagrant (v2)
Vagrant.configure(2) do |config|
  
  ### Configuracion de la maquina virtual

  config.vm.hostname = "localhost"

  # Dummy base box (especificaremos la MV en la conf. del provider)
  config.vm.box = 'azure'
  config.vm.box_url = 'https://github.com/msopentech/vagrant-azure/raw/master/dummy.box'
  
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 80

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10", virtualbox__intnet: "vboxnet0"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  

  ### Configuracion de los proveedores de VM

  config.vm.provider :azure do |azure, override|
    # use local ssh key to connect to remote vagrant box
    config.ssh.private_key_path = '~/.ssh/azure_rsa'    
    
    # Configuracion de la MV propiamente dicha
    azure.vm_image_urn = 'canonical:UbuntuServer:16.04-LTS:16.04.201701130'
    azure.vm_size = 'Basic_A0'
    azure.location = 'westeurope'
    azure.tcp_endpoints = '80:80'
    azure.vm_name = "travial-vm"
    azure.resource_group_name= "travial-group"
    
    # Variables de entorno de Azure
    azure.tenant_id = ENV['AZURE_TENANT_ID']
    azure.client_id = ENV['AZURE_CLIENT_ID']
    azure.client_secret = ENV['AZURE_CLIENT_SECRET']
    azure.subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
  end

  config.vm.provider "virtualbox" do |vb|
    # Virtual Machine Name
    vb.name = "travial-vm"
    
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize memory and CPU settings
    vb.memory = "1024"
    vb.cpus = 1
  end
  
  
  ### Configuracion del provisionador (Ansible)
  
  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.playbook = "playbook.yml"
    ansible.host_key_checking = false
    # ansible.verbose = "-vvvv"
  end

end
