#############################################
#Script de parametros SelecVar 2021
#############################################
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
##### Nota2: El nombre del pais se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 
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
#Duplicidad
#############################################

distdup<-1
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico indica el umbral de distancia bajo el cual se considera que dos sitios de recoleccion realmente representan una misma poblacion (expresado en km)
##### Nota2: Un numero muy alto en distdup puede reducir notablemente la cantidad de accesiones en el analisis

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

bioclimv<-c("Temp prom anual","Prec anual","Prec cuarto mas calido")
###Lista completa de variables bioclimaticas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
###Lista de las 19 variables BIOCLIM:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Bioclimatica"

edaphv<-c("Silt content top","Sand content top","Avail soil water cap top") 
###Lista completa de variables edaficas SOILGRIDS (mas modernas), para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Edafica"

geophysv<-c("Elevacion","Pendiente grados")
###Lista completa de variables geofisicas, para mas informacion ver tabla de variables y sus correspondientes descripciones en ingles y espanol:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
###Parametro de tipo texto (un texto que va entre comillas ""), de tipo multiple (se puede elegir mas de una opcion, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de parentesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que estan indicadas en la columna VARMODULO como "Geofisica"

latitud<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si se la variable latitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizara para hacer la caracterizacion ecogeogrpafica (como variable geofisica)

longitud<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota1:Este parametro indica si se la variable longitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizara para hacer la caracterizacion ecogeogrpafica (como variable geofisica)
##### Nota2:Para DIVmapas latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de las coordenadas en la tabla de pasaporte. Sin embargo, en los analisis de DIVmapas tanto latitud como longitud entrarian como una variables geofisicas

#############################################
#Seleccion de variables
#############################################

percenRF<-0.66
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: percenRF es el porcentaje de variables que se seleccionaran por Random Forest (por ejemplo, si se quisiera seleccionar 2/3 partes del total de variables por Random Forest, percenRF seria 0.66). El parametro que calcula RF para definir importancia es mean decrease accuracy
#### Nota2: percenRF es un valor entre 0 y 1. El valor percenRF indica el porcentaje de variables que seguiran en el proceso de seleccion. 1-percenRF seran las variables descartadas por ser no importantes para Random Forest clasificacion.

percenCorr<-0.33
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: percenCorr es el porcentaje de variables que se seleccionaran por el analisis de Correlaciones bivariadas, el cual se ejecuta despues de la seleccion por Random Forest (por ejemplo, si se quisiera seleccionar 1/3 partes del total de variables por correlaciones bivariadas, percenRF seria 0.33)
#### Nota2: percenCorr es un valor entre 0 y 1. El valor percenCorr indica el porcentaje de variables que finalizaran siendo seleccionadas (identificadas como importantes), del grupo de variables seleccionadas por Random Forest clasificacion. 1-percenCorr seran las variables descartadas por ser redundantes de acuerdo a las correlaciones bivariadas.

CorrValue<-0.5
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: En CorrValue se define un valor umbral de correlacion, por encima (en su forma positiva) o por debajo (en su forma negativa) del cual se asume que hay correlacion entre dos variables. Este valor suele variar segun la mayor parte de estudios entre 0.5/-0.5 y 0.7/-0.7.
#### Nota2: Aunque aqui el usuario solo introduce el valor positivo para CorrValue, su uso sera tanto para su forma positiva como su forma negativa (CorrValue*-1)

pValue<-0.05
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1; pValue define el valor de umbral de significancia para las correlaciones bivariadas. Usualmente este valor fluctua entre 0.001 y 0.05.
#### Nota2: La correlacion se asumira como significante cuando el valor P sea menor que  pValue

nminvar<-3
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: nminvar indica a la herramienta SelecVar el numero minimo de variables a seleccionar por componente. Este numero hace que, aunque los procesos de seleccion de variables por RF y correlacion bivariada indiquen que se seleccionara, por ejemplo dos variables, si el numero nminvar fuera 3, el proceso de seleccion por correlaciones seleccionara las tres variables menos correlacionadas.
#### Nota2: Recordar que los procesos de seleccion de variavbles se realizan independientemente por componente. Por tanto, si el conjunto de variables geofisicas inicial total que estan siendo evaluadas fuera de 5 variables, y nminvar=6, se producira un error. numero 

ecogeopcaxe<-5
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1:ecogeopcaxe le indica a SelecVar el numero de ejes (componentes principales) que seran mostrados en las tablas de eigenvectors, eigenvalues y los score del PCA.
#### Nota2: ecogeopcaxe no puede ser mayor al numero menor de variables a ser evaluadas por componente, de lo contrario producira error. Por ejemplo, si el componente con menos variables a evaluar fuera el geofisico (geophysv) con solo tres variables, ecogeopcaxe no puede ser mayor que dos.

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosSelecVar"
#Parametro de tipo texto (un texto que va entre comillas "")
