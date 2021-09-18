#!/bin/bash

# SCRIPT D'INSTALLATION POUR LE CLIENT CITRIX WORKSPACE VERSION 19.12.0.19
# Ce script installe automatiquement le client nécessaire à l'utilisation du service VirtUL de l'Université de Lorraine, 
# ainsi que les dépendances et certificats nécessaires au bon fonctionnement du service.
# La version utilisée est celle fournie sur le wiki de l'université, les versions récentes ne fonctionnant pas avec les serveurs de l'UL

default='\033[0m'
sucess='\033[1;32m'
warning='\033[0;33m'
error='\033[1;31m'
arch="$(uname -m)"
citrixpackagepath="/tmp/citrixclient.deb"
citrixpackagechecksum="d5512ea1fb26e65e03276fbcecc9b9f2"
gtkextpackagepath="/tmp/libgtkext1.deb"
gtkextpackagechecksum="cd55c905954e66cb2a397cd0e102fc8b"

warn() {
    echo -e "\n${warning}$1${default}"
}

exitWithErr() {
    echo -e "\n${error}$1${default}" 1>&2
    exit 1
}

# PERMISSIONS ROOT
if [ "$EUID" -ne 0 ]; then
    exitWithErr "Permissions insuffisantes - Éxécutez ce script avec sudo"
fi

# SUPPRIME LE FICHIER SI IL EXISTE DÉJÀ
if [[ -e "${citrixpackagepath}" ]]; then
    warn "Supression du paquet déjà existant..."
    rm -rf "${citrixpackagepath}"
fi

# VÉRIFICATION DE L'ARCHITECTURE
if [[ "${arch}" == "x86_64" ]]; then
    echo -e "Architecture détéctée: ${arch} - OK"
else
    exitWithErr "ERREUR: Architecture non supportée: ${arch}";
    exit 1
fi


# TÉLÉCHARGEMENT DU PAQUET
echo "Téléchargement du paquet..."

# Depuis le serveur de l'UL...
wget https://clients-virtul.su.univ-lorraine.fr/linux/19.12.0.19/deb/icaclient_19.12.0.19_amd64.deb -O ${citrixpackagepath} --timeout 120 -q --show-progress;
if [ $? -eq 0 ]; then
    echo "Téléchargement réussi"
else
    # ...en cas d'erreur, nouvelle tentative depuis un miroir
    warn "Téléchargement échoué. Essai depuis un miroir..."
    wget https://static.patrickconti.fr/icaclient_19.12.0.19_amd64.deb -O ${citrixpackagepath} --timeout 120 -q --show-progress;

    if [ $? -eq 0 ]; then
        echo "Téléchargement réussi"
    else
        exitWithErr "ERREUR: Erreur lors du téléchargement !"
    fi
fi

# VÉRIFICATION DU CHECKSUM
if [[ -e "${citrixpackagepath}" ]]; then
    echo "Vérification de l'intégrité du paquet..."
    checksum="$(md5sum ${citrixpackagepath} | awk '{ print $1 }')"
    
    if [[ "${checksum}" == "${citrixpackagechecksum}" ]]; then
        echo -e "Somme de contrôle: ${checksum} - OK"
    else
        echo "Somme de contrôle: ${checksum}"
        exitWithErr "ERREUR: Somme de contrôle invalide !"
    fi

else
    exitWithErr "ERREUR: Paquet introuvable !";
fi

# ON VÉRIFIE QUE dpkg EST BIEN INSTALLÉ SUR LA MACHINE
dpkg --version &> /dev/null
if [ $? -eq 0 ]; then
    echo "dpkg est correctement installé"
else
    exitWithErr "ERREUR: dpkg n'est pas installé ! Utilisez vous bien une distribution basée sur debian ?";
fi

# SUPPRIME LES LIENS SYMBOLIQUES SI LE DOSSIER cacerts EXISTE DÉJÀ
if [[ -e "/opt/Citrix/ICAClient/keystore/cacerts" ]]; then
    rm -rf /opt/Citrix/ICAClient/keystore/cacerts/*
fi

# INSTALLATION DU CLIENT
echo "Installation du client..."
dpkg -i "${citrixpackagepath}"
if [ $? -eq 0 ]; then
    echo "Le client est installé correctement"
else
    exitWithErr "Erreur lors de l'installation du paquet !"
fi

# AJOUT DES CERTIFICATS SSL
echo "Création de liens symboliques pour les certificats..."
ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts/
if [ $? -ne 0 ]; then
    exitWithErr "Erreur lors de la création des liens symboliques !"
fi

c_rehash /opt/Citrix/ICAClient/keystore/cacerts/
if [ $? -eq 0 ]; then
    echo "Liens créés avec succès"
else
    exitWithErr "Erreur lors de la création des liens symboliques !"
fi

# TÉLÉCHARGEMENT ET INSTALLATION DE libgtkext1

# On supprime le fichier si il existe déjà
if [[ -e "${gtkextpackagepath}" ]]; then
    warn "Supression du paquet déjà existant..."
    rm -rf "${gtkextpackagepath}"
fi

# Téléchargement depuis debian France...
wget http://ftp.fr.debian.org/debian/pool/main/g/gtkglext/libgtkglext1_1.2.0-11_amd64.deb -O ${gtkextpackagepath} --timeout 120 -q --show-progress;
if [ $? -eq 0 ]; then
    echo "Téléchargement réussi"
else
    # ...en cas d'erreur, nouvelle tentative depuis un miroir
    warn "Téléchargement échoué. Essai depuis un miroir..."
    wget https://static.patrickconti.fr/libgtkglext1_1.2.0-11_amd64.deb -O ${gtkextpackagepath} --timeout 120 -q --show-progress;

    if [ $? -eq 0 ]; then
        echo "Téléchargement réussi"
    else
        exitWithErr "ERREUR: Erreur lors du téléchargement !"
    fi
fi

# Vérification du checksum
if [[ -e "${gtkextpackagepath}" ]]; then
    echo "Vérification de l'intégrité du paquet..."
    checksum="$(md5sum ${gtkextpackagepath} | awk '{ print $1 }')"
    
    if [[ "${checksum}" == "${gtkextpackagechecksum}" ]]; then
        echo -e "Somme de contrôle: ${checksum} - OK"
    else
        echo "Somme de contrôle: ${checksum}"
        exitWithErr "ERREUR: Somme de contrôle invalide !"
    fi
else
    exitWithErr "ERREUR: Paquet introuvable !";
fi

# Installation
echo "Installation de libgtkext1..."
dpkg -i "${gtkextpackagepath}"
if [ $? -eq 0 ]; then
    echo "Le client est installé correctement"
else
    exitWithErr "Erreur lors de l'installation du paquet !"
fi


# FIN
echo -e "\n${sucess}INSTALLATION TERMINÉE${default}"
echo "Rendez-vous sur https://virtul.univ-lorraine.fr/ pour utiliser le service"

rm -rf ${citrixpackagepath}
rm -rf ${gtkexpackagepath}