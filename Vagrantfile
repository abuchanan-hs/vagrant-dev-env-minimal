
Vagrant.require_version ">= 1.4.3"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  #networking

  # sailjs default port  
  config.vm.network "forwarded_port", guest:1337, host:1337

  #config.vm.network 'public_network', :bridge => 'en1: Wi-Fi (AirPort)'
  # use `ifconfig` to find ip after `vagrant ssh` or use private:
  # config.vm.network "private_network", ip: "192.168.50.4"

  #config.ssh.forward_agent = true

  config.vm.provision :shell, :path => "provision.sh"

end

