# vagrant-rke-lab
Deploys 4 Opensuse vms with all the prerequisites needed to deploy a Kubernetes cluster with rke. 


## Prerequisites
- vagrant.
- sudo access.
- nfs server up and running.


Since it uses the provider libvirt be sure to have libvirt and the vagrant provider installed:
https://github.com/vagrant-libvirt/vagrant-libvirt



## Deploying the vms

Export your ssh public key in an environment variable:
```
export SSH_KEY="Your-ssh-key-here"
```

Deploy the vms
```
vagrant up 
```

## Details
The vms are all using Opensuse Leap with Docker installed with the user rancher configured to run Docker containers. The exported public key is added to the authorized_keys for the rancher user. 

To access to the vms in ssh: 

```
ssh rancher@<vm_ip> 
```



## Customization
You can customize the following values in the Vagrantfile to suit your needs: 
```
VM_IMAGE="opensuse/Leap-15.3.x86_64"
MASTER_MEM=2048
MASTER_CPU=1
WORKER_MEM=2048
WORKER_CPU=1
IP_VM1='10.20.30.40'
IP_VM2='10.20.30.41'
IP_VM3='10.20.30.42'
IP_VM4='10.20.30.43'
```


