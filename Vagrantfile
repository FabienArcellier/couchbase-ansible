# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "shell", inline: <<-SCRIPT
    apt-get update
    apt-get install -y python-pip

    pip install ansible

    export PYTHONUNBUFFERED=1
    bash /vagrant/ansible_bootstrap.sh

    mkdir -p /home/vagrant/ansible-couchbase
    cp -R /vagrant/* /home/vagrant/ansible-couchbase
    chmod -R 777 /home/vagrant/ansible-couchbase

    ansible-playbook -i "/home/vagrant/ansible-couchbase/local.ini" "/home/vagrant/ansible-couchbase/couchbase.yml"
  SCRIPT
end
