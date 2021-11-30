# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :main do |main|
    main.vm.box = "opensuse/Leap-15.2.x86_64"
    main.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
    end

    main.vm.network :private_network, :ip => '10.20.30.40'
    main.vm.network :public_network, :ip => '10.20.30.41'
 end
  config.vm.define :node do |node|
    node.vm.box = "opensuse/Leap-15.2.x86_64"
    node.vm.provider :libvirt do |domain|
      domain.memory = 4096
      domain.cpus = 2
    end

    node.vm.network :private_network, :ip => '10.20.30.42'
    node.vm.network :public_network, :ip => '10.20.30.43'
 end

  config.vm.define :lb do |lb|
    lb.vm.box = "opensuse/Leap-15.2.x86_64"
    lb.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 1
    end

    lb.vm.network :private_network, :ip => '10.20.30.44'
    lb.vm.network :public_network, :ip => '10.20.30.45'
 end



  config.vm.provision "ansible" do |ansible|
	  ansible.playbook = "./playbook.yaml"
	   ansible.groups = {
             "cluster" => ["main","node"],
	     "loadbalancer" => ["lb"],
	     "loadbalancer:vars" => {"ip_node" => "10.20.30.43"}
	    }
  end
end

