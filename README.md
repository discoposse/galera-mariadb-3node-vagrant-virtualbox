galera-mysql-3node-vagrant-virtualbox
=====================================

This is a Vagrant/VirtualBox configuration to create a 3 node Galera MariaDB cluster on Ubuntu 14.04

## Usage
### Requirements
* Vagrant 1.4+ http://www.vagrantup.com/
* VirtualBox 4.3+ http://www.virtualbox.org/

### Quick Start
```bash
git clone https://github.com/discoposse/galera-mariadb-3node-vagrant-virtualbox.git
cd galera-mariadb-3node-vagrant-virtualbox
vagrant up

### Host Configuration
Hosts will be:
* galera-mariadb01 (172.16.0.150)
* galera-mariadb02 (172.16.0.151)
* galera-mariadb03 (172.16.0.152)

#### WORK IN PROGRESS
* change default passwords to use YAML or another config file for easier customization 
* make IP address more dynamic rather than hard coded as it currently is

Any suggestions welcome! 