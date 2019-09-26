#!/bin/bash

################################################################################
# Date : 2019/09/10                                                            #
# Auteur : Guillaume Zisa                                                      #
# Version : 1                                                                  #
# Titre : Installation perso de DEBIAN 10                                      #
################################################################################


if [ $(whoami) = "root" ];then
        # Install software
	apt install sudo -y
	usermod -G sudo guillaume
	apt install -y vim git snap snapd vmware-utils open-vm-tools open-vm-tools-desktop resolvconf
	snap install opera
	snap install atom --classic
	
	# Clone our dotfile and set our .bashrc and .alias
	git clone http://github.com/guillaumezisa/Dotfile /home/guillaume/.dotfiles/
	cp $HOME/.dotfiles/bashrc $HOME/.bashrc
	cp $HOME/.dotfiles/bash_aliases $HOME/.bash_aliases
else
  echo "Please be root for the automatic install"
fi
