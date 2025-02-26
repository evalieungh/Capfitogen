##############################################
#Script de parametros DIVmapas 2021
##############################################
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
#etc
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: El pais/region seleccionado (usualmente la primera letra en mayuscula como "Ecuador") debe contar con la correspondiente carpeta (con el nombre del pais pero ahi en minuscula "ecuador") en rdatamaps.
##### Nota2: el nombre del pais se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 
##### Nota3: Si antes ha usado la herramienta rLayer y genero un conjunto de capas cortadas de acuerdo a las necesidades individuales del usuario, con un nombre definido en el parametro "uname", puede introducir aqui ese nombre para usar ese conjunto de capas

#############################################
#Pasaporte y GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-TRUE
#Parametro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-60 #Solo aplica si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

#############################################
#Ecogeografico
#############################################

ecogeo<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Extraccion/analisis de la diversidad ecogeografica?
##### Nota: Este parametro =TRUE implica que se va a caracterizar ecogeograficamente, lo que generara una carpeta con los resultados particulares de dicha caracterizacion 

buffy<-FALSE #Solo aplica cuando ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Forma de extraccion, desea incluir celdas contiguas (zona buffer) para calcular el valor adjudicado a cada sitio de recoleccion?
##### Nota2: elegir buffy=TRUE puede ralentizar el proceso de extraccion, pues obliga a R a extraer valores para cada punto (que viene de las coordenadas de los registros en la tabla de pasaporte) no solo de la celda donde caen (extraccion simple, cuando buffy=FALSE) sino de las celdas adhyacentes, cuyos valores se promedian... eso hace mas lenta la operacion

tamp<-2000 #Solo aplica cuando buffy=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Radio de la zona buffer que desea aplicar para calcular el valor que se le asignara a cada sitio de recoleccion (en metros)
##### Nota2: un tamp muy grande (>10000) combinado con una resolucion (resol1) muy alta (1x1), generara procesos muy lentos de extraccion

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parametro indica la resolucion a la que se quiere extraer info ecogeografica
###### Nota2: resol1 significa la resolucion de las capas ecogeograficas que se van a usar para extraer informacion para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

bioclimsn<-TRUE #Solo aplica si ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: en este parametro se debe indicar... se desea extraer informacion de variables bioclimaticas?
##### Nota2: variables ecogeograficas (bioclimaticas) para las que se quiere extraer informacion para los puntos que vienen de la tabla pasaporte:

bioclimv<-c("Temp prom anual","Prec anual","Prec cuarto mas calido") #Solo aplica si bioclimsn=TRUE
##Lista completa de variables bioclimaticas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
##Lista de las 19 variables BIOCLIM:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
##Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Bioclimatica"

edaphsn<-TRUE #Solo aplica si ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: en este parametro se debe indicar... se desea extraer informacion de variables edaficas?
##### Nota2: variables ecogeograficas (edaficas) para las que se quiere extraer informacion para los puntos que vienen de la tabla pasaporte

edaphv<-c("Silt content top","Sand content top","Avail soil water cap top") #Solo aplica si bioclimsn=TRUE
#Lista completa de variables edaficas SOILGRIDS (mas modernas), para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
#Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Edafica"

geophyssn<-TRUE #Solo aplica si ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: en este parametro se debe indicar... se desea extraer informacion de variables geofisicas?
##### Nota2: variables ecogeograficas (geofisicas) para las que se quiere extraer informacion para los puntos que vienen de la tabla pasaporte

geophysv<-c("Elevacion","Pendiente grados")
#Lista completa de variables geofisicas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
#Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Geofisica"

latitud<-FALSE #Solo aplica si ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si la variable latitud (Y) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizara para hacer la caracterizacion ecogeogrpafica (como variable geofisica)
longitud<-TRUE #Solo aplica si ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1:Este parametro indica si la variable longitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizara para hacer la caracterizacion ecogeogrpafica (como variable geofisica)
##### Nota2:Para DIVmapas.latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de las coordenadas en la tabla de pasaporte. Sin embargo, en los analisis de DIVmapas tanto latitud como longitud entrarian como una variables geofisicas

#############################################
#Fenotipo
#############################################

phenotip<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Se generara un mapa/analisis fenotipico?
##### Nota2: Si phenotip=TRUE, el usuario debera aportar una tabla especifica con los datos de caracerizacion fenotipica. Esa tabla tiene una columna en comun con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas descriptores. Como hay descriptores (variables) de varios tipos y las funciones de R que hacen el analisis requieren reconocerlas, el usuario debe proveer otra tabla adicional que indica la naturaleza de cada variable.


phenot<-"Morfologia.txt" #Solo aplica si phenotip=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se debe indicar donde esta y como se llama datos fenotipicos? (text box)
##### Nota2: en phenot se debe indicar el nombre de la tabla de caracterizacion (columna ACCENUMB mas columnas para las demas variables), adicionando la extension (.txt). Esta tabla el usuario la debe localizar en la carpeta CAPFITOGEN3/Pasaporte. Si, como en este caso, la tabla esta dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN3/Pasaporte... en este caso Pasaporte/Morfologia.txt 


phenotv<-"TablaNaturalezaVariables.txt" #Solo aplica si phenotip=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se debe indicar donde esta la tabla de la naturaleza de cada variable de la tabla de datos fenotipicos
##### Nota2: phenotv es el nombre de la tabla donde se indica la naturaleza de cada variable usada en la caracterizacion fenotipica y que esta en la tabla phenot como una columnna

################################################
#Genotipo
################################################

genotip<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Se generara un mapa/analisis genotipico?
##### Nota2: si genotip=TRUE, el usuario debera aportar una tabla especifica con los datos de caracterizacion genotipica. Esa tabla tiene una columna en comun con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas marcadores. Dicha tabla, como en el caso de la tabla de caracterizacion fenotipica, debe estar en la ruta CAPFITOGEN3/Pasaporte

genot<-"AFLP.txt" #Solo aplica para genotip=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: donde esta y como se llama datos genotipicos? (text box)
##### Nota2: genot es el nombre de la tabla de datos genotipicos, que se debe encontrar en la ruta CAPFITOGEN3/Pasaporte. Si, como en este caso, la tabla esta dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN3/Pasaporte... en este caso Pasaporte/AFLP.txt  

neigd<-TRUE #Solo aplica para genotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Desea obtener el Nei's gene diversity
##### Nota2: Si neigd=TRUE produce un tipo de analisis opcional y se generaran ciertos productos dentro de la carpeta de resultados genotipicos

csimilar<-5 #Solo aplica para genotip=TRUE
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
##### Nota1: el analisis de diversidad genotipico requiere que se defina el algoritmo que se utilizara. Ese algoritmo se define con un numero (de 1 a 10) en el parametro csimilar, de acuerdo a las opciones siguientes:
##### Nota2: Distancia a partir de un coeficiente deseado(d=sqrt(1-s) siendo s el coeficiente de similaridad)

#############################################
#Malla: los siguientes dos parametros definen la estructura de los mapas de diversidad resultado de DIVmapas
#############################################

rgrid<-10
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: este parpametro corresponde al tamano de celdas de la malla/estructura en km
##### Nota2: rgrid es un numero y solo puede ser: 1,5,10,50,100. Otros numeros generaran errores.

buffer<-30
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1:Tamano del area de vecindad (buffer circular) en km
##### Nota2:buffer es un numero. Este numero no puede ser inferior a rgrid, como minimo sera rgrid x 1.5, como maximo podra ser hasta 10 veces el tamano de rgrid


#############################################
#Analisis multivariados clasicos: los parametros de esta seccion pueden generar analisis y resultados adicionales a los que generan ecogeo, phenotip y genotip
#############################################

ecogeoclus<-TRUE #Solo aplica para ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Desea un analisis de agrupamientos unico para todas las entradas por los datos de caracterizacion ecogeografica?


ecogeoclustype<-"average" #solo aplica si ecogeoclus=TRUE
#ecogeoclustype<-"single" #nearest neighbor
#ecogeoclustype<-"complete" #furthest neighbor or compact
#ecogeoclustype<-"ward" #Ward's minimum variance method
#ecogeoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#ecogeoclustype<-"average" #average similarity (UPGMA)
#ecogeoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#ecogeoclustype<-"centroid" #geometric centroid (UPGMC)
#ecogeoclustype<-"flexible" #flexible Beta
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: Ecogeoclustype define el algoritmo de agrupacion multivariado que se usara sobre los datos de caracterizacion ecogeografica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerarquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

ecogeopca<-TRUE #Solo aplica para ecogeo=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Desea un analisis de componentes principales para todas las entradas por los datos de caracterizacion ecogeografica?

ecogeopcaxe<-5 #Solo aplica para ecogeopca=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: ecogeopcaxe es un numero que define los componentes principales que seran analizados en detalle. Debe ser como maximo el numero de variables ecogeograficas utilizadas (bioclimv+edaphv+geophysv) -1. Por ejemplo si sumadas todas las variables de bioclimv+edaphv+geophysv= 20, ecogeopcaxe no puede ser mayor a 19. 

phenoclus<-TRUE #Solo aplica para phenotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Desea un analisis de agrupamientos unico para todas las entradas por los datos de caracterizacion fenotipica?

phenoclustype<-"average" #Solo aplica para phenoclus=TRUE
#phenoclustype<-"single" #nearest neighbor
#phenoclustype<-"complete" #furthest neighbor or compact
#phenoclustype<-"ward" #Ward's minimum variance method
#phenoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#phenoclustype<-"average" #average similarity (UPGMA)
#phenoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#phenoclustype<-"centroid" #geometric centroid (UPGMC)
#phenoclustype<-"flexible" #flexible Beta
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: phenoclustype define el algoritmo de agrupacion multivariado que se usara sobre los datos de caracterizacion fenotipica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerarquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

phenopca<-TRUE #Solo aplica para phenotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Desea un analisis de componentes/coordenadas principales para todas las entradas por los datos de caracterizacion ecogeografica?

phenopcaxe<-5 #Solo aplica para phenopca=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Numero de ejes a extraer (analisis fenotipico)
##### Nota2: phenopcaxe es un numero que define los componentes principales que seran analizados en detalle. Debe ser como maximo el numero de variables/descriptores que aparecen en la tabla de caracterizacion fenotipica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (variables/descriptores), entonces phenopcaxe no puede ser mayor que 14.

phenovarq<-FALSE #Solo aplica para phenotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Los datos de caracterizacion fenotipica contiene solo descriptores (variables) cuantitativos?
##### Nota2: esta es una pregunta necesaria para aplicar algunos metodos en el script. Para saber si todas las variables/descriptores fenotipicos son cuantitativos o no, se debe ver en la tabla de la naturaleza de las variables, si todas las variables alli listadas aparecen como cuantitativas (phenovarq=TRUE) o no todas son cuantitativas (phenovarq=FALSE) 

genoclus<-TRUE #Solo aplica para genotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Desea un analisis de agrupamientos unico para todas las entradas por los datos de caracterizacion molecular (datos 0/1)?

genoclustype<-"average" #Solo aplica si genoclus=TRUE
#genoclustype<-"single" #nearest neighbor
#genoclustype<-"complete" #furthest neighbor or compact
#genoclustype<-"ward" #Ward's minimum variance method
#genoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#genoclustype<-"average" #average similarity (UPGMA)
#genoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#genoclustype<-"centroid" #geometric centroid (UPGMC)
#genoclustype<-"flexible" #flexible Beta
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: genoclustype define el algoritmo de agrupacion multivariado que se usara sobre los datos de caracterizacion genotipica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jerarquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

genopco<-TRUE #Solo aplica para genotip=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Desea un analisis de coordenadas principales para todas las entradas por los datos de caracterizacion molecular (datos 0/1)?

genopcoaxe<-5 #Solo aplica para genopco=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Numero de ejes a extraer (analisis genotipico)
##### Nota2: genopcoaxe es un numero que define las coodernadas principales que seran analizadas en detalle. Debe ser como maximo el numero de marcadores que aparecen en la tabla de caracterizacion genotipica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (marcadores), entonces genopcoaxe no puede ser mayor que 14.

#############################################
#Comparaciones matriciales
#############################################

mantelt<-TRUE #Solo aplica si al menos dos de los siguientes parametros son = TRUE: ecogeo, phenotip, genotip
#Parametro tipo TRUE o FALSE
##### Nota1: Desea hacer comparaciones matriciales entre los diferentes componentes analizados?
##### Nota2: mantelt=TRUE produce una nueva carpeta con resultados de las correlaciones matriciales de Mantel en la ruta de resultados

mantelmeth<-"pearson" #Solo aplica si mantelt=TRUE
#mantelmeth<-"kendall"
#mantelmeth<-"sperman"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Tipo de correlacion a usar

mantelper<-999 #Solo aplica si mantelt=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### nota1: Numero de permutaciones a usar en las correlaciones matriciales (numeric box)
##### nota2: Suelen ser numeros entre 100 y 10000 o incluso mas. Sin embargo, un gran numero de permutaciones puede generar errores de memoria o tiempos de ejecucion demasiado extensos.

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosDIVmapas"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados