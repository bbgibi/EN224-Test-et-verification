# Notes pour rapport

## Etape 1

RAS

## Etape 2

- [X] Utilisation de rand() et RAND_MAX = 65535 pour générer A et B
- [X] Problème à la 869 itération avec a = 30907 et b = 30078
- [X] Les nombres ne sont pas vraiment aléatoire...

- [X] Résolution 1 : utilisation de srand(time(0)) pour générer une graine permettant de générer correctement les nombre aléatoires.
- [X] Résolution 2 : problème lorsque égale à 0. Rajout d'une condition dans les fonctions RandX

## Etape 3

