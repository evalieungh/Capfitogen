#############################################
#Script de parametros SelecVIF 2021
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

#La tabla Excel con el formato y parametros requeridos para esta herramienta se puede encontrar en la carpeta ModelOptions (CAPFITOGEN/ModelOptions)

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

#SelecVIF solo tiene dos parametros a completar en Rstudio. El restro de los parametros se rellenan en una tabla excel, que al estar lista se salva como un archivo de texto (txt) el cual se debe ubicar en la ruta X:/CAPFITOGEN/ModelOptions, cuyo nombre se debe definir en el parametro partablename
ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

partablename<-"TableParametersSelecVIF_Example.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: este nombre corresponde al nombre de la tabla (incluyendo la extension .txt) en formato de texto, que contiene todos los parametros que configuran la herramienta SelecVIF