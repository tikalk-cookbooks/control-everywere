# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'multi_json'

Vagrant.configure("2") do |config|
  
 config.vm.box = "ubuntu-12.04-omnibus-chef"
 config.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04-omnibus-chef.box"
 #config.vm.box = "CentOS-6.4-x86_64-Minimal"
 #config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
  # Define the CM server - gitlab ?, subversion ?, apapche ...
 

  config.vm.define "web" do |web|
    web.vm.hostname = "web"
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
   
  
  # Define the CI server - jenkins + reverse proxy [ apache2 / naginx ] ... 
  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    db.vm.network "public_network", :bridge => 'vnet0'
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
  

end
