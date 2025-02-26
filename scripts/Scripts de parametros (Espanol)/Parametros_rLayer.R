#############################################
#Script de parametros rLayer 2021
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

#############################################
#Tipo de corte de capas
#############################################

cropway<-"polygon"
#cropway<-"square"
#cropway<-"buffer"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: Este parametro le indica a rLayer como se va a proceder a cortar las capas mundiales (world) para adecuarlas a determinados limites.
#### Nota2: Si cropway="polygon", se utilizara un archivo vectorial tipo shapefile que proporcionara el usuario que servira como contorno para realizar el corte de capas.
#### Nota3: Si cropway="square", se utilizaran los sitios de recoleccion (coordenadas) incluidos en la tabla de pasaporte, para realizar el corte de las capas, usando la maxima extension de la distribucion de dichos puntos para realizar un corte tipo cuadrado o rectangulo
#### Nota4: Si cropway="buffer", se utilizaran los sitios de recoleccion (coordenadas) incluidos en la tabla de pasaporte, para crear un area circular alrededor de cada sitio con un radio especificado en el parametro buffer

buffer<-30 #Solo aplica si cropway="buffer"
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota: Parametro numerico que expresa kilometros (km) y con el que se indica el radio que se usara para generar las areas circualres alrededor de cada coordenada/sitio. Las areas circulares se fusionaran para delinear el area comnpleta con la que se realizara el corte de las capas mundiales

shapefile<-"albania" #Solo aplica si cropway="polygon"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: En este parametro se debe indicar el nombre del shapefile, que debe estar en sistema de coord lat-long WGS84 y contener un solo poligono por el cual se quiere cortar
#### Nota2: El shapefile (los 4-7 archivos que lo componen, entre los que debe estar los imprescindibles .shp, .dbf y .shx) se deben encontrar en la carpeta Pasaporte (ruta X:/CAPFITOGEN/Pasaporte)

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt" #Solo aplica si cropway="square" o cropway="buffer"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-TRUE #Solo aplica si cropway="square" o cropway="buffer"
#Parametro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-60 #Solo aplica si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parametro indica la resolucion de las capas ecogeograficas mundiales de las que se va a obtener las capas recortadas
###### Nota2: Para escoger una opcion de resol, se debe comprobar previamewnte que la resolucion de las capas mundiales ya se encuentran disponibles en la ruta x:/CAPFITOGEN/rdatamaps/world/ ydentro de esta ruta las carpetas: "1x1", "5x5", "10x10" o "20x20"

uname<-"user1"
#uname<-"user2"
#uname<-"user3"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: el parametro uname es en el que se define el nombre de la carpeta que se va a generar dentro de X:/CAPFITOGEN/rdatamaps y que contendra las capas recortadas
##### Nota2: El nombre que se determine en el parametro uname podra luego ser usado en las diferentes herramientas CAPFITOGEN en el parametro "pais"
##### Nota: Para la version de CAPFITOGEN local, solo se ofrecen las opciones "user1", "user2" y "user3".