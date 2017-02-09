Les 5 classes atomiques d'objets : <p>

1. Numérique  <p>
2. Logique <p>
3. Entier <p>
4. Caractère <p>
5. Complexe <p>

Types de données :
    
## Vecteurs
Les vecteurs contiennent des éléments de même classe.

## Listes
Les listes sont des vecteurs dans lesquels il est possible de varier les classes.

## Matrice
Les matrices sont remplies colonnes par colonnes. 

Il est possible de créer une matrice à partir d'un vecteur en lui donnant un attribut dimension :
dim(vect) <- c(2,5)

Il est possible de créer une matrice par jointure de vecteur (cbing et rbing, par colonne ou par ligne)
Les matrices contiennent des éléments de même classe.

## Valeurs nulles
Na / Nan

## Factor
Les facteurs modélisent des ensembles de données catégorisés (ordonnés ou non). Ils permettent d'associer un label à une valeur.
Les niveaux représentent les différences valeurs possibles des labels. Par défaut les niveaux sont organisés par ordre alphabétique.

## Dataframe
Stocke les données sous forme tabulaires. Chaque colonne peut avoir un type différent

## Lecture / écriure de données
read.table and read.csv (write.table) pour lire des fichiers plats et retourner un dataframe. (read.table, séparateur par défaut = espace; read.csv, séparateur par défaut = virgule et entête est vraie) <br/>
readLines (writeLines) lit les lignes d'un fichier et retourne des vecteurs <br/>
source (dump) ou dget (dput) pour lire du code R <br/>
load (save) et unserialize (serialize) servent à lire des objets binaires <br/>

Les fonctions dump et dput permettent de stocker des données textuelles + les méta données. Au moment de la lecture, c'est plus simple et plus efficace.
La fonction dput ne prend qu'un seul objet en paramètre. La fonction dump peut en prendre plusieurs.

## Gestion des gros fichiers de données
Il faut évaluer la taille du fichier à lire. Si il ne peut pas tenir dans la RAM du PC, ce n'est pas la peine.
Il faut éviter les lignes en commentaire => les purger avant et laisser le paramètre comment.char à vide.
Il faut absolument définir les types des colonnes du fichier. Si on ne sait pas, on peut les déterminer en prenant un échantillon du fichier (nrows)
La fonction nrow permet aussi à R d'estimer la quantité de RAM nécessaire donc ce calcul ne sera pas fait à la volée.
Prévoir environ le double de RAM par rapport à la taille du fichier

## Les sous ensembles
Les [ retournent un sous ensemble (un ou plusieurs éléments) de même classe que l'original. NB : l'index démarre à 1 
On peut spécifier un index, une plage d'index ou une condition logique (x[ x > "a" ]) 

> > x <- c("a", "b", "c", "c", "d", "a") <br/>
> > u <- x > "a" <br/>
> > u <br/>
[1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE <br/>
> > x[u] <br/>
[1] "b" "c" "c" "d" <br/>
> > <br/>
<br/>


Les [[ retournent un élément seul.
Le $ est utilisé pour extraire des éléments à partir de leur nom.
