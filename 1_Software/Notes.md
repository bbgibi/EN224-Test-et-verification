# Notes pour rapport

## Etape 1

RAS

## Etape 2

- [X] Utilisation de rand() et RAND_MAX = 65535 pour générer A et B
- [X] Problème à la 869 itération avec a = 30907 et b = 30078
- [X] Les nombres ne sont pas vraiment aléatoire...

- [X] Résolution 1 : utilisation de srand(time(0)) pour générer une graine permettant de générer correctement les nombre aléatoires.
- [X] Résolution 2 : problème lorsque égale à 0. Rajout d'une condition dans la fonctions PGCD

## Etape 3

- [X] Definition de Write : permet d'ecrire dans un fichier des valeurs random
- [X] Calcul du PGCD dans Excel
- [X] Definition de Read : permet de reprendre les valeurs compute dans excel puis comparer

## Etape 4

- [X] Interet : permet de vérifier lors du debuggage où les conditions ne sont pas remplies
- [X] Inconvenients : Lors du passage en mode final, ne résout en rien l'erreur

## Etape 5

- [X] Limitations : 

## Etape 6

- [X] Interet : permet de vérifier simplement des valeurs spécifiques
- [X] Inconvenients : l'écriture est très longue et ne permet pas de tester un grand nombre de valeurs

## Etape 7

L'intérêt est qu'on puisse aisément voir les erreurs VS ce qu'on attend, le nombre de tests PASS/FAILED
L'inconvénient est que l'écriture des tests est relativement longue (principe du test unitaire)