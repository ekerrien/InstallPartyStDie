| [Précédent](Installation.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Configuration.md) |
 | :---   | :---: |    ---: |

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
- Ouvrez firefox et récupérez ce fichier [https://github.com/ekerrien/InstallPartyStDie/blob/main/postInstall.sh](postInstall.sh)
- Ouvrez un terminal
  -  sous Ubuntu: touche Windows, puis entreé *term* dans le champ de recherche. Cliquez sur le terminal
  -  sous Xubuntu: menu (icone avec une tête de souris blanche sur fond bleu, en haut à gauche), puis *Favoris*, puis *Emulateur de terminal*
- Dans le terminal, tapez les commandes suivantes :
  - <tt>sudo chmod 755 ~/Téléchargements/postInstall.sh</tt> (indiquez votre mot de passe)
  - <tt>sudo ~/Téléchargements/postInstall.sh</tt>
- Redémarrez l'ordinateur en appuyant sur la touche d'arrêt qui vous propose un menu de redémarrage
- Au redémarrage:
  - **Sous MacOS**, MacOS se lance automatiquement. Pour lancer linux, vérifiez que la clé USB est insérée, et appuyez sur <tt>alt</tt> au démarrage afin de pouvoir choisir de démarrer sur la clé.
  - **Sous Windows**: le comportement normal est que si la clé est insérée, linux se lance, sinon Windows se lance. 
    - Si ce n'est pas le cas (Windows se lance alors que la clé est insérée) : allez dans le menu du BIOS et changer l'ordre de options de boot, en mettant la partition 1 de la clé USB en premier
    - Une alternative, si la touche de lancement du *Boot menu* fonctionne bien, alors vous pouvez l'utiliser lorsque vous souhaitez lancer linux (même fonctionnement que pour MacOS)

| [Précédent](Installation.md) | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | [Suivant](Configuration.md) |
 | :---   | :---: |    ---: |
