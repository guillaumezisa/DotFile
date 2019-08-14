#!/bin/bash

################################################################################
# Date : 2019/08/14                                                            #
# Auteur : Guillaume Zisa                                                      #
# Version : 1                                                                  #
# Titre : Installation perso de Fedora 30                                      #
################################################################################

if [ $(whoami) = "root" ];then
  echo"===============================MISE A JOUR================================="
  sudo dnf update -y

  echo"==============================INSTALLATION MATE============================"
  sudo dnf groupinstall mate-desktop --allowerasing -y
  sudo dnf groupinstall mate-applications --allowerasing -y
  sudo dnf install lightdm lightdm-gtk -y
  sudo systemctl disable gdm.service
  sudo systemctl enable lightdm.service

  echo"======================INSTALLATION KERNEL HEADER VMWARE===================="
  sudo dnf install kernel-headers kernel-devel gcc glibc-headers

  echo "======================INSTALLATION DES THEMES ET SOFT====================="
  sudo dnf copr enable tcg/themes -y && sudo dnf install la-capitaine-cursor-theme -y
  sudo dnf install snap -y
  sudo dnf install snapd -y
  sudo snap install discord
  sudo snap install opera
  sudo snap install onlyoffice-desktopeditors
  sudo snap install john-the-ripper
  sudo cp -r icons ~/.icons
  sudo cp -r themes ~/.themes
  sudo cp bashrc ~/.bashrc
  sudo cp hey /bin/hey
  sudo chmod 775 /bin/hey

  echo "===========================INSTALLATION JOHN THE RIPPER==================="
  sudo dnf install git gcc openssl-devel -y
  sudo dnf install yasm gmp-devel libpcap-devel bzip2-devel -y
  sudo dnf install john

  echo "=========================================================================="
  echo "Installation terminer redémarrer la machine ? [y/n]"
  read choice
  if [ $choice = "y" ];then
    reboot
  fi
  #sudo reboot
else
  echo "Tu dois être root pour lancer l'installation"
fi
