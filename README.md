Starter Pack R -++ - Bonnes pratiques de Dev
Informations
Initié : Août 2022

Interlocuteurs : Business & Decision 

STARTER PACK R - POO - BONNES PRATIQUES

- Description
--> L'objectif de ce projet est de vous accompagner dans la mise en place d'un travail en R reproductible.
Le  package est l'unité fondamentale pour une bonne collaboration en équipe.
Ce kit de démarrage permettra de vous aider à transformer votre code en packages que d’autres peuvent facilement télécharger et utiliser.

--> Un package R inclue des fonctions R réutilisables, la documentation qui décrit comment les utiliser et des exemples de données.
Celui-ci doit faciliter votre organisation lors de vos développements. Vous pouvez y retrouver différents dossiers et eléments dont chacun répond à des objectifs précis :


-**dossier documentation** : Permet d'enregistrer dans un emplacement défini les documentations relatives à votre projet. Pour le starter pack, on y retrouve les documents rédigés sur les bonnes pratiques de développement (linters, formateurs, tests unitaires) et la Programmation Orientée Objet (POO) notamment.
dossier logs : Contient les fichiers de logs générés lors de l'exécution de nos programmes R. Ce dossier a été spécifié dans le fichier du dossier config.

-**dossier src** : Les différents scripts R nécessaires au fonctionnement du projet sont enregistrés dans ce dossier et peuvent être appelés dans le traitement principal main.R.
dossier tests : Dossier où sont enregistrés les différents scripts permettant de faire les tests unitaires (TU) de notre code. Les tests qu'ils contient sont exécutés avec la commande "pytest" dans le terminal. La première fois qu'on lance le protocole de test dans notre répertoire projet, un dossier automatique ".Rtest_cache" est également créé.
fichier main.R : Script principal du projet que l'on exécute pour que le traitement attendu soit réalisé. Il fait appel aux différentes classes du dossier src.

-**fichier README.md** : C'est le présent fichier. Il constitue la documentation principale du projet, c'est-à-dire celle qui doit être lue en premier par un utilisateur qui veut comprendre de quoi le projet traite.
Cas d'usage utilisé dans le starter pack
Ici le cas d'usage employé est très simple à appréhender. Nous avons un fichier Excel d'entrée (data/input/Mars2022.csv) qui comporte diverses informations relatives à des logements. L'objectif du programme est de mettre à jour les prix le mois suivant et généré un nouvel export (data/output/Avril2022.csv)

Pour l'import des données, il y a une classe ImportData (src/ImportData.R), sans attributs de classes mais avec une méthode de classe nommée load() qui permet de charger les données d'un fichier spécifié en paramètre dans un dataframe R.

A partir de ce dataframe, nous créons une liste d'objets de type Logement (scr/Logement.R). Un logement est défini par un ID, une adresse, une ville, une catégorie (appartement ou maison), une surface et un prix. La fonction createListLogement() transforme ainsi le précédent dataframe en une liste de Logement.

Ensuite, puisque nous avons des logements, nous pouvons leur appliquer la méthode updatePrice() qui va faire la mise à jour des prix. Une fois que nos données sont prêtes, on appelle la classe ExportData (scr/ExportData.R), qui à la manière du importData ne comporte pas d'attributs de classe mais une méthode export () qui nous permets d'envoyer les données dans le dossier data.output avec le nom de fichier souhaité à spécifier en paramètre.

Pour ce petit cas d'usage, nous avons mis en oeuvre les bonnes pratiques relatives à la POO, c'est-à-dire que le code est divisé en plusieurs classes dont chacune remplit des fonctions. L'objectif est d'éviter d'avoir un code main.R illisible et compact comprenant l'ensemble le code afin d'en faciliter la reprise et la compréhension.