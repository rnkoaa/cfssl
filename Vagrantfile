# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  name = 'cfssl-machine'
  config.vm.provider 'virtualbox' do |v|
    v.memory = 512
  end

  config.vm.define name do |machine|
    machine.vm.box = 'debian/stretch64'
    machine.vm.hostname = "#{name}.alpha.consul"
    machine.vm.network 'private_network', ip: "192.168.33.10"
    machine.vm.synced_folder "workspace/", "/home/vagrant/workspace"
    # else
    # do nothing for now
    # end
    machine.vm.provision 'shell', inline: <<-SHELL
        echo "==> Shell Provisioning"

        sudo apt-get update -y && sudo apt-get upgrade -y \
          && sudo apt-get -y install vim wget git zip unzip tree curl build-essentials golang-1.10-go git

        file="/home/vagrant/.vimrc"
        if [ -f "$file" ]
        then
            echo ".vimrc exists, will not download again."
        else
          wget -q -O /home/vagrant/.vimrc https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim
          # curl -s -L -o /home/vagrant/.vimrc https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim
        fi

        mkdir /home/vagrant/go
        mkdir downloads && cd downloads && wget -q https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
        tar -xvf go1.10.2.linux-amd64.tar.gz && sudo mv go /usr/local
#        echo 'export GOROOT=/usr/local/go' | tee -a /home/vagrant/.zsh_profile
#        echo 'export GOROOT=/home/vagrant/go' | tee -a /home/vagrant/.zsh_profile
#       echo 'export PATH=$GOROOT/bin:$PATH' | tee -a /home/vagrant/.zsh_profile

        # setup zsh for easy access
        echoe 'export PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc

    SHELL
  end
end
