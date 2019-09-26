#!/bin/bash

################################################################################
# Date : 2019/08/14                                                            #
# Auteur : Guillaume Zisa                                                      #
# Version : 1                                                                  #
# Titre : Installation perso de Fedora 30                                      #
################################################################################

if [ $(whoami) = "root" ];then
  echo"===============================MISE A JOUR================================="
  dnf update -y

  echo"==============================INSTALLATION MATE============================"
  dnf groupinstall mate-desktop --allowerasing -y
  dnf groupinstall mate-applications --allowerasing -y
  dnf install lightdm lightdm-gtk -y
  systemctl disable gdm.service
  systemctl enable lightdm.service

  echo"======================INSTALLATION KERNEL HEADER VMWARE===================="
  dnf install kernel-headers kernel-devel gcc glibc-headers

  echo "======================INSTALLATION DES THEMES ET SOFT====================="
  dnf copr enable tcg/themes -y && sudo dnf install la-capitaine-cursor-theme -y
  dnf install snap -y
  dnf install snapd -y
  snap install discord
  snap install opera
  snap install onlyoffice-desktopeditors
  snap install john-the-ripper
  cp -r icons ~/.icons
  cp -r themes ~/.themes
  cp bashrc ~/.bashrc
  cp hey /bin/hey
  chmod 775 /bin/hey

  echo "===========================INSTALLATION JOHN THE RIPPER==================="
  dnf install git gcc openssl-devel -y
  dnf install yasm gmp-devel libpcap-devel bzip2-devel -y
  dnf install john

  echo "=========================================================================="
  echo "Installation terminer redémarrer la machine ? [y/n]"
  read choice
  if [ $choice = "y" ];then
    reboot
  fi

else
  echo "Please, be root for the automatic install"
fi
