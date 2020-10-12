# mlflow_workshop

## technische Voraussetzungen

### Betriebssystem
Grundsätzlich sollten R und mlflow unter jedem Betriebssystem funktionieren. Allerdings gibt es in der aktuellen Version einen Fehler bei der Nutzung von mlflow in der Kombination mit R auf Windows (der Grund dafür ist noch nicht geklärt). Vorzugsweise sind also macOS oder Linux zu benutzen. Ggf. funktioniert es aber auch unter Windows.

### Software
* Anaconda3: https://docs.anaconda.com/anaconda/install/
* R: https://cran.r-project.org/bin/windows/base/
* RStudio: https://rstudio.com/products/rstudio/download/
* ggf. git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* mlflow: Kann mit dem R-Befehl `mlflow::install_mlflow()` installiert werden - https://www.mlflow.org/docs/latest/R-api.html#install-mlflow
* keras: Kann mit dem R-Befehl `mlflow::install_keras()` installiert werden - https://keras.rstudio.com/reference/install_keras.html

### R-Pakete
Folgende Pakete können mit dem R-Befehl `install.packages(NAME_DES_PAKETS)` installiert werden, also bspw.: `install.packages("tidyverse")`:

* tidyverse
* tidymodels
* mlflow
* ranger
* keras
* tensorflow
