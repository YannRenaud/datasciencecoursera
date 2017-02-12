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

> x <- c("a", "b", "c", "c", "d", "a") <br/>
> u <- x > "a" <br/>
> u <br/>
> [1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE <br/>
> x[u] <br/>
> [1] "b" "c" "c" "d" <br/>
> <br/>
<br/>

Les [[ retournent un élément seul.
On peut utiliser une variable contenant le nom de l'attribut à extraire dans les [[
> x <- list(a=list(10,12,14), b=c(3.14, 2.81)) <br/>
> x[[c(1,3)]] <br/>
> [1] 14 <br/>
> x[[1]][[3]] <br/>
> [1] 14 <br/>
> x[[c(2,1)]] <br/>
> [1] 3.14 <br/>
>  <br/>

<br/>
Le $ est utilisé pour extraire des éléments à partir de leur nom.

Par défaut, quand on sélectionne un seul élément d'une matrice, ça retourne un vecteur (au lieu d'une matrice 1x1). Pour empecher ce comportement, il faut utiliser l'option drop = FALSE)

Recherche approximative à partir des noms => exact = FALSE

Supprimer les valeurs vides 
> x <- c(1, 2, 3, NA, 4, NA, 5) <br/>
> bad <- is.na(x) <br/>
> x[!bad] <br/>
> [1] 1 2 3 4 5 <br/>
>  <br/>

> x <- c(1, 2, 3, NA, 4, NA, 5) <br/>
> bad <- is.na(x) <br/>
> bad <br/>
> [1] FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE <br/>
> x[!bad] <br/>
> [1] 1 2 3 4 5 <br/>
>  <br/>

complete.case fonctionne aussi avec des matrices dans ce cas, utiliser la syntaxe :
x[good,][1:6,]





Ressources :

https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd


Boucles for

> x <- c("a", "b", "c", "d")
> for (i in 1:4) {
>     print(x[i])
> }
>
> for (i in seq_along(x)){
>     print(x[i])
> }
>
> for (letter in x){
>     print(letter)
> }
>

## Les fonctions

Dans R, les fonctions retournent la valeur de la dernière expression.
Les fonctions sont des objets. Elles peuvent donc être passées en argument d'autres fonctions.
Si on surcharge une fonction, R recherche en premier dans l'environnement global (le workspace) donc l'utilise. Si on veut la fonction d'un package particulier, l faut le préciser. La fonction search() indique l'ordre de recherche des objets.
Closure = fonction + environnement d'exécution
Free variables => variables d'environnement (qui peuvent être utilisées à l'interieure de fonction).
Ceci implique qu'une fonction peut retourner des résultats différents en fonction de l'environnement dans lequel elle est exécutée.
C'est également très intéressant quand on définie des fonctions à l'interieur d'autres fonctions (dans ce cas, la fonction "mère" est l'environnement de la fonction "fille").
Pour explorer l'environnement d'une fonction, on utilise la fonction ls(environnement(_function_))

Lexical scoping => les free variables prennent les valeurs du contexte dans lequel la fonction est définie
Dynamic scoping => les free variables prennent les valeurs du contexte dans lequel la fonction est appelée

R utilise le lexical scoping.

## Dates / Times
Les dates sont représentées par la class date
Les timestamp sont représentés par les classe POSIXct et POSIXlt
Les dates sont des nombres de jours depuis 01/01/1970
Les timestamps des nombres de secondes depuis 01/01/1970
La classe POSIXlt comporte bcp d'informations en plus du nombre de secondes depuis le 01/01/1970 (jour, mois, année, semaine etc...). Ces objets sont représentés par les listes d'éléments

> x = Sys.time()
> x
>[1] "2017-02-12 23:07:54 CET"
> p <- as.POSIXlt(x)
> names(unclass(p))
> [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"   "isdst"  "zone"   "gmtoff"
> p$sec
>[1] 54.27441
> p$min
>[1] 7
> 


La fonction strptime convertie des strings en date
