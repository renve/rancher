# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_download_insecure = true

config.vm.define :master do |master1|
      master1.vm.host_name = "master1"
      master1.vm.network "private_network", ip:"192.168.1.20"
      master1.vm.synced_folder "master_data/", "/master_data"
      master1.vm.synced_folder ".", "/vagrant", disabled: true
      master1.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
end


config.vm.define :slave do |slave|
      slave.vm.host_name = "slave"
      slave.vm.network "private_network", ip:"192.168.1.21"
      slave.vm.synced_folder "master_data/", "/master_data"
      slave.vm.synced_folder ".", "/vagrant", disabled: true
      slave.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1024"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
end


config.vm.define :slave2 do |slave2|
      slave2.vm.host_name = "slave2"
      slave2.vm.network "private_network", ip:"192.168.1.22"
      slave2.vm.synced_folder "master_data/", "/master_data"
      slave2.vm.synced_folder ".", "/vagrant", disabled: true
      slave2.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1024"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
end


end
