############################################
#Script de parametros FIGS_R 2021
############################################
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
#Mapa ELC
#############################################

controlelc<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Este parametro sirve para indicar a la herramienta FIGS_R si se usara un mapa ELC previamente obtenido de la herramienta ELCmapas y que serviria para distribuir en diferentes categorias ecogeograficas las accesiones que se incluiran en la subcoleccion FIGS
##### Nota2: Se requiere ubicar el mapa ELC y la tabla de estadisticas del mismo en la ruta X:/CAPFITOGEN3/ELCmapas (siendo X la letra del disco duro)

mapaelc<-"mapa_elc_ecuador.grd" #Solo aplica si controlelc es TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se indica como se llama mapa ELC (el que combina las categorias de los componentes bioclimatico, edafico y geofisico) producido como resultado herramienta ELC mapas (debe estar en la carpeta "CAPFITOGEN3/ELCmapas")
##### Nota2: Se requiere ubicar este archivo de mapa ELC en la ruta X:/CAPFITOGEN3/ELCmapas (siendo X la letra del disco duro) 

statelc<-"Estadist_ELC_ecuador.txt" #Solo aplica si controlelc es TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se indica como se llama la tabla de estadisricas que acompana el mapa ELC producido como resultado herramienta ELC mapas (debe estar en la carpeta "CAPFITOGEN3/ELCmapas")
##### Nota2: Se requiere ubicar este archivo de mapa ELC en la ruta X:/CAPFITOGEN3/ELCmapas (siendo X la letra del disco duro) 

#############################################
#Duplicidad
#############################################

distdup<-0
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico indica el umbral de distancia bajo el cual se considera que dos sitios de recoleccion realmente representan una misma poblacion (expresado en km)
##### Nota2: Un numero muy alto en distdup puede reducir notablemente la cantidad de accesiones en el analisis

#############################################
#Caracteristicas de la subcoleccion FIGS
#############################################

availab<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota1: Desea utilizar el campo AVAILAB (que significa disponibilidad de entrada) de la tabla de pasaporte, para priorizar la seleccion de entradas para la subcoleccion FIGS marcadas como disponibles?
##### Nota2: Para que pueda configurar el parametro availab=TRUE, se requiere que la tabla de pasaporte indicada en el parametro "pasaporte" contenga una columna denominada AVAILAB, de lo contrario producira un error

soloavailab<-TRUE #Solo aplica si availab=TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: Con este parametro se puede restringir absolutamente la seleccion a entradas disponibles (marcadas en la columna AVAILAB como 1).
##### Nota2: Restringir con este parametro el numero de accesiones, es muy util para que las accesiones de la subcoleccion FIGS esten realmente disponibles, pero por otra parte puede resultar dejando muy pocas accesiones para seleccionar dentro de ellas 

#############################################
#Ecogeografico
#############################################

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parametro indica la resolucion a la que se quiere extraer info ecogeografica
###### Nota2: resol1 significa la resolucion de las capas ecogeograficas que se van a usar para extraer informacion para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

buffy<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota1: Forma de extraccion, desea incluir celdas contiguas (zona buffer) para calcular el valor adjudicado a cada sitio de recoleccion?
##### Nota2: elegir buffy=TRUE puede ralentizar el proceso de extraccion, pues obliga a R a extraer valores para cada punto (que viene de las coordenadas de los registros en la tabla de pasaporte) no solo de la celda donde caen (extraccion simple, cuando buffy=FALSE) sino de las celdas adhyacentes, cuyos valores se promedian... eso hace mas lenta la operacion

tamp<-1000 #Solo aplica cuando buffy=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Radio de la zona buffer que desea aplicar para calcular el valor que se le asignara a cada sitio de recoleccion (en metros)
##### Nota2: un tamp muy grande (>10000) combinado con una resolucion (resol1) muy alta (1x1), generara procesos muy lentos de extraccion

#############################################
#Variables para seleccionar
#############################################

variab1v<-"Temp prom anual"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: Este parametro sirve para indicar la variable ecogeografica primaria por la cual se seleccionaran accesiones con destino a la coleccion FIGS
##### Nota2: Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx denominada VARDESCR. En este caso, cualquiera de las variables de esta columna es valida independientemente del componente (columna VARMODULO) 

variab1rang<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica primaria es estableciendo un rango de valores (con valor minimo y maximo)

variab1min<-0 #Solo aplica si variab1rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor minimo del rango de seleccion por la variable primaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab1max<-50 #Solo aplica si variab1rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor maximo del rango de seleccion por la variable primaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab1cola<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica primaria es a traves de la definicion de una cola en la distribucion de valores.

variab1vpor<-20 #Solo aplica si variab1cola=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro sirve para definir la intensidad de seleccion (% de la distribucion) que se aplicara sobre una de las dos colas de la distribucion de valores para la variable ecogeografica primaria
##### Nota2: Este valor no puede ser menor de 0 y mayor de 100.

variab1vhl<-"high" #Solo aplica si variab1cola=TRUE
#variab1vhl<-"low"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Mediante este parametro se determina si la intensidad indicada en variab1vpor se aplicara al extremo de la cola (distribucion de valores) alto (high) o bajo (low)

variab2<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: En este parametro se indica si se va a utilizar una variable ecogeografica secundaria para refinar la seleccion de accesiones que conformaran la subcoleccion FIGS

variab2v<-"Temp prom anual" #Solo aplica si variab2=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: Este parametro sirve para indicar la variable ecogeografica secundaria por la cual se seleccionaran accesiones con destino a la coleccion FIGS
##### Nota2: Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx denominada VARDESCR. En este caso, cualquiera de las variables de esta columna es valida independientemente del componente (columna VARMODULO) 

variab2rang<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota1: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica secundaria es estableciendo un rango de valores (con valor minimo y maximo)

variab2min<-0 #Solo aplica si variab2rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor minimo del rango de seleccion por la variable secundaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab2max<-50 #Solo aplica si variab2rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor maximo del rango de seleccion por la variable secundaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab2cola<-TRUE #solo aplica si variab2=TRUE y variab2rang=FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica secundaria es a traves de la definicion de una cola en la distribucion de valores.

variab2vpor<-50 #Solo aplica si variab1cola=TRUE y variab2rang=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro sirve para definir la intensidad de seleccion (% de la distribucion) que se aplicara sobre una de las dos colas de la distribucion de valores para la variable ecogeografica secundaria
##### Nota2: Este valor no puede ser menor de 0 y mayor de 100.

variab2vhl<-"high" #Solo aplica si variab2cola=TRUE
#variab2vhl<-"low"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Mediante este parametro se determina si la intensidad indicada en variab2vpor se aplicara al extremo de la cola (distribucion de valores) alto (high) o bajo (low)

variab3<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1: En este parametro se indica si se va a utilizar una variable ecogeografica terciaria para refinar la seleccion de accesiones que conformaran la subcoleccion FIGS

variab3v<-"Elevacion"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: Este parametro sirve para indicar la variable ecogeografica primaria por la cual se seleccionaran accesiones con destino a la coleccion FIGS
##### Nota2: Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx denominada VARDESCR. En este caso, cualquiera de las variables de esta columna es valida independientemente del componente (columna VARMODULO) 

variab3rang<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota1: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica terciaria es estableciendo un rango de valores (con valor minimo y maximo)

variab3min<-0 #Solo aplica si variab3rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor minimo del rango de seleccion por la variable terciaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab3max<-100 #Solo aplica si variab3rang=TRUE 
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: En este parametro se indica el valor maximo del rango de seleccion por la variable terciaria
##### Nota2: Se recomienda revisar los valores posibles de esta variable, pues seleccionar valores fuera del rango total para esta especie y variable, puede generar un error

variab3cola<-TRUE #solo aplica si variab3=TRUE y variab3rang=FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Este parametro sirve para indicar si la forma para seleccionar las accesiones por la variable ecogeografica terciaria es a traves de la definicion de una cola en la distribucion de valores.

variab3vpor<-50 #Solo aplica si variab3cola=TRUE y variab3rang=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro sirve para definir la intensidad de seleccion (% de la distribucion) que se aplicara sobre una de las dos colas de la distribucion de valores para la variable ecogeografica terciaria
##### Nota2: Este valor no puede ser menor de 0 y mayor de 100.

variab3vhl<-"high" #Solo aplica si variab3cola=TRUE
#variab3vhl<-"low"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: Mediante este parametro se determina si la intensidad indicada en variab3vpor se aplicara al extremo de la cola (distribucion de valores) alto (high) o bajo (low)

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosFIGS_R"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados