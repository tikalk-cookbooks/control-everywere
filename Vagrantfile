# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'multi_json'

Vagrant.configure("2") do |config|
  
 config.vm.box = "h4ppyy/ubuntu-17.10"
 #config.vm.box_url = "https://app.vagrantup.com/ffuenf/boxes/ubuntu-17.10.1-server-amd64"
 
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

	web_ip = "192.168.56.101" 
	db_ip = "192.168.56.102" 
	lb_ip = "192.168.56.103" 

	$provision_script= <<SCRIPT
if [[ $(which chef-solo) != '/usr/bin/chef-solo' ]]; then
curl -L https://www.opscode.com/chef/install.sh | sudo bash
echo 'export PATH="/opt/chef/embedded/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile
fi
SCRIPT

  # Define the web server - nodejs ...
  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: web_ip
    web.vm.provision :chef_solo do |chef|
      # chef.https_proxy    = ""
      # chef.no_proxy       = "127.0.0.1,localhost"
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path     = ["roles"]
      chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :debug    
      chef.add_role "web"
      chef.json = {
	:ce => {"db" => {"ip" => db_ip}}

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
      chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :info    
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
	:ce => {"web" => {"ip" => web_ip}}

      }
    end 
  end 

  

   config.vm.provider :aws do |aws, override|
	   prove = "aws"
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
  #  aws.access_key_id = "MIO_ACCESS_KEY_ID"
  #  aws.secret_access_key = "MIO_SECRET_ACCESS_KEY"
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_KEY']
    aws.keypair_name = ENV['KEYPAIR_NAME']

    aws.ami = "ami-a73264ce"
    aws.security_groups = [ "ce" ]

    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "#{ENV['KEYPAIR_NAME']}.pem"

    end 

  end

