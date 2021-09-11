 # Etapes préparatoires
 ## Principe général
 À l'issue de ce tutoriel, vous aurez une clé USB sur laquelle un système linux sera installé. Afin de booter sur linux, il vous suffira de
 - éteindre votre ordinateur, 
 - insérer cette clé dans un port, 
 - rallumer l'ordinateur
 - choisir le One Time Boot (OTB) afin de choisir de booter sur la clé

 En effet, le démarrage par défaut se fait sur le disque dur. Celui-ci contiendra toujours votre système d'exploitation originel et le demarrage par défaut sera donc inchangé. 
 
 La manipulation à réaliser pour activer le OTB dépend de votre ordinateur.
 - pour les ordinateurs Apple : appuyer sur la touche <tt>alt</tt> lorsque le son est émis au démarrage; une liste de disque disponibles apparaît, parmi lesquels la clé USB qu'il faut choisir
 - pour les PC, cela dépend de la marque. Le principe est cependant le même : il faut appuyer sur une touche au tout début de démarrage. Vous pouvez vous référer à [cette page web](https://www.disk-image.com/faq-bootmenu.htm) ou encore [celle-ci](https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/) si vous ne savez pas/ne vous souvenez plus de la touche en question.

 Pour revenir à votre système d'exploitation initial, il suffit de redémarrer l'ordinateur.
 
 Il est important que vous ayez conscience que faire tourner un système d'exploitation (linux, ici) depuis une clé USB est plus lent que de la faire tourner depuis le disque dur de votre ordinateur, notamment si celui-ci est un disque SSD. L'installation de linux en dual boot (choix du système effectué systématiquement au démarrage) n'est pas plus compliqué que ce qui est décrit ici. Il faut juste faire de la place sur le disque dur, en repartitionnant celui-ci.
 
 ## Matériel nécessaire
 Pour suivre ce tutoriel vous aurez besoin de:
 - une clé USB d'au moins 32 Go : le système linux sera installé sur cette clé (voir le principe exposé ci-dessus). Cette clé pourra vous être donnée gracieusement par l'IUT lors de l'install party
 - une autre clé USB d'au moins 4 Go : cette clé contiendra l'image des fichiers d'installation. Les animateurs de l'install party en auront tout un stock à disposition, sachant que cette clé n'est plus utile une fois l'installation terminée. Vous pouvez cependant venir avec votre propre clé si vous voulez réaliser l'installation de A à Z
 - l'ordinateur sur lequel vous lancerez le linux installé sur la clé USB. Les fichiers et la configuration du système d'exploitation sont en effet très dépendants du materiel sur lequel le système s'exécute. Vous ne pourrez donc a priori pas lancer le linux installé sur la clé, à partir d'un autre ordinateur que celui sur lequel l'installation aura été faite.

## Choix et téléchargement de l'image linux
Par défaut, il est proposé d'installer la version LTS (long time support) d'[Ubuntu][https://ubuntu.com). Aujourd'hui, il s'agit de la version 20.04.3 qui est [supportée jusqu'en 2025 (2030 pour les mises à jour de sécurité)](https://ubuntu.com/about/release-cycle).


La configuration matérielle recommandée pour une bonne expérience utilisateur est la suivante :
- processeur de 2 GHz dual core
- mémoire système (RAM) de 4 GiO
- espace disque de 25 Go : il s'agit ici de la clé USB sur laquelle linux sera installé
- écran compatible VGA avec une résolution minimale de 1024x768
- 2 ports USB (pour l'installation)
- accès internet

Il est possible que votre ordinateur soit plus ancien et/ou avec un matériel de puissance insuffisante, ou trop proche de la limite. Il existe des alternatives dites "lègères" à Ubuntu que vous pouvez installer. Dans ce tutoriel, nous avons choisi [Xubuntu](https://xubuntu.org) qui recommande la [configuration minimale suivante](https://xubuntu.org/requirements/) :
- processeur 1.5Ghz dual core
- mémoire système (RAM) de 2 GiO
- espace disque de 20 Go
- 2 ports USB
- accès internet

Nous ne décrivons ici que l'installation de la version 64 bits qui convient à la plupart des processeurs suffisamment récents. Des version 32 bits existent aussi, notamment pour Xubuntu.
