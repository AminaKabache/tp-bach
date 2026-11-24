# REPONSES — TP N°2 :

## Exercice 2.1 — Navigation, recherche et permissions

Question : Que donne `chmod 644` sur un fichier ? Est-il exécutable par son propriétaire ?

`chmod 644` donne `rw-r--r--` : le propriétaire peut lire et modifier le fichier, les autres peuvent seulement le lire. Le propriétaire ne peut pas l'exécuter.



## Exercice 2.2 — Vérification d’espace disque

Question : Pourquoi utilise-t-on des guillemets autour de `"$UTILISATION"` dans le test `if` ?

Les guillemets protègent la valeur de la variable et évitent des erreurs si elle est vide ou contient des espaces.



## Exercice 2.3 — Sauvegarde et gestion d’erreurs

Question : Que se passe-t-il si on enlève `set -Eeuo pipefail` et que `tar` échoue ? Le script continue-t-il à tort ?

Oui, le script peut continuer après l’échec de `tar` et afficher à tort que la sauvegarde est terminée.



## Exercice 2.4 — Planification avec cron

Question : Pourquoi cron nécessite-t-il des chemins absolus alors qu’un script fonctionne avec des chemins relatifs dans le terminal ?

Cron peut s’exécuter dans un répertoire différent du terminal. Les chemins absolus permettent donc de trouver correctement les fichiers et les scripts.



## Exercice 2.5 — Préfiguration CI/CD

Question : Quelles étapes ajouter pour transformer ce script en un vrai pipeline CI ? Quels seraient les points de défaillance à gérer avec des codes de retour ?

Il faudrait ajouter l’installation des dépendances, la vérification du code, les tests, la construction et le déploiement.

Les erreurs de clonage, d’installation, de tests, de construction et de déploiement doivent être gérées avec des codes de retour.