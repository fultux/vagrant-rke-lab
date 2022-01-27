VM_IMAGE="opensuse/Leap-15.3.x86_64"
MASTER_MEM=2048
MASTER_CPU=1
WORKER_MEM=2048
WORKER_CPU=1
IP_VM1='10.20.30.40'
IP_VM2='10.20.30.41'
IP_VM3='10.20.30.42'
IP_VM4='10.20.30.43'
SSH_KEY=ENV['SSH_KEY']

Vagrant.configure("2") do |config|
  config.vm.define :master do |master|
    master.vm.box = VM_IMAGE 
    master.vm.hostname = "master"
    master.vm.provider :libvirt do |master|
      master.memory = MASTER_MEM
      master.cpus = MASTER_CPU
    end
    master.vm.network :private_network, :ip => IP_VM1 
 end
 config.vm.define :master2 do |master2|
    master2.vm.box = VM_IMAGE
    master2.vm.hostname = "master2"
    master2.vm.provider :libvirt do |master2|
      master2.memory = MASTER_MEM
      master2.cpus = WORKER_CPU
    end
    master2.vm.network :private_network, :ip => IP_VM2
 end
  config.vm.define :worker1 do |worker1|
    worker1.vm.hostname = "worker2"
    worker1.vm.box = VM_IMAGE
    worker1.vm.provider :libvirt do |worker1| 
     worker1 .memory = WORKER_MEM
     worker1.cpus = WORKER_CPU
    end
    worker1.vm.network :private_network, :ip => IP_VM3
 end
  config.vm.define :worker2 do |worker2|
    worker2.vm.hostname = "worker2"
    worker2.vm.box = VM_IMAGE
    worker2.vm.provider :libvirt do |worker2|
      worker2.memory = WORKER_MEM
      worker2.cpus = WORKER_CPU
    end
    worker2.vm.network :private_network, :ip => IP_VM4
 end
 config.vm.synced_folder "salt/roots/", "/srv/salt/"
 config.vm.provision :salt do |salt|
  salt.pillar({
    "ssh_key" => {
      "my_key" => SSH_KEY,
    }  
  })
    salt.masterless = true
    salt.run_highstate = true
 end
end

