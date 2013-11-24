# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'multi_json'

Vagrant.configure("2") do |config|
  
 config.vm.box = "ubuntu-12.04-omnibus-chef"
 config.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04-omnibus-chef.box"
 
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
 
  # Define the web server - nodejs ...
  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.56.101"
    web.vm.provision :chef_solo do |chef|
      # chef.https_proxy    = ""
      # chef.no_proxy       = "127.0.0.1,localhost"
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path     = ["roles"]
      chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :debug    
      chef.add_role "web"

      chef.json = {

      }
    end 
  end 
   
  
  # Define the DB server - mongodb ... 
  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    # db.vm.network "public_network", :bridge => 'vnet0'
    db.vm.network "private_network", ip: "192.168.56.102"
    db.vm.provision :chef_solo do |chef|
      # chef.https_proxy    = ""
      # chef.no_proxy       = "127.0.0.1,localhost"
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path     = ["roles"]
      chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :debug    
      chef.add_role "db"

      chef.json = {

      }
    end 
  end 
  
  # Define the LB server -  naginx  ... 
  config.vm.define "lb" do |lb|
    lb.vm.hostname = "lb"
    # lb.vm.network "public_network", :bridge => 'vnet0'
    lb.vm.network "private_network", ip: "192.168.56.103"
    lb.vm.provision :chef_solo do |chef|
      # chef.https_proxy    = ""
      # chef.no_proxy       = "127.0.0.1,localhost"
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path     = ["roles"]
      chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :debug    
      chef.add_role "lb"

      chef.json = {

      }
    end 
  end 

end
