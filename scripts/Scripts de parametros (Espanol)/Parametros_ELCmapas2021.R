###############################################
#Script de parametros ELCmapas 2021
###############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

pais<-"Ecuador"
#pais<-"Colombia"
#pais<-"Spain"
#pais<-"United States"
#pais<-"Argentina"
#pais<-"Bolivia"
#pais<-"Brasil"
#pais<-"Chile"
#pais<-"Chile continental"
#pais<-"Canada"
#pais<-"Meso America"
#pais<-"Russia"
#pais<-"South America"
#pais<-"Costa Rica"
#pais<-"World"
#pais<-"user1"
#...... etc.
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: El pais/region seleccionado (usualmente la primera letra en mayuscula como "Ecuador") debe contar con la correspondiente carpeta (con el nombre del pais pero ahi en minuscula "ecuador") en rdatamaps.
##### Nota2: el nombre del pais se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 
##### Nota3: Si antes ha usado la herramienta rLayer y genero un conjunto de capas cortadas de acuerdo a las necesidades individuales del usuario, con un nombre definido en el parametro "uname", puede introducir aqui ese nombre para usar ese conjunto de capas

metodo<-"kmeansbic"
#metodo<-"medoides"
#metodo<-"elbow"
#metodo<-"calinski"
#metodo<-"ssi"
#metodo<-"bic"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Este parametro le indica a la herramienta el tipo de algoritmo que se utilizara para determinar el numero optimo de grupos por cada componente (bioclimatico, geofisico, edafico), lo cual repercute en el numero final de categorias dle mapa ELC.

iterat<-10 #Solo aplica si metodo="Calinski" o "ssi"
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: Este parametro es especifico para los algoritmos de determinacion de grupos (parametro metodo) ssi o calisnki e indica el numero de iteraciones que se usaran por estos metodos para calcular el numero optimo de grupos.

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parametro indica la resolucion que se usara para hacer el mapa ELC
###### Nota2: resol1 significa la resolucion de las capas ecogeograficas que se van a usar para extraer informacion para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

bioclimv<-c("Temp prom anual","Prec anual","Prec cuarto mas calido") #Solo aplica si bioclimsn=TRUE
###Lista completa de variables bioclimaticas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
###Lista de las 19 variables BIOCLIM:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Bioclimatica"

edaphv<-c("Silt content top","Sand content top","Avail soil water cap top") #Solo aplica si bioclimsn=TRUE
###Lista completa de variables edaficas SOILGRIDS (mas modernas), para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Edafica"

geophysv<-c("Elevacion","Pendiente grados")
###Lista completa de variables geofisicas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Geofisica"

latitud<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si la variable latitud (Y) se tendra en cuenta como variable en el componente geofisica para la creacion del mapa ELC. Tener en cuenta que usar los parametros latitud y longitud (TRUE) en la creacion de un mapa ELC, producira unidades ecogeograficas espacialmente mas agregadas (algo usualmente perseguido)

longitud<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si la variable longitud (X) se tendra en cuenta como variable en el componente geofisica para la creacion del mapa ELC. Tener en cuenta que usar los parametros latitud y longitud (TRUE) en la creacion de un mapa ELC, producira unidades ecogeograficas espacialmente mas agregadas (algo usualmente perseguido)
##### Nota2:latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de los centroides de las celdas que conforman el area de trabajo.

maxg<-8
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico le indica a la herramienta el numero maximo de grupos por componente que se permitiran. Por ello, este numero es un factor que el algoritmo elegido en el parametro metodo tendra en cuenta para limitar el numero optimo de grupos por componente.
##### Nota2: Numeros muy altos (mayores a 8) pueden llegar a permitir que algunos algoritmos determinen numeros altos de grupos optimos por componente, lo cual generara al final un mapa ELC con demasiadas categorias (>100). Demasiadas categorias en un mapa ELC puede ser algo indeseable (segun el caso).

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosELCmapas"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados