# Préparation du disque
 
 | [Précédent](Preparatifs.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Installation.md) |
 | :---   | :---: |    ---: |
 
 
 ## Principe général
 Le bootloader des systèmes EFI a besoin d'une partition étiquetée ESP sur le disque de lancement, mais il ne peut en gérer qu'une seule sur tout le système.
Ceci crée un problème si on veut installer un système indépendant sur un nouveau support, comme dans notre cas. Le truc, décrit sur [cette page](https://itsfoss.com/intsall-ubuntu-on-usb/)
consiste à simplement retirer l'étiquette ESP du disque dur, ce qui permettra à l'installateur d'en créer une nouvelle sur la clé USB lors de l'installation.
L'étiquette sera remise en fin d'installation sur la partition du disque dur afin de restaurer votre machine dans son état d'origine.

## Manipulation
- éteignez la machine
- insérez la clé d'installation
- choisissez "Try (x)ubuntu" (Essayer (x)ubuntu)
- une fois le système lancé, appuyez sur la touche Windows, et cherchez l'appli gparted. Lancez-là.
- Si l'appli gparted n'est pas disponible, installez-la en
  - connectez-vous à internet
  - ouvrez un terminal
  - lancez la commande <code>sudo apt update</code>
  - lancez la commande <code>sudo apt install gparted</code>
  - lancez la commande <code>sudo gparted</code>
- identifiez la partition (taille aux alentours de 100-500 Mo) étiquetée ESP
- faites un click droit dessus
- sélectionnez "Manage Flags"
- normalement les étiquettes 'boot' et 'esp' sont sélecionnées. Désélectionnez-les. Il est possible que cela active l'étiquette 'mftdata', ce qui est normal.
- 

| [Précédent](Preparatifs.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Installation.md) |
 | :---   | :---: |    ---: |
