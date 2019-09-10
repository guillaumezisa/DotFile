#!/bin/bash

################################################################################
# Date : 2019/09/10                                                            #
# Auteur : Guillaume Zisa                                                      #
# Version : 1                                                                  #
# Titre : Installation perso de DEBIAN 10                                      #
################################################################################


if [ $(whoami) = "root" ];then
	apt install vim -y
	apt install git -y 
	apt install snap -y 
	apt install snapd -y 
	apt install vmware-utils -y 
	apt install open-vm-tools -y
	apt install open-vm-tools-desktop -y
	apt install git -y
	snap install opera
	snap install atom --classic
	snap install atom --classic
	git clone http://github.com/guillaumezisa/Dotfile /home/guillaume/Documents/
	cp bashrc /home/guillaume/.bashrc
	cp bashrc /root/.bashrc
else
  echo "Tu dois être root pour lancer l'installation"
fi
