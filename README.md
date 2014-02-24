Minimalist Vagrant Development Environment
===============================

Minamilist Vagrant development environment provisioned with shell scripts on a (linux/ubuntu) precise64 box

## Setup

1. Install VirtualBox
1. Install Vagrant (vagrantup.com)
1. Install Virtual Box Guest Additions plugin `vagrant plugin install vagrant-vbguest`
1. Clone repo `git clone git://github.com/abuchanan-hs/vagrant-dev-env-minimal.git`
1. Build box `cd vagrant-dev-env-minimal`
1. Add submodule `git submodule init`
1. Update *vagrant-shell-scripts* submodule `git submodule update`
1. Fire up your box `vagrant up`

For now ignore the error 'bash: line 3: xit: command not found'.  There is no indication anything has actually failed and its unclear where this error is being generated.

## Provision.sh and /bin

The precise64 box uses a shell script to provision the vagrant box. Also in the /bin/ directory are the shell scripts for installing a number of additional services.

**INFO:**  
* Using v2 configuration for Vagrantfile  
* [Vagrant Shell Scripts](https://github.com/StanAngeloff/vagrant-shell-scripts "scripts") by StanAngeloff  
* [Boxes](http://www.vagrantbox.es "boxes")  
* [More Provisioner Script examples](https://github.com/rcelha/vagrant-sh-provisioner-scripts "provisioner scripts") by rcelha

## Build Something

1. If not already in the repo's root directory `cd vagrant-dev-env-minimal` (or the path you created)
2. Login to your presice64 box via ssh `vagrant ssh` (the examples below are run from the vagrant box after connecting via ssh)
