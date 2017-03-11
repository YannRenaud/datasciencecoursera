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


