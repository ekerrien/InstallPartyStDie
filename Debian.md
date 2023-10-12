 # Installation Debian sur clé USB
 
 | [Précédent](README.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Installation.md) |
 | :---   | :---: |    ---: |
 
 
 ## Principe général
 À l'issue de ce tutoriel, vous aurez une clé USB sur laquelle un système linux Debian 12.2.0 sera installé. Afin de booter sur linux, il vous suffira de
 - éteindre votre ordinateur, 
 - insérer cette clé dans un port, 
 - rallumer l'ordinateur
 - choisir le One Time Boot (OTB) afin de choisir de booter sur la clé

 En effet, le démarrage par défaut se fait sur le disque dur. Celui-ci contiendra toujours votre système d'exploitation originel et le démarrage par défaut, sans OTB sera donc inchangé. 
 
 La manipulation à réaliser pour activer le OTB dépend de votre ordinateur.
 - pour les ordinateurs Apple : appuyer sur la touche <tt>alt</tt> lorsque le son est émis au démarrage; une liste de disques disponibles apparaît, parmi lesquels la clé USB qu'il faut choisir
 - pour les PC, cela dépend de la marque. Le principe est cependant le même : il faut appuyer sur une touche au tout début de démarrage. Vous pouvez vous référer à [cette page web](https://www.disk-image.com/faq-bootmenu.htm) ou encore [celle-ci](https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/) si vous ne savez pas/ne vous souvenez plus de la touche en question.

 Pour revenir à votre système d'exploitation initial, il suffit de redémarrer l'ordinateur.
 
 Il est important que vous ayez conscience que faire tourner un système d'exploitation (linux, ici) depuis une clé USB est plus lent que de la faire tourner depuis le disque dur de votre ordinateur, notamment si celui-ci est un disque SSD. L'installation de linux en dual boot (choix du système effectué systématiquement au démarrage) n'est pas plus compliquée que ce qui est décrit ici. Il faut juste faire de la place sur le disque dur, en repartitionnant celui-ci:
 - sous Windows
   - ***Attention: BitLocker*** Vous ne pourrez pas redimensionner votre disque s'il est encrypté (par exemple avec bitlocker). Dans ce cas, il faut soit désactiver l'encryption au préalable, soit installer sur une autre support (par exemple la clé USB, ou une autre partition non encryptée). ***Dans tous les cas, prenez soin d'[ajouter votre machine à votre compte microsoft](https://support.microsoft.com/fr-fr/windows/gérer-tous-les-appareils-utilisés-avec-votre-compte-microsoft-d4044995-81db-b24b-757e-1102d148f441). Cela vous permettra de [récupérer votre clé bitlocker](https://account.microsoft.com/devices/recoverykey?refd=support.microsoft.com) en cas de besoin ultérieurement.***
   - Faire un clic droit sur l'icône windows en bas à gauche (menu démarrer): choisir *Gestion du disque* dans le menu
   - Dans la fenêtre qui s'ouvre, choisir la partition que vous souhaitez redimensionner. Cette partition doit être associée à une lettre (*Volume*, par exemple C:), être en NTFS (*Système de fichiers*) et de taille suffisante.
   - Si vous avez l'indication que la partition est chiffrée (avec BitLocker), vous ne pouvez pas continuer.
   - Sinon, faire un clic droit dessus et choisir *Réduire le volume...*. Une fenêtre de message s'ouvre et cela peut prendre du temps.
   - Quand l'analyse est terminée, une fenêtre s'ouvre, indiquant notamment la *Quantité d'espace à réduire*. Cela va correspondre à l'espace que vous aller libérer sur le disque, et dans lequel vous pourrez installer linux. Indiquez la taille souhaitée, qui ne peut dépasser celle initialement indiquée (par exemple 256000 pour 256Go d'espace disque). 
   - Si l'espace est insuffisant et que votre disque est un hdd, cliquez sur *Annuler* puis refaites un clic droit sur la partition et choisissez *Propriétés*, puis onglet *Outils*, puis cliquez sur *Optimiser* : cela lance la défragmentation du disque. Une fois cela fait, retentez de *Réduire le volume...*
   - Cliquez sur *Réduire*. Cela peut prendre un peu de temps.
   - À la fin du processus, vous verrez une nouvelle partition de la taille souhaitée, et étiquetée *Non alloué* qui apparaît à la fin de votre disque. Vous pouvez alors lancer la procédure d'installation.
 - sous MacOS, utiliser l'*Utilitaire de disque* (<tt>disk Utility.app</tt>, accessible par <tt>cmd</tt>+<tt>espace</tt>, puis entrer *disk* dans le champ de recherche spotlight)

Une fois le repartitionnement effectué, vous pourrez faire une installation plus simple : choisissez "Utilisez l'espace disponible" lorsque vous sera demandé le type d'installation souhaité.
 
## Installation
- insérez les deux clés USB: la clé d'installation (appelée "clé d'install", et la clé qui va recevoir le nouveau système (appelée "clé cible"). Mettez la clé cible de préférence sur un port USB3U
- activez le OTB, ou entrez dans le bios. Vérifiez bien que les 2 clés USB ont été détectées. Si ce n'est pas le cas, rebootez et recommencez jusqu'à ce que les 2 clés soient visibles.
- choisir de booter sur la clé d'install
- choisir 'Graphical Install'
- Select a language: choisir 'French'
- Choix de votre situation géographique : garder 'France'
- Configurer le clavier : garder 'Français'
- Configurer réseau: soit vous activez votre Access Point sur votre portable, soit choisissez ErwanAP (mot de passe: LinuxRulez), mais ayez conscience qu'il peut y avoir du monde sur cet AP, qui est fourni par mon téléphone...
- choisir un nom de machine (pas d'espace, accents ou autres caractères étranges)
- Domaine : laissez vide
- Choisir un mot de passe administrateur, et répétez-le
- Créer les utilisateurs... Entrez votre nom complet
- Valider ou modifier votre identifiant: cet utilisateur ne sera pas administrateur
- Choisir un mot de passe (peut être le même qu'admin)
- Partitionner les disques: choisir 'Assisté - utiliser un disque entier' (pour dual boot, choisir 'Assisté - utiliser le plus grand espace disponible')
- Choisir la clé cible
- Choisir 'Tout dans une seule partition'
- Cliquer sur Continuer (cela valide 'Terminer le partitionnement et appliquer les changements')
- Choisir 'Oui'
- Le système s'installe
- Configurer l'outil de gestion des paquets : Choisir 'Oui', puis 'France', puis 'deb.debian.org', laissez vide le mandataire
- Configuration de popularity-contest : choisir ce que vous voulez ('Non' a priori pour éviter des transferts d'info via le réseau)
- Sélection des logiciels : garder ce qui est sélectionné par défaut (sauf si vous savez ce que vous faites)
- Patientez... (une boisson ? un gateau ?)
- L'installation est terminée, valider le reboote du système
- enlever la clé d'install quand la machine s'éteint, mais bien laisser la clé cible branchée
- Le système reboote sur debian
- Une fois debian lancé, répondre au questionnaire post-install
- puis ouvrir un terminal
- passer root par la commande 'su -' (mot de passe admin)
- entrer la commande 'grub-install --no-nvram --removable'
- éteindre la machine

L'installation est terminée. Vérifiez que votre machine boote normalement sans la clé, et boote sous debian avec la clé (via l'OTB)

| [Précédent](README.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Installation.md) |
 | :---   | :---: |    ---: |
