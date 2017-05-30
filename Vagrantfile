Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "provision_common.sh"

  config.vm.define "master" do |m|
    m.vm.box = "ubuntu/xenial64"
    m.vm.network "private_network", ip: "192.168.100.10"
    m.vm.network "forwarded_port", guest: 8888, host: 8888

    m.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    m.vm.provision "shell", path: "provision_master.sh", args: ["master", "192.168.100.10"]
  end

  config.vm.define "node1" do |n1|
    n1.vm.box = "ubuntu/xenial64"
    n1.vm.network "private_network", ip: "192.168.100.20"

    n1.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    n1.vm.provision "shell", path: "provision_hostname.sh", args: ["node1", "192.168.100.20"]
  end

  config.vm.define "node2" do |n2|
    n2.vm.box = "ubuntu/xenial64"
    n2.vm.network "private_network", ip: "192.168.100.21"

    n2.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    n2.vm.provision "shell", path: "provision_hostname.sh", args: ["node2", "192.168.100.21"]
  end
end
