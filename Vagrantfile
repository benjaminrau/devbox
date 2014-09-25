# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vconfig|
    #vconfig.vm.box = "puppetlabs/debian-7.4-64-nocm"
    vconfig.vm.box = "vagrant-debian-wheezy64"
    vconfig.vm.box_url = "http://vagrant.br0ken.de/debian/wheezy64/v2.2/vagrant-debian-wheezy64.box"

    vconfig.vm.define :t3devbox do |config|
        config.vm.provider :virtualbox do |v|
            # set memory to 512MB
            v.customize [ "modifyvm", :id, "--memory", "1024" ]
            #v.gui = true #debugging
            v.name = "t3devbox"
            v.cpus = 1
        end

        config.vm.host_name = "t3devbox"
        config.vm.network :private_network, ip: "192.168.56.11"

		config.vm.provision :shell do |shell|
		 	shell.path = "bootstrap_webproject.sh"
		 	shell.args = "'https://github.com/benjaminrau/typo3-bootstrap.git'"
		end

        config.vm.provision :ansible do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible/hosts"
        end
    end

	NEWUSER_UID = 2030
    vconfig.vm.synced_folder "data/", "/data", owner: NEWUSER_UID, group: NEWUSER_UID

end
