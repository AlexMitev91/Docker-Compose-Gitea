# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "gitea" do |gitea|
    gitea.vm.box= "generic/debian11"
    gitea.vm.hostname = "gitea.lab"
    gitea.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
	  end
    gitea.vm.network "private_network", ip: "192.168.111.202"
    gitea.vm.network "forwarded_port", guest: 8080, host: 8081
    gitea.vm.provision "shell", path: "shared-files/install_common.sh"
    gitea.vm.provision "shell", path: "shared-files/docker/docker.sh"
    gitea.vm.provision "shell", path: "shared-files/gitea/setup/setup_gitea.sh"
    gitea.vm.synced_folder "shared-files/gitea", "/vagrant"
  end
end