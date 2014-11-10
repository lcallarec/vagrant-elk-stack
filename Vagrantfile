# -*- mode: ruby -*-
# vi: set ft=ruby :

settings = {
 "network.ip" => "192.168.33.11"
}

Vagrant.configure("2") do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 9200, host: 9200
  config.vm.network :forwarded_port, guest: 12201, host: 12201, protocol: "udp"

  config.vm.network :private_network, ip: settings['network.ip']

  # forward ssh keys into vagrant
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3048"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    # List of recipes to run
    chef.cookbooks_path = ['chef/cookbooks', 'chef/local_cookbooks']
   
    chef.add_recipe "elk_stack::default"
    chef.add_recipe "elk_stack::elasticsearch"
    chef.add_recipe "elk_stack::logstash"
    chef.add_recipe "elk_stack::kibana"
    
    chef.json = {
      "logstash" => {
        "instance" => {
          "agent" => {
            "templates" => {
              "input_gelf" => "config/logstash/input/gelf.conf.erb",
              "output_logstash" => "config/logstash/output/elasticsearch.conf.erb"
            }
          }
        }
      }
    }
  end
end
