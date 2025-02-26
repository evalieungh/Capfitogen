##############################################
#Scriopt de parametros Complementa 2021
##############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL_Complementa.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: esta tabla es de igual que estructura a otras tablas de pasaporte, solo que para que Complementa muestre su funcionalidad, en los campos GENUS, SPECIES y/o SUBTAXA debe haber diferentes y variados valores (nombres de generos y especies)
# Nota2: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"

geoqual<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: geoqual solo aplica si antes la tabla de pasaporte ha pasado exitosamente por la herramienta GEOQUAL y ya cuenta con la columna "TOTALQUAL100"

totalqual<-30 #solo aplica se GEOQUAL=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

gaptype<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: gaptype=TRUE exige que se haya ejecutado previamente la herramienta Representa, la cual genera en la tabla pasaporte resultado una nueva columna (GAPTYPE) que seria usada en Complementa para filtrar

gaptresh<-4 #Solo aplica si gaptype=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: gaptresh es un valor de referencia para filtrar registros de la tabla pasaporte y requiere que en tabla pasaporte haya un campo GAPTYPE generado por Representa. Se trata de un valor de 1 a 15, usualmente es un 3 o 4.

gapna<-"exclude" #Solo aplica si gaptype=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Esto solo indica a Complementa si valores de NA en la columna GAPTYPE seran tomados en cuenta o no.

duplicat<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: duplicat=TRUE indica que se eliminaran registros de la misma GENUS/SPECIES/SUBTAXA debido a que se encuentran cerca unos de otros

distdup<-1 #Solo aplica si duplicat=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
# Nota: distdup no puede ser menor de cero y tampoco puede ser un numero exageradamente alto pues haria que todos los puntos son en realidad duplicados y el analisis se haria para un solo punto.

celdas<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Si celdas=TRUE significa que se realizara un analisis de complementariedad por celdas (grid)

resol1<-"celdas 10x10 km aprox (5 arc-min)" #Solo aplica si celdas=TRUE
#resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### NOTA: resol1 significa la resolucion de las capas que se va ausar para crear los mapas de complementariedad. No tiene nada que ver con los archivos que puedan encontrarse en la carpeta rdatamaps o rdatamapsf

nceldas<-10 #Solo aplica si celdas=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: nceldas es el numero de celdas de un ranking (de mas a menos importantes en terminos de acumjulacion de riqueza de taxa) que seran analizadas en detalle. Puede generar un problema o error si nceldas es un numero muy grande y la tabla de pasaporte tiene pocos registros, o pocas diferentes especies, o estan espacialmente muy concentrados todos los puntos, o se usan celdas muy grandes. 

areas<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Si areas=TRUE significa que se realizara un analisis de complementariedad por areas protegidas (poligonos), que puedne venir de una base de datos mundial (WDPA) o de un shapefile que proporciona el usuario
##### Nota2: Si areas=TRUE, al menos una de las dos opciones siguientes (o las dos) WDPA o propio deben ser TRUE, de lo contrario puede originar errores.

WDPA<-TRUE #Solo aplica si areas=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Si WDPA=TRUE significa que se usara para el analisis de areas protegidas

pais<-"Ecuador" #solo aplica si WDPA=TRUE
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
#...... etc.
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: El nombre del pais que se defina aqui, debe corresponder al archivo .RData con las areas protegidas de ese pais o region, que se descarga desde: http://goo.gl/2SWnvg Dicho archivo, luego de descargado debe ser puesto en la ruta CAPFITOGEN3/WDPA pues alli lo buscara la herramienta
##### Nota2: La primera letra del nombre del pais va en mayuscula.

propio<-TRUE #Solo aplica si areas=TRUE y WDPA es FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Si propio=TRUE significa que se usara para el analisis de areas protegidas un shapefile que el usuario debe aportar, poniendolo en la carpeta CAPFITOGEN3/WDPA.

nombre<-"EcuadorAreasProt" #Solo aplica si propio=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: En nombre debe especificarse el nombre del archivo shapefile (extension .shp, aunque usualmente es un mapa que se compone de varios archivos y una tabla en formato .dbf), no hace falta poner la extension (no poner nombre.shp)

campo<-"objectid" #Solo aplica si propio=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: en campo debe especificarse la columna de la tabla del shapefile que contiene el codigo identificador (ID) de cada objeto (poligono) en el mapa de areas protegidas que aporta el usuario a traves del shapefile. El nombre de la columna debe ponerse literal como aparece en la tabla del shapefile, de lo contrario se generan errores

nareas<-5
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: nareas es el numero de areas protegidas donde caen los puntos provenientes de las coordenadas de la tabla pasaporte, areas organizadas en un ranking (de mas a menos importantes en terminos de acumulacion de riqueza de taxa) que seran analizadas en detalle. Puede generar un problema o error si nareas es un numero muy grande y la tabla de pasaporte tiene pocos registros, o pocas diferentes especies, o estan espacialmente muy concentrados todos los puntos.

coveran<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: si coveran=TRUE se generara un analisis de cobertura para la red de areas protegidas y en los resultados debera entonces dentro de la carpeta de resultados para areas, aparecer una carpeta llamada CoverageAnalysis

niveltax<-"subtaxa"
#niveltax<-"genus"
#niveltax<-"species"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Importante parametro donde se debe indicar a que nivel taxonomico se va a trabajar el analisis de complementariedad (3 opciones: "genus", "especies" o "subtaxa"). Tener en cuenta lo siguiente: Si se elige "genus", en la tabla pasaporte, en la columna GENUS debe haber al menos dos diferentes generos, o lo mismo para "species" (columna SPECIES) o "subtaxa" (columna SUBTAXA).... si solo hay valores NA o solo hay un valor en la columna objetivo, puede generar errores.

datanatax<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: datanax indica si los valores NA en genus, species o subtaxa van a ser tenidos en cuenta como un valor diferente. Usualmente cualquier opcion TRUE o FALSE no generan problemas o errores.

mapaelcf<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Se usara un mapa ELC proveniente de una ejecucion previa de la herramienta ELCmapas como factor adicional de clasificacion de los estados taxonomicos para el analisis de complementariedad?

mapaelc<-"mapa_elc_ecuador.grd" #Solo aplica si mapaelcf=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: mapaelc debe contener el nombre del mapa ELC obtenido por utilizar herramienta ELC mapas previamente (archivo .grd y .gri que deben estar siempre en la carpeta CAPFITOGEN3/ELCmapas)

datanaelc<-FALSE #Solo aplica si mapaelcf=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: datanaelc indica si (TRUE) los registros que caen en el mapa ELC en zonas NA van a ser tenidos en cuenta o no (FALSE)

data0elc<-FALSE #Solo aplica si mapaelcf=TRUE
#Parametro tipo TRUE o FALSE
##### Nota: data0aelc indica si (TRUE) los registros que caen en el mapa ELC en categoria 0 van a ser tenidos en cuenta o no (FALSE)

resultados<-"C:/CAPFITOGEN3/ResultadosComplementa"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Aqui se debe indicar la ruta que lleva a una carpeta (existente o ya creada) donde se guardaran los resultados del proceso