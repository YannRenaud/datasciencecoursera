### XLS files
Package pour lire les fichiers excel : XLSX ou XLConnect <br>
read.xlsx() 
colIndex et rowIndex pour lire seulement une partie des données  <br>
Tutorial sur xls https://cran.r-project.org/web/packages/XLConnect/vignettes/XLConnect.pdf  <br>
<br>  
### XML files
> library("XML") <br> 
> fileURL <- "http://xxxx/file.xml"  <br> 
> doc <- xmlTreeParse(fileURL, useInternal=TRUE)  <br> 
> rootNode <- xmlRoot(doc)  <br> 
> xmlName(rootNode)  <br> 
> names(rooNode)  <br> 

<br>
rootNode donne accès au document complet. Pour accéder à un sous ensemble du document : 
rootNode[[1]] => retourne les éléments sous la 1ère balise
rootNode[[1]][[1]] => retourne les 1ers sous éléments sous la 1ère balise

<br>
xmlSApply => applique une fonction à tous les éléments / sous éléments d'un fichier xml.
Par exemple : xmlSApply(rootNode, xmlValue)

<br>
pour accéder de facçon plus précise à des éléments XML, on utilise XPath.
/node : top level node <br>
//node : node à n'importe quel niveau <br>
node[@attr-name] : Node avec un nom d'attribut <br> 
node[@attr-name = 'demo'] : Node avec nom d'attribut = demo <br> 

<br>
Exemples : 
xpathSApply(rootNode, "//name", xmlValue) : retourne la liste des valeurs pour la balise name <br>
xpathSApply(rootNode, "//price", xmlValue) : retourne la liste des valeurs pour la balise price <br>

<br>

### JSON Files
library("jsonlite") <br> 
jsondata <- fromJSON("http://xxxx/file.json")  <br> 
names(jsondata)  <br> 
names(jsondata$field) => nom des champs du sous ensemble
jsondata$fied1$field2 => valeur de l'élement field2 du sous ensemble field1

myjson <- toJSON(dataframe, pretty = TRUE)
iris2 <- fromJSON(myjson) => retourne un data frame

https://cran.r-project.org/web/packages/jsonlite/vignettes/json-aaquickstart.html

### Package Data.Table

library(data.table)

DT <- data.table (....) => construction idem data frame
tables() > listes toutes les datatables en mémoire

Quand on extrait un sous ensemble avec un seul index, il prend les lignes spécifiées

Calcul de fonctions :
DT[, list(mean(x), sum(z))] retourne une liste à deux entrée avec la moyenne de la colonne x et la somme de la colonne z.

Ajouter une nouvelle colonne :
DT[, x:=z^2]

Copie de DataTable :
DT2 <- DT 
/!\ ca créé un pointeur DT2 vers DT mais ça ne recopie pas les données.

Opérations multiples :
DT[, m:= {tmp <- (x+z) ; log2(tmp+5) }]

PLYR like opérations : 
DT[, a:= x>0] <br>
DT[, b:= mean(x+y) , by = a] => sommes les variables x et y regroupées par a (true ou false) <br>

Variables spéciales 
par exemple .N => compte le nombre d'occurences <br>
DT[, .N, by = x] => compte le nombre d'occurences de chaque élément x <br>

Keys
la fonction setkey(datatable, column) permet de déclarer une clé et donc indexé les données sur ce champs. <br>
Cela permet d'optimiser les temps de traitements <br>
Les clés permettent aussi de faciliter les jointures <br>
setkey(DT1, x) <br>
setkey(DT2, x) <br>
merge(DT1, DT2) <br>

### Lecture de MySQL

Connexion à la base : myCnx <- dbConnect(MySQL(), user=" ", db=" ", host=" ")
Requêter la base : dbGetQuery(myCnx, "my query;")
Liste tables : dbListTables(myCnx)
Listes champs : dbListFields(myCnx, "Table")
Créer un data.table à partir un select * : dbReadTable(myCnx, "Table")
Pour les grosses requêtes : myQuery <- dbSendQuery(myCnx, "query") ; data <- fetch(query [, n=10]) ; dbClearResult(myQuery)
Fermeture de connexion : dbDisconnect(myCnx)

### Lecture de pages Web

con <- url("my url)
htmlLines <- readLines(con)

Deuxième méthode : 
Package (httr)
  html2 <- get("url")
  content2 <- content(html2, as="text")
  parsedHTML <- parseHTML(Content2, asText=TRUE)

Avec la commande Handle, on conserve l'authentification et les cookies dans notre session.


Httr propose les requetes GET, PUT, DELETE, POST

