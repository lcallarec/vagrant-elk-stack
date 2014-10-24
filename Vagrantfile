# -*- mode: ruby -*-
# vi: set ft=ruby :

settings = {
 "network.ip" => "192.168.100.100"
}

Vagrant.configure("2") do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 9200, host: 9222

  config.vm.network :private_network, ip: settings['network.ip']

  # forward ssh keys into vagrant
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    # List of recipes to run
    chef.cookbooks_path = ['chef/cookbooks', 'chef/local_cookbooks']
    
    chef.add_recipe "apt::default"
    chef.add_recipe "apache2"
    chef.add_recipe "java"
    chef.add_recipe "logstash"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "kibana"
    chef.add_recipe "kibana::apache"
    chef.json = {
     "java" => {
      "install_flavor" => "openjdk",
      "jdk_version" => 7,
      "openjdk_packages" => ['openjdk-7-jdk']
     },
     "kibana" => {
      "version" => '3',
      "kibana3_version" => '3.1.1',
      "elasticsearch" => {
        "host" => ['localhost']
      },
      "apache" => {
        "interface" => settings['network.ip']
      }
     }
    }
  end
end
