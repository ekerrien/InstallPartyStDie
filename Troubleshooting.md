[Retour à la post-installation](PostIntallation.md)

## Windows se lance directement
- au redémarrage, appuyez vite sur la touche qui fait apparaître le *Boot Menu* 
  - Choisissez l'option de boot qui correspond à linux
  - Si linux se lance bien, le problème était sans doute lié au fait que le démarrage depuis le disque dur était prioritaire sur le démarrage depuis la clé USB. Lors du prochain démarrage, il faudra revenir dans le BIOS et changer l'ordre de priorité des *Boot options* afin que la clé USB vienne en premier
 
 
## J'ai un écran noir avec <tt>grub ></tt>
L'installation du boot loader a échoué. 

On commence par donner la manipulation, version courte. Des explications détaillées sont données ensuite.

### Manips en fasttrack
- relancer l'ordi avec (X)Ubuntu lancé depuis en live (Bouton "Essayer" sous Ubuntu, option "Try Xubuntu without installing" pour Xubuntu)
- ouvrir un terminal et se mettre root : commande <tt>sudo su</tt>
- lister les disques : commande <tt>fdisk -l</tt>. Normalement 3 disques apparaissent :
  - un disque avec une partition EFI et des partitions Windows : on suppose ici que c'est <tt>/dev/sda</tt>. Notez le numéro de la partition EFI (on suppose que c'est <tt>/dev/sda1</tt>)
  - un disque avec une partition EFI, une partition ext4 (linux), et surtout une première partition (TYPE A VERIFIER). Ce disque est la clé d'installation : on suppose que c'est <tt>/dev/sdb</tt>
  - un disque avec une partitition EFI, une partition ext4 (linux) et normalement une partition swap (si vous avez bien suivi le tuto...). Ce disque est la clé de 256Go sur laquelle vous venez d'installer linux. On suppose ici que c'est <tt>/dev/sdc</tt>. Notez le numéro de la partition EFI (on suppose que c'est <tt>/dev/sdc1</tt>) ainsi que la partition linux (on suppose que c'est <tt>/dev/sdc5</tt>)
- monter la parition EFI du disque qui contient Windows. Y effacer le boot loader ubuntu
  - <tt>mkdir /mnt/win</tt>
  - <tt>mount /dev/sda1 /mnt/win</tt>
  - <tt>rm -rf /mnt/win/EFI/ubuntu</tt>
  - <tt>umount /mnt/win</tt>
  - <tt>rmdir /mnt/win</tt>
- préparer l'arborescence pour pouvoir basculer sur le linux installé sur la clé de 256Go
  - <tt>mount /dev/sdc5 /mnt</tt>
  - <tt>mount /dev/sdc1 /mnt/boot/efi</tt>
  - <tt>mount -B /dev /mnt/dev</tt>
  - <tt>mount -B /dev/pts /mnt/dev/pts</tt>
  - <tt>mount -B /sys /mnt/sys</tt>
  - <tt>mount -B /proc /mnt/proc</tt>
  - <tt>mount -B /run /mnt/run</tt>
  - Note: on peut réaliser tout cela en une seule ligne de commande : <tt>for i in /dev /dev/pts /sys /proc /run; do mount -B $i /mnt$i; done</tt>
- basculer sur cette nouvelle arborescence et résinstaller grub
  - <tt>chroot /mnt</tt>
  - <tt>grub-install /dev/sdc</tt> (Note: l'option <tt>--removable</tt> peut s'avérer utile parfois)
  - <tt>exit</tt>
- rebooter

Note: on peut éviter une grande partie de cette manip en lançant l'ubuntu installé sur la clé, directement depuis grub rescue. [Cette page](https://doc.ubuntu-fr.org/grub-pc#demarrer_ubuntu_a_partir_de_grub_et_grub_rescue) vous y aidera, mais cela peut s'avérer plus ardu qu'avec la méthode présentée ci-dessus.

### Explications détaillées
A FAIRE

## Ma clé d'installation n'apparait pas dans le boot Menu

- Redémarrez votre ordinateur en appuyant sur la touche vous donnant accès au Bios. Pour connaître la touche en fonction de la marque de votre PC, vous pouvez vous référer à [cette page](https://www.disk-image.com/faq-bootmenu.htm) ou bien [celle-ci](https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/). Dans de nombreux cas, la touche en question est indiquée brièvement dans un message à l'écran.
- Une fois dans le Bios, assurez vous que l'option **Secure Boot** est désactivée. Si le **Secure Boot** est actif, **désactivez le** et redémarrez votre appareil.
- Si la clé n'est toujours pas détectée, c'est que l'iso a été mal *flashé* sur celle-ci. Vous devez donc créer **correctement** la clé d'installation [ici](Preparatifs.md).
- Pour les étourdis ayant oublié leur mot de passe de Bios (optionnel), entrez trois fois un mot de passe faux. Un choix s'offre alors à vous <tt>enter unlock password</tt> ou <tt>system shutdown</tt>, sélectionnez <tt>enter unlock password</tt>. Un message <tt>enter unlock password key</tt> : **votre clé** apparait, Copiez la clé sur [ce site web](https://bios-pw.org/) et appuyez sur <tt>get password</tt>. Choisissez le mot de passe correspondant au modèle de votre pc et rentrez le dans <tt>enter unlock password key</tt> : **votre clé**.

[Retour à la post-installation](PostIntallation.md)
