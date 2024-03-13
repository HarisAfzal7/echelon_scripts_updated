Vagrant.configure("2") do |config|
  config.vm.box = "chenhan/ubuntu-desktop-20.04"
  config.vm.provider "virtualbox"  do |v|
    v.memory = 8192
    v.cpus = 5
    v.name = 'testeai1'
    config.ssh.forward_agent = true
    config.ssh.forward_x11 = true
    v.gui = true
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    v.customize ["modifyvm", :id, "--vram", "128"]
  end
    config.vm.synced_folder "./code/", "/code"
    #config.vm.provision "shell", inline: _script
    config.vm.network "forwarded_port", guest: 9999, host: 3999
end
