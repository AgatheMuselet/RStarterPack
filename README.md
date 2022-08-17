Starter Pack R - POO - Bonnes pratiques de Dev
Informations
Initié le : 29/04/2022

Interlocuteurs : Estelle ROSSET, Long NGUYEN, Erwan JOSSE, Raphaël LE GOFF

Dans le cadre du projet interne DataScience STARTER PACK R - POO - BONNES PRATIQUES

Description
L'objectif de ce projet est d'avoir un package de démarrage pour vos projets réalisés en langage R. Celui-ci doit faciliter votre organisation lors de vos développements. Vous pouvez y retrouver différents dossiers et eléments dont chacun répond à des objectifs précis :

dossier config : On y met les fichiers de config pour configurer une connexion à un serveur/une BDD, ou encore spécifier la configuration de nos logs.
dossier data : Répertorie les fichiers de données en entrée dans un premier sous-dossier et les données en sortie dans un second.
dossier documentation : Permets d'enregistrer dans un emplacement défini les documentations relatives à votre projet. Pour le starter pack, on y retrouve les documents rédigés sur les bonnes pratiques de développement (linters, formateurs, tests unitaires) et la Programmation Orientée Objet (POO) notamment.
dossier logs : Contient les fichiers de logs générés lors de l'exécution de nos programmes R. Ce dossier a été spécifié dans le fichier du dossier config.
dossier src : Les différents scripts R nécessaires au fonctionnement du projet sont enregistrés dans ce dossier et peuvent être appelés dans le traitement principal main.R.
dossier tests : Dossier où sont enregistrés les différents scripts permettant de faire les tests unitaires (TU) de notre code. Les tests qu'ils contient sont exécutés avec la commande "pytest" dans le terminal. La première fois qu'on lance le protocole de test dans notre répertoire projet, un dossier automatique ".Rtest_cache" est également créé.
fichier main.R : Script principal du projet que l'on exécute pour que le traitement attendu soit réalisé. Il fait appel aux différentes classes du dossier src.
####fichier COVERAGE : Il est automatiquement généré dès qu'on évalue la couverture (coverage) des tests de notre projet. Pour cela il faut installer le package coverage et exécuter la commande "coverage run -m pytest".
#### fichier .pre-commit-config.yaml : Fichier qui permet de configurer quels hooks sont à exécuter au moment de faire une commande git commit. Par exemple, il permet de faire des vérifications de code et de s'assurer que les tests unitaires sont OK.
fichier setup.cfg : Fichier de configuration utilisé pour décrire de manière macro le contenu d'un répertoire projet et les informations principales qui en découlent.
fichier requirements.txt : Il contient les packages présents sur l'environnement de travail du développeur et qui sont donc nécessaires au bon fonctionnement du code. On génère ce fichier par la commande "pip3 freeze > requirements.txt"
fichier LICENSE : Spécifie par quelle license juridique est couvert notre projet. Ici, on retrouve la licence gratuite MIT qui accorde aux utilisateurs finaux du logiciel des droits tels que la copie, la modification, la distribution, etc. Celle-ci n'est pas soumise aux droits d'auteur et les développeurs sont libres d'apporter des modifications comme bon leur semble, elle est donc parfaitement adaptée au projet open source. En fonction de vos projets, se renseigner sur les autres licenses existantes pour protéger votre projet.
fichier README.md : C'est le présent fichier. Il constitue la documentation principale du projet, c'est-à-dire celle qui doit être lue en premier par un utilisateur qui veut comprendre de quoi le projet traite.
Cas d'usage utilisé dans le starter pack
Ici le cas d'usage employé est très simple à appréhender. Nous avons un fichier Excel d'entrée (data/input/Mars2022.csv) qui comporte diverses informations relatives à des logements. L'objectif du programme est de mettre à jour les prix le mois suivant et généré un nouvel export (data/output/Avril2022.csv)

Pour l'import des données, il y a une classe ImportData (src/ImportData.R), sans attributs de classes mais avec une méthode de classe nommée load() qui permets de charger les données d'un fichier spécifié en paramètre dans un dataframe R.

A partir de ce dataframe, nous créons une liste d'objets de type Logement (scr/Logement.R). Un logement est défini par un ID, une adresse, une ville, une catégorie (appartement ou maison), une surface et un prix. La fonction createListLogement() transforme ainsi le précédent dataframe en une liste de Logement.

Ensuite, puisque nous avons des logements, nous pouvons leur appliquer la méthode updatePrice() qui va faire la mise à jour des prix. Une fois que nos données sont prêtes, on appelle la classe ExportData (scr/ExportData.R), qui à la manière du importData ne comporte pas d'attributs de classe mais une méthode export () qui nous permets d'envoyer les données dans le dossier data.output avec le nom de fichier souhaité à spécifier en paramètre.

Pour ce petit cas d'usage, nous avons mis en oeuvre les bonnes pratiques relatives à la POO, c'est-à-dire que le code est divisé en plusieurs classes dont chacune remplit des fonctions. L'objectif est d'éviter d'avoir un code main.R illisible et compact comprenant l'ensemble le code afin d'en faciliter la reprise et la compréhension.