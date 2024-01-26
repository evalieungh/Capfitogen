###########################################
#Script de parametros Tzones 2021
###########################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

elcready<-FALSE 
#Parametro tipo TRUE o FALSE
#Nota 1: Marque esta opcion si ya se realizo un analisis previo de Tzones y quiere hacer otra proyeccion del mapa ELC a futuro pero con otro GCM, r.c.p y/o periodo de proyeccion. CUIDADO, si marca esta opcion, el parametro "resultados" debe ser la ruta identica utilizada en la ejecucion previa de Tzones, donde debe haber un archivo llamado "Producto.RData". Adicionalmente marcando esta opcion, solo requiere rellenar los parametros ruta, gcm, rcp, proy, iterarf, transfer, pasaporte, tecogaps, ttresh, resultados y resultados2.
#Nota2: Si este parametro es TRUE significa que antes ya se ha corrido la herramienta y que desde la carpeta de "resultados" se va a cargar un archivo llamado Productos.RData.
#Nota3: Simplemente sirve para cambiar algunos parametros de futuro pero sobre la base del mismo mapa ELC de presente
#Nota4: POR TANTO, LA PRIMERA VEZ QUE SE CORRE ESTA HERRAMIENTA CON UNA CONFIGURACIoN DE PARAMETROS NUEVA, elcready DEBE SER = FALSE

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

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este parametro indica la resolucion que se usara para hacer el mapa ELC, base de Tzones
###### Nota2: resol1 significa la resolucion de las capas ecogeograficas que se van a usar para extraer informacion para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais y de rdatamapsf/nombre_pais
###### Nota3: Por tanto, la resolucion aqui definida requiere que exista sets de variables ecogeograficas para el "pais" seleccionado en las carpetas rdatamaps y rdatamapsf. Si no tiene las capas de futuro en radatamapsf, las puede obtener usando la herramienta Bfuture
###### Nota4: Tener en cuenta que WorldClim 2.1 aun (enero 2022) no tiene capas de informacion de futuro en resolucion 30 arc-segundos (1x1 km).

###############################
#Variables ecogeograficas
###############################

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

latitud<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si la variable latitud (X) se tendra en cuenta como variable en el componente geofisica para la creacion del mapa ELC. Tener en cuenta que usar los parametros latitud y longitud (TRUE) en la creacion de un mapa ELC, producira unidades ecogeograficas espacialmente mas agregadas (algo usualmente perseguido)

longitud<-TRUE
#Parametro tipo TRUE o FALSE
##### Nota:Este parametro indica si la variable longitud (y) se tendra en cuenta como variable en el componente geofisica para la creacion del mapa ELC. Tener en cuenta que usar los parametros latitud y longitud (TRUE) en la creacion de un mapa ELC, producira unidades ecogeograficas espacialmente mas agregadas (algo usualmente perseguido)
##### Nota2:latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de los centroides de las celdas que conforman el area de trabajo.

###############################
#Condiciones de futuro (Para datos WorldClim 2.1)
###############################
ssp<-126
#ssp<-245
#ssp<-370
#ssp<-585
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: ssp significa shared socio-economic pathways, y las unicas opciones son 126, 245, 370 y 585

gcm<-"MRI-ESM2-0"
#gcm<-"BCC-CSM2-MR"
#gcm<-"CNRM-CM6-1"
#gcm<-"CNRM-ESM2-1"
#gcm<-"CanESM5"
#gcm<-"GFDL-ESM4"
#gcm<-"IPSL-CM6A-LR"
#gcm<-"MIROC-ES2L"
#gcm<-"MIROC6"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: gcm significa global circulate models, y las unicas opciones son las que estan arriba listados.

#proy<-2030
#proy<-2050
proy<-2070
#proy<-2090
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: proy indica los periodos de tiempo (futuro), y las unicas opciones son 2030, 2050, 2070 y 2090

###############################
#Configuracion del mapa ELC
###############################
maxg<-8 #aplica si elcready= FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico le indica a la herramienta el numero maximo de grupos por componente que se permitiran. Por ello, este numero es un factor que el algoritmo elegido en el parametro metodo tendra en cuenta para limitar el numero optimo de grupos por componente.
##### Nota2: Numeros muy altos (mayores a 8) pueden llegar a permitir que algunos algoritmos determinen numeros altos de grupos optimos por componente, lo cual generara al final un mapa ELC con demasiadas categorias (>100). Demasiadas categorias en un mapa ELC puede ser algo indeseable (segun el caso).

metodo<-"kmeansbic" #aplica si elcready= FALSE
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

###############################
#Configuracion de las zonas de transferencia
###############################
iterarf<-10
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: En este parametro se indica el numero de iteraciones o permutaciones a ser usado para el modelo Random Forest con el que se proyecta a condiciones bioclimaticas de futuro el mapa ELC de presente

transfer<-TRUE
#Parametro tipo TRUE o FALSE
#### Nota1: Marque esta opcion si desea realizar un analisis de zonas de transferencia de germoplasma. 
#### Nota2: Se requiere disponer de una tabla con datos de presencia (estara en el parametro pasaporte), que contiene poblaciones que podrian estar en riesgo de desaparecer por cambio climatico y poblaciones que podrian servir de fuente de germoplasma en el presente para evitar su desaparicion.

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt" #Solo aplica si transfer=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: en este caso el parametro pasaporte corresponde a una tabla de pasaporte, estar en la ruta X:/CAPFITOGEN/Pasaporte y puede haber pasado por GEOQUAL y/o tener columnas de disponibilidad
#### Nota2: Aqui se escribe el nombre del archivo que contiene la tabla de datos de presencia/ocurrencias (en formato pasaporte CAPFITOGEN para la herramienta Complementa, en formato texto delimitado por tabulaciones) sin olvidar incluir la extension (.txt). Por ejemplo, si el archivo se llama 'tabla' debe escribir: 'tabla.txt'. Recuerde que este archivo debe ser guardado previamente en la carpeta 'Pasaporte' que hace parte del conjunto de carpetas que componen el directorio CAPFITOGEN. En caso de que desee realizar un analisis FIGS, la tabla del parametro "pasaporte" corresponde a la tabla de accesiones evaluadas que poseen el rasgo de interes.

geoqual<-TRUE #Solo aplica si transfer=TRUE
#Parametro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-50 #Solo aplica si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.


tecogaps<-FALSE #Solo aplica si transfer=TRUE
#Parametro tipo TRUE o FALSE
#### Nota1: el parametro tecogaps puede ser TRUE si su tabla de pasaporte tiene la columna "GAPTYPE" y ella contiene valores validos  (ha pasado por la herramienta Representa) que sirvan para filtrar aquellas presencias correspondientes a faltantes ecogeograficos prioritarios.

ttresh<-4 #Solo aplica si transfer=TRUE y tecogaps=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: Mediante el parametro ttresh se establece el valor de umbral para GAPTYPE (en una escala de 1 a 15) para determinar cuales presencias se consideran faltantes ecogeograficos prioritarios. Este valor suele establecerse en 4 (ver manual de usuario de la herramienta Representa).


###############################
#Resultados NOTA: Note que debe estipular dos rutas diferentes para dos resultados
###############################
resultados<-"C:/CAPFITOGEN3/ResultadosTzones/present"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: Ruta de una carpeta (existente) donde se guardaran los resultados para PRESENTE (mapa ELC de presente)
#### Nota2: La carpeta de destino de resultados debe estar previamente creada.

resultados2<-"C:/CAPFITOGEN3/ResultadosTzones/future" #esta carpeta hay que crearla previamente
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: Ruta de una carpeta (existente) donde se guardaran los resultados para FUTURO, como mapas ELC de futuro, mapas de zonas de cambio y analisis de zona de transferencia.
#### Nota2: La carpeta de destino de resultados2 debe estar previamente creada.
