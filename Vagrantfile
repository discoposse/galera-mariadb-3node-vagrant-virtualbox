# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
    'galera-mariadb01'  => [1, 150],
    'galera-mariadb02'  => [1, 151],
    'galera-mariadb03'  => [1, 152]
}

Vagrant.configure("2") do |config|
    
    # Virtualbox
    config.vm.box = "trusty64"
    config.vm.box_url = "trusty-server-cloudimg-amd64-vagrant-disk1.box"

    #Default is 2200..something, but port 2200 is used by forescout NAC agent.
    config.vm.usable_port_range= 2800..2900 

    if Vagrant.has_plugin?("vagrant-cachier")
        config.cache.scope = :box
        config.cache.enable :apt
    else
        puts "[-] WARN: This would be much faster if you ran vagrant plugin install vagrant-cachier first"
    end

    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|
            hostname = "%s" % [prefix, (i+1)]

            config.vm.define "#{hostname}" do |box|
                box.vm.hostname = "#{hostname}"
                box.vm.network :private_network, ip: "172.16.0.#{ip_start+i}", :netmask => "255.255.0.0"
   
                box.vm.provision :shell, :path => "#{prefix}.sh"

                # Otherwise using VirtualBox
                box.vm.provider :virtualbox do |vbox|
                # Defaults
                    vbox.customize ["modifyvm", :id, "--memory", 1024]
                    vbox.customize ["modifyvm", :id, "--cpus", 1]

                end
            end
        end
    end
end
