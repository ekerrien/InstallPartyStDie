# Préparation du disque
 
 | [Précédent](Preparatifs.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Installation.md) |
 | :---   | :---: |    ---: |
 
 
 ## Principe généralLe bootloader des systèmes EFI a besoin d'une partition étiquetée ESP sur le disque de lancement, mais il ne peut en gérer qu'une seule sur tout le système.
Ceci crée un problème si on veut installer un système indépendant sur un nouveau support, comme dans notre cas. Le truc, décrit sur [cette page](https://itsfoss.com/intsall-ubuntu-on-usb/)
consiste à simplement retirer l'étiquette ESP du disque dur, ce qui permettra à l'installateur d'en créer une nouvelle sur la clé USB lors de l'installation.
L'étiquette sera remise en fin d'installation sur la partition du disque dur afin de restaurer votre machine dans son état d'origine.
