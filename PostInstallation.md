# Procédure de post-installation

- Au redémarrage, si vous aviez sélectionné *Installer des logiciels tiers...* et entré un mot de passe, vous voyez apparaître un menu sur fond bleu *Perform MOK Management*.
  - Choisissez *Enroll MOK*
  - Puis *Continue*
  - Puis *Yes*
  - Entrez le mot de passe indiqué lors de l'installation. Attention, il est probable que votre clavier soit en qwerty, sans que vous le sachiez. En cas d'erreur sur la clé, pensez à entrer le mot de passe comme sur un clavier qwerty, avec notamment les az qui sont échangés avec qw et les chiffres qui sont entrés sans touche de majuscule.
  - Puis *Reboot*: l'ordinateur redémarre
- au redémarrage, appuyez vite sur la touche qui fait apparaître le *Boot Menu* 
  - Si vous avez un écran noir intitulé *GNU GRUB...*. Entrez <tt>reboot</tt> puis <tt>Entrée</tt> et recommencez jusqu'à ce que le *Boot menu* apparaisse
- Choisissez *Ubuntu* dans le menu
- Connectez-vous avec le mot de passe indiqué lors de l'installation pour l'utilisateur
- Ouvrez un terminal
  -  sous Ubuntu: touche Windows, puis entreé *term* dans le champ de recherche. Cliquez sur le terminal
  -  sous Xubuntu: menu (icone avec une tête de souris blanche sur fond bleu, en haut à gauche), puis *Favoris*, puis *Emulateur de terminal*
- Dans le terminal, tapez les commandes suivantes :
  - <tt>sudo mv /boot/efi/EFI/ubuntu /home/
