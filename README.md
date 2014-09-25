# devbox
A small debian wheezy based vagrant box, provisioned with ansible which rolls out a webproject you specify in https://github.com/benjaminrau/devbox/blob/master/Vagrantfile#L26

There are more variables you can modify to have a customized virtual environment: https://github.com/benjaminrau/devbox/blob/master/ansible/global_vars/devbox.yml

The specified repository is cloned and afterwards ansible will run the role _"bootstrap-webproject"_ from that repository as last role when generic bootstrapping is done.

By default this devbox bootstraps _TYPO3 6.2_ cloned from https://github.com/benjaminrau/typo3-bootstrap.

## What's inside?
devbox comes with a full web environment in mind.
Namely it has following modules preinstalled:

* nginx
* php-fpm
* MariaDb
* phpmyadmin
* phptools (phpunit, phploc, ...)

Also there's a separate user to run your web stuff (wwwdev) and a basic set of tool scripts for working with git or linking nginx configs from your repository directory to sites-enabled and much more :-)

## Believe it or not but...

If youve used this devbox before and all prerequisites are fulfilled and there is no need for you to customize the settings but rather want a working typo3 setup _immediately_, then just run this:

	git clone https://github.com/benjaminrau/devbox && cd devbox && ./up

Open your browser and enter http://dev.local/ - and enjoy.

## Prerequisites
* Vagrant: Download and run setup
* Virtualbox: Download and run setup
* Python Installation: Download and run setup

Finally install the Python package installer and use it to install some additional packages by running

    sudo easy_install pip
    sudo pip install paramiko PyYAML jinja2 httplib2

Then go to a directory of your choice where you want to place the ansible installation and run

    git clone https://github.com/ansible/ansible.git
    cd ./ansible
    source ./hacking/env-setup

## Finally the devbox configuration
Now go to the parent directory where you want your virtual machine to be placed and clone the repo
Clone with --recursive to auto-init all submodules and enjoy the flow...

    git clone --recursive https://bitbucket.org/BenjaminRau/devbox.git devbox

If you want to use other submodules you will have to clone without --recursive and after you modifies .gitmodules run

	cd devbox
	git submodule update --init

Its time to do some customizations for your local environment. First go to the directory where you cloned the repository:

    cd devbox

Then you will have to add your custom informations in the following file:

    ansible/global_vars/devbox.yml

In there, you can customize the created devbox with your own domain, vm and git user and ssh keys...

Note: If you dont know - you obtain your ssh public key by running:

    cat ~/.ssh/id_rsa.pub

## First start
If youre not already there go to the cloned repository and simply run this:

    ./up

This equals the vagrant up command but also sets a environment variable to suppress ansible's cowsay and provides a more readable output of the first provisioning. If you need provisioning later on, just vagrant provision or use the ./provision script withouth the cowsay.

## Connecting to the box
You've got two options:

* vagrant ssh, su root (password is "vagrant") and then su wwwdev
* ssh wwwdev@192.158.56.11 (without prompt because we added our public key earlier for password-less ssh´ing)

I'd suggest you add something like to your _hosts file_

    192.168.56.11 dev.local

to ease your access to the virtual machine. The "dev.local" part is the default address your nginx installation will listen to.
