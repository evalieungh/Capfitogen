#############################################
#Script de parámetros ECOGEO 2020
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M. (2020). CAPFITOGEN 3: Una caja de herramientas para la conservación y utilización de la biodiversidad agrícola. Bogotá, Colombia. URL http://www.capfitogen.net/es

####Cómo usar este script: Por favor configure cada parámetro, seleccione todas las líneas de este script y haga click en el botón "Run". Luego, abra por favor el script de herramienta correspondiente y ejecútelo.

#### para cada parámetro (palabra en color negro) por favor asigne un valor o seleccione una opción

ruta<-"C:/CAPFITOGEN3"
#Parámetro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN2 o CAPFITOGEN3 que esta localizada en la raíz del disco duro principal (usualmente c:/)

pais<-"Mexico"
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
#etc
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota: El país/región seleccionado (usualmente la primera letra en mayúscula como "Ecuador") debe contar con la correspondiente carpeta (con el nombre del país pero ahí en minúscula "ecuador") en rdatamaps.
##### Nota2: el nombre del país se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 

#############################################
#Pasaporte y GEOQUAL
#############################################

pasaporte<-"Mex/sindecigeo60tx_GEOQUAL.txt"
#Parámetro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que está dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-TRUE
#Parámetro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluación GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-60 #Solo aplica si geoqual=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parámetro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningún registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generará un error.

#############################################
#Ecogeográfico
#############################################
 
ecogeo<-TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Extracción/análisis de la diversidad ecogeográfica?
##### Nota: Este parámetro =TRUE implica que se va a caracterizar ecogeográficamente, lo que generará una carpeta con los resultados particulares de dicha caracterización 

buffy<-FALSE #Sólo aplica cuando ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: Forma de extracción, desea incluir celdas contiguas (zona buffer) para calcular el valor adjudicado a cada sitio de recolección?
##### Nota2: elegir buffy=TRUE puede ralentizar el proceso de extracción, pues obliga a R a extraer valores para cada punto (que viene de las coordenadas de los registros en la tabla de pasaporte) no sólo de la celda donde caen (extracción simple, cuando buffy=FALSE) sino de las celdas adhyacentes, cuyos valores se promedian... eso hace más lenta la operación

tamp<-2000 #Sólo aplica cuando buffy=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### Nota1: Radio de la zona buffer que desea aplicar para calcular el valor que se le asignará a cada sitio de recolección (en metros)
##### Nota2: un tamp muy grande (>10000) combinado con una resolución (resol1) muy alta (1x1), generará procesos muy lentos de extracción

#resol1<-"Celdas 1x1 km aprox (30 arc-seg)" #Sólo aplica cuando ecogeo=TRUE
resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parámetro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parámetro indica la resolución a la que se quiere extraer info ecogeográfica
###### Nota2: resol1 significa la resolución de las capas ecogeográficas que se van a usar para extraer información para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

bioclimsn<-TRUE #Sólo aplica si ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: en este parámetro se debe indicar... se desea extraer información de variables bioclimáticas?
##### Nota2: variables ecogeográficas (bioclimáticas) para las que se quiere extraer información para los puntos que vienen de la tabla pasaporte:

bioclimv<-c("Prec cuarto mas seco","Min temp mes mas frio","Prec cuarto mas calido","Temp min 1","Temp min 2","Temp min 3","Temp min 11","Temp min 12") #Sólo aplica si bioclimsn=TRUE
#Lista completa de variables bioclimáticas, para más información ver tabla de variables y sus correspondientes descripciones en inglés y español:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
#Lista de las 19 variables BIOCLIM:
#bioclimv<-("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
#Parámetro de tipo texto (un texto que va entre comillas ""), de tipo múltiple (se puede elegir más de una opción, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de paréntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que están indicadas en la columna VARMODULO como "Bioclimatica"

edaphsn<-TRUE #Sólo aplica si ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: en este parámetro se debe indicar... se desea extraer información de variables edáficas?
##### Nota2: variables ecogeográficas (edáficas) para las que se quiere extraer información para los puntos que vienen de la tabla pasaporte

edaphv<-c("Clay content top","Soil pH H2O top","Silt content top") #Sólo aplica si bioclimsn=TRUE
#Lista completa de variables edáficas SOILGRIDS (más modernas), para más información ver tabla de variables y sus correspondientes descripciones en inglés y español:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
#Parámetro de tipo texto (un texto que va entre comillas ""), de tipo múltiple (se puede elegir más de una opción, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de paréntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que están indicadas en la columna VARMODULO como "Edafica"

geophyssn<-TRUE #Sólo aplica si ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: en este parámetro se debe indicar... se desea extraer información de variables geofísicas?
##### Nota2: variables ecogeográficas (geofísicas) para las que se quiere extraer información para los puntos que vienen de la tabla pasaporte

geophysv<-c("Elevacion","Pendiente grados","Velocidad viento anual","Radiacion solar anual")
#Lista completa de variables geofísicas, para más información ver tabla de variables y sus correspondientes descripciones en inglés y español:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
#Parámetro de tipo texto (un texto que va entre comillas ""), de tipo múltiple (se puede elegir más de una opción, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de paréntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que están indicadas en la columna VARMODULO como "Geofisica"

latitud<-FALSE #Sólo aplica si ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota:Este parámetro indica si se la variable latitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizará para hacer la caracterización ecogeogrpafica (como variable geofísica)
longitud<-FALSE #Sólo aplica si ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1:Este parámetro indica si se la variable longitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizará para hacer la caracterización ecogeogrpafica (como variable geofísica)
##### Nota2:Para DIVmapas latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de las coordenadas en la tabla de pasaporte. Sin embargo, en los análisis de DIVmapas tanto latitud como longitud entrarían como una variables geofísicas

#############################################
#Fenotipo
#############################################

phenotip<-FALSE
#Parámetro tipo TRUE o FALSE
##### Nota1: Se generará un mapa/análisis fenotípico?
##### Nota2: Si phenotip=TRUE, el usuario deberá aportar una tabla específica con los datos de caracerización fenotípica. Esa tabla tiene una columna en común con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas descriptores. Como hay descriptores (variables) de varios tipos y las funciones de R que hacen el análisis requieren reconocerlas, el usuario debe proveer otra tabla adicional que indica la naturaleza de cada variable.


phenot<-"Morfologia.txt" #Sólo aplica si phenotip=TRUE
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parámetro se debe indicar donde está y cómo se llama datos fenotípicos? (text box)
##### Nota2: en phenot se debe indicar el nombre de la tabla de caracterización (columna ACCENUMB más columnas para las demás variables), adicionando la extensión (.txt). Esta tabla el usuario la debe localizar en la carpeta CAPFITOGEN2/Pasaporte. Si, como en este caso, la tabla está dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN2/Pasaporte... en este caso Pasaporte/Morfología.txt 


phenotv<-"TablaNaturalezaVariables.txt" #Sólo aplica si phenotip=TRUE
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parámetro se debe indicar donde esta la tabla de la naturaleza de cada variable de la tabla de datos fenotípicos
##### Nota2: phenotv es el nombre de la tabla donde se indica la naturaleza de cada variable usada en la caracterización fenotípica y que está en la tabla phenot como una columnna

################################################
#Genotipo
################################################

genotip<-FALSE
#Parámetro tipo TRUE o FALSE
##### Nota1: Se generará un mapa/análisis genotípico?
##### Nota2: si genotip=TRUE, el usuario deberá aportar una tabla específica con los datos de caracterización genotípica. Esa tabla tiene una columna en común con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas marcadores. Dicha tabla, como en el caso de la tabla de caracterización fenotípica, debe estar en la ruta CAPFITOGEN2/Pasaporte

genot<-"AFLP.txt" #Sólo aplica para genotip=TRUE
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: donde está y cómo se llama datos genotípicos? (text box)
##### Nota2: genot es el nombre de la tabla de datos genotípicos, que se debe encontrar en la ruta CAPFITOGEN2/Pasaporte. Si, como en este caso, la tabla está dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN2/Pasaporte... en este caso Pasaporte/AFLP.txt  


neigd<-TRUE #Sólo aplica para genotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: Desea obtener el Nei's gene diversity
##### Nota2: Si neigd=TRUE produce un tipo de análisis opcional y se generarán ciertos productos dentro de la carpeta de resultados genotípicos

csimilar<-5 #Sólo aplica para genotip=TRUE
#csimilar<-1 #1=Jaccard 1901
#csimilar<-2 #2=SMC de Sokal&Michaner 1958
#csimilar<-3 #3=Sokal y Sneath
#csimilar<-4 #4=Rogers&Tanimoto 1960
#csimilar<-5 #5=Dice 1945
#csimilar<-6 #6=Hamman S9 de Gower y Legendre 1986
#csimilar<-7 #7=Ochiai 1957
#csimilar<-8 #8=Sokal y Sneath 1963
#csimilar<-9 #9=Phi de Pearson
#csimilar<-10 #10=S2 de Gower y Legendre
##### Nota1: el análisis de diversidad genotípico requiere que se defina el algoritmo que se utilizará. Ese algoritmo se define con un número (de 1 a 10) en el parametro csimilar, de acuerdo a las opciones siguientes:
##### Nota2: Distancia a partir de un coeficiente deseado(d=sqrt(1-s) siendo s el coeficiente de similaridad)

#############################################
#Analisis multivariados clásicos: los parámetros de esta sección pueden generar análisis y resultados adicionales a los que generan ecogeo, phenotip y genotip
#############################################

ecogeoclus<-TRUE #Sólo aplica para ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Desea un análisis de agrupamientos único para todas las entradas por los datos de caracterización ecogeográfica?


#ecogeoclustype<-"average" #sólo aplica si ecogeoclus=TRUE 
#ecogeoclustype<-"single" #nearest neighbor
#ecogeoclustype<-"complete" #furthest neighbor or compact
ecogeoclustype<-"ward" #Ward's minimum variance method
#ecogeoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#ecogeoclustype<-"average" #average similarity (UPGMA)
#ecogeoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#ecogeoclustype<-"centroid" #geometric centroid (UPGMC)
#ecogeoclustype<-"flexible" #flexible Beta
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: Ecogeoclustype define el algoritmo de agrupación multivariado que se usará sobre los datos de caracterización ecogeográfica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerárquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

ecogeopca<-TRUE #Sólo aplica para ecogeo=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Desea un análisis de componentes principales para todas las entradas por los datos de caracterización ecogeográfica?

ecogeopcaxe<-5 #Sólo aplica para ecogeopca=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### Nota: ecogeopcaxe es un número que define los componentes principales que serán analizados en detalle. Debe ser como máximo el número de variables ecogeográficas utilizadas (bioclimv+edaphv+geophysv) -1. Por ejemplo si sumadas todas las variables de bioclimv+edaphv+geophysv= 20, ecogeopcaxe no puede ser mayor a 19. 

phenoclus<-FALSE #Sólo aplica para phenotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Desea un análisis de agrupamientos único para todas las entradas por los datos de caracterización fenotípica?

phenoclustype<-"average" #Sólo aplica para phenoclus=TRUE
#phenoclustype<-"single" #nearest neighbor
#phenoclustype<-"complete" #furthest neighbor or compact
#phenoclustype<-"ward" #Ward's minimum variance method
#phenoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#phenoclustype<-"average" #average similarity (UPGMA)
#phenoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#phenoclustype<-"centroid" #geometric centroid (UPGMC)
#phenoclustype<-"flexible" #flexible Beta
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: phenoclustype define el algoritmo de agrupación multivariado que se usará sobre los datos de caracterización fenotípica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerárquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

phenopca<-FALSE #Sólo aplica para phenotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: Desea un análisis de componentes/coordenadas principales para todas las entradas por los datos de caracterización ecogeográfica?

phenopcaxe<-5 #Sólo aplica para phenopca=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### Nota1: Número de ejes a extraer (análisis fenotípico)
##### Nota2: phenopcaxe es un número que define los componentes principales que serán analizados en detalle. Debe ser como máximo el número de variables/descriptores que aparecen en la tabla de caracterización fenotípica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (variables/descriptores), entonces phenopcaxe no puede ser mayor que 14.

phenovarq<-FALSE #Sólo aplica para phenotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota1: Los datos de caracterización fenotípica contiene sólo descriptores (variables) cuantitativos?
##### Nota2: esta es una pregunta necesaria para aplicar algunos métodos en el script. Para saber si todas las variables/descriptores fenotípicos son cuantitativos o no, se debe ver en la tabla de la naturaleza de las variables, si todas las variables allí listadas aparecen como cuantitativas (phenovarq=TRUE) o no todas son cuantitativas (phenovarq=FALSE) 

genoclus<-FALSE #Sólo aplica para genotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Desea un análisis de agrupamientos único para todas las entradas por los datos de caracterización molecular (datos 0/1)?

genoclustype<-"average" #Sólo aplica si genoclus=TRUE
#genoclustype<-"single" #nearest neighbor
#genoclustype<-"complete" #furthest neighbor or compact
#genoclustype<-"ward" #Ward's minimum variance method
#genoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#genoclustype<-"average" #average similarity (UPGMA)
#genoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#genoclustype<-"centroid" #geometric centroid (UPGMC)
#genoclustype<-"flexible" #flexible Beta
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota1: genoclustype define el algoritmo de agrupación multivariado que se usará sobre los datos de caracterización genotípica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerárquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

genopco<-FALSE #Sólo aplica para genotip=TRUE
#Parámetro tipo TRUE o FALSE
##### Nota: Desea un análisis de coordenadas principales para todas las entradas por los datos de caracterización molecular (datos 0/1)?

genopcoaxe<-5 #Sólo aplica para genopco=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### Nota1: Número de ejes a extraer (análisis genotípico)
##### Nota2: genopcoaxe es un número que define las coodernadas principales que serán analizadas en detalle. Debe ser como máximo el número de marcadores que aparecen en la tabla de caracterización genotípica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (marcadores), entonces genopcoaxe no puede ser mayor que 14.

#############################################
#Comparaciones matriciales
#############################################

mantelt<-FALSE #Sólo aplica si al menos dos de los siguientes parámetros son = TRUE: ecogeo, phenotip, genotip
#Parámetro tipo TRUE o FALSE
##### Nota1: Desea hacer comparaciones matriciales entre los diferentes componentes analizados?
##### Nota2: mantelt=TRUE produce una nueva carpeta con resultados de las correlaciones matriciales de Mantel en la ruta de resultados

mantelmeth<-"pearson" #Sólo aplica si mantelt=TRUE
#mantelmeth<-"kendall"
#mantelmeth<-"sperman"
#Parámetro de tipo texto (un texto que va entre comillas "")
##### Nota: Tipo de correlación a usar

mantelper<-999 #Sólo aplica si mantelt=TRUE
#Parámetro tipo número (el cual en Rstudio aparecerá con color azul)
##### nota1: Número de permutaciones a usar en las correlaciones matriciales (numeric box)
##### nota2: Suelen ser números entre 100 y 10000 o incluso más. Sin embargo, un gran número de permutaciones puede generar errores de memoria o tiempos de ejecución demasiado extensos.

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosMex/ECOGEO"
#Parámetro de tipo texto (un texto que va entre comillas "")
