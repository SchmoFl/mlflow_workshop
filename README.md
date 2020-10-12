# mlflow_workshop

## Technische Voraussetzungen

### Betriebssystem
Grundsätzlich sollten *R* und *mlflow* unter jedem Betriebssystem funktionieren. Allerdings gibt es in der aktuellen Version einen Fehler bei der Nutzung von *mlflow* in der Kombination mit *R* auf *Windows* (der Grund dafür ist noch nicht geklärt). Vorzugsweise sind also *macOS* oder *Linux* zu benutzen. Möglicherweise funktioniert es aber auch unter *Windows*.

### Software
* **Anaconda3**: https://docs.anaconda.com/anaconda/install/
* **R**: https://cran.r-project.org/bin/windows/base/
* **RStudio**: https://rstudio.com/products/rstudio/download/
* ggf. **git**: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git (zum Download des Repos)
* **mlflow**: Kann mit dem R-Befehl `mlflow::install_mlflow()` installiert werden - https://www.mlflow.org/docs/latest/R-api.html#install-mlflow
* **keras**: Kann mit dem R-Befehl `keras::install_keras()` installiert werden - https://keras.rstudio.com/reference/install_keras.html

### R-Pakete
Folgende Pakete können mit dem R-Befehl `install.packages(NAME_DES_PAKETS)` installiert werden, also bspw.: `install.packages("tidyverse")`:

* **tidyverse**
* **tidymodels**
* **mlflow**
* **ranger**
* **rpart**
* **kernlab**
* **keras** (optional)
* **tensorflow** (optional)

Die Pakete **keras** & **tensorflow** werden nur für ein Beispiel gebraucht und sind daher optional.

## Setup
Um die nötigen R-Skripte herunterzuladen, kann das git-repository entweder komplett als *zip*-File heruntergeladen werden oder mit einem R-Projekt verknüpft werden. Dafür legt man
in der RStudio-Oberfläche ein neues R-Projekt an und wählt die Variante *Version Control* aus (https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN).

Um die erfolgreiche Installation von *mlflow* sicherzustellen, sollte der R-Befehl `mlflow::mlflow_ui()` ausgeführt werden. Dabei sollte sich ein Fenster öffnen (entweder
in*RStudio* oder im Browser), in dem die *mlflow* UI zu sehen ist. 
