[Retour à la post-installation](PostIntallation.md)

## Windows se lance directement
- au redémarrage, appuyez vite sur la touche qui fait apparaître le *Boot Menu* 
  - Choisissez l'option de boot qui correspond à linux
  - Si linux se lance bien, le problème était sans doute lié au fait que le démarrage depuis le disque dur était prioritaire sur le démarrage depuis la clé USB. Lors du prochain démarrage, il faudra revenir dans le BIOS et changer l'ordre de priorité des *Boot options* afin que la clé USB vienne en premier
 
 
## J'ai un écran noir avec <tt>grub ></tt>
L'installation du boot loader a échoué. Il faut lancer ubuntu via grub rescue [cette page](https://doc.ubuntu-fr.org/grub-pc#demarrer_ubuntu_a_partir_de_grub_et_grub_rescue) vous y aidera.

Une cause probable est que le boot loader a été installé sur la partition EFI du disque dur et non celle de la clé USB. Il faut donc régler ça. Pour ce faire, il faut virer ubuntu de la partition EFI du disque dur et réinstaller le grub sur la clé. On fait tout ça à partir d'un terminal sous ubuntu lancé depuis la clé.
- Pour connaître les disques : <tt>sudo fdisk -l</tt>
- Monter la partition EFI du disque dur (on suppose que c'est <tt>/dev/sda1</tt> <tt>mkdir -p /mnt/efi && mount /dev/sda1 /mnt/efi</tt>
- Virer ubuntu : il est présent si un répertoire <tt>ubuntu</tt> existe. Si c'est le cas : <tt>sudo \rm -rf ubuntu</tt>
- Réinstaller le boot loader. On suppose que la clé est connu sous <tt>/dev/sdb</tt> : <tt> sudo grub-install /dev/sdb</tt>
- 
## Autres manips possibles (mais sans doute obsolete)
- Choisissez *Ubuntu* dans le menu
- Connectez-vous avec le mot de passe indiqué lors de l'installation pour l'utilisateur
- Ouvrez firefox et récupérez ce fichier [https://github.com/ekerrien/InstallPartyStDie/blob/main/postInstall.sh](postInstall.sh)
- Ouvrez un terminal
  -  sous Ubuntu: touche Windows, puis entreé *term* dans le champ de recherche. Cliquez sur le terminal
  -  sous Xubuntu: menu (icone avec une tête de souris blanche sur fond bleu, en haut à gauche), puis *Favoris*, puis *Emulateur de terminal*
- Dans le terminal, tapez les commandes suivantes :
  - <tt>sudo chmod 755 ~/Téléchargements/postInstall.sh</tt> (indiquez votre mot de passe)
  - <tt>sudo ~/Téléchargements/postInstall.sh</tt>
- Redémarrez l'ordinateur en appuyant sur la touche d'arrêt qui vous propose un menu de redémarrage
    - Si ce n'est pas le cas (Windows se lance alors que la clé est insérée) : allez dans le menu du BIOS et changer l'ordre de options de boot, en mettant la partition 1 de la clé USB en premier
    - Une alternative, si la touche de lancement du *Boot menu* fonctionne bien, alors vous pouvez l'utiliser lorsque vous souhaitez lancer linux (même fonctionnement que pour MacOS)

## Ma clé d'installation n'apparait pas dans le boot Menu

- Redémarrez votre ordinateur en appuyant sur la touche vous donnant accès au Bios. Pour connaître la touche en fonction de la marque de votre PC, vous pouvez vous référer à [cette page](https://www.disk-image.com/faq-bootmenu.htm) ou bien [celle-ci](https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/). Dans de nombreux cas, la touche en question est indiquée brièvement dans un message à l'écran.
- Une fois dans le Bios, assurez vous que l'option **Secure Boot** est désactivée. Si le **Secure Boot** est actif, **désactivez le** et redémarrez votre appareil.
- Si la clé n'est toujours pas détectée, c'est que l'iso a été mal *flashé* sur celle-ci. Vous devez donc créer **correctement** la clé d'installation [ici](Preparatifs.md).
- Pour les étourdis ayant oublié leur mot de passe de Bios (optionnel), entrez trois fois un mot de passe faux. Un choix s'offre alors à vous <tt>enter unlock password</tt> ou <tt>system shutdown</tt>, sélectionnez <tt>enter unlock password</tt>. Un message <tt>enter unlock password key</tt> : **votre clé** apparait, Copiez la clé sur [ce site web](https://bios-pw.org/) et appuyez sur <tt>get password</tt>. Choisissez le mot de passe correspondant au modèle de votre pc et rentrez le dans <tt>enter unlock password key</tt> : **votre clé**.

[Retour à la post-installation](PostIntallation.md)
