#############################################
#Script de parametros Bfuture 2021
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

#Nota, esta herramienta necesita que en la carpeta rdatamaps se haya guardado una carpeta "world" con todas sus resoluciones
#es decir 1x1, 5x5, 10x10 y 20x20 donde van sus respectivas capas de variables ambientales 1950-2000 (tiempo presente)
#Esta herramienta se conecta a un servidor de la U. de California para descargarse unos archivos .zip con capas globales
#esta descarga se hace necesaria en la version de instalacion local de CAPFITOGEN cuando el usuario no se ha descargado
#directamente esas capas desde worldclim.org y las ha guardado en la carpeta rdatamapsf

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente C:/)

local<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: Para local un valor de FALSE significa que la herramienta va a descargar desde worldclim.org las capas de futuro, entonces se debe contar con conexion a internet. Un valor FALSE aqui significa que se debe haber hecho una descarga previa desde Worldclim.org de la informacion y el archivo .zip debe ubicarse en CAPFITOGEN2/rdatamapsf
##### Nota2: Si local=TRUE los parametros siguientes como resol1, ssp, gcm y proy deben coincidir con el .zip que se descargo desde Worldclim.org y que esta en la carpeta rdatamapsf

resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#Parametro de tipo texto (un texto que va entre comillas "")
###### NOTA: resol1 significa la resolucion de las capas que se quieren descargar y/o adecuar. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

ssp<-126
#ssp<-245
#ssp<-370
#ssp<-585
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: ssp significa shared socio-economic pathways, y las unicas opciones son 126, 245, 370 y 585


#gcm<-"ACCESS-ESM1-5"
#gcm<-"BCC-CSM2-MR"
#gcm<-"CanESM5"
#gcm<-"CanESM5-CanOE"
#gcm<-"CMCC-ESM2"
#gcm<-"CNRM-CM6-1"
#gcm<-"CNRM-CM6-1-HR"
#gcm<-"CNRM-ESM2-1"
#gcm<-"EC-Earth3-Veg-LR"
#gcm<-"EC-Earth3-Veg"
#gcm<-"FIO-ESM-2-0"
#gcm<-"GFDL-ESM4"
#gcm<-"GISS-E2-1-G"
#gcm<-"GISS-E2-1-H"
#gcm<-"HadGEM3-GC31-LL"
#gcm<-"INM-CM4-8"
#gcm<-"INM-CM5-0"
#gcm<-"IPSL-CM6A-LR"
#gcm<-"MIROC-ES2L"
#gcm<-"MIROC6"
#gcm<-"MPI-ESM1-2-HR"
#gcm<-"MPI-ESM1-2-LR"
#gcm<-"MRI-ESM2-0"
gcm<-"UKESM1-0-LL"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: gcm significa global circulate models, y las unicas opciones son las que estan arriba listados.

#proy<-2030
#proy<-2050
proy<-2070
#proy<-2090
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: proy indica los periodos de tiempo (futuro), y las unicas opciones son 2030, 2050, 2070 y 2090

varset<-"bioclimatic_indices"
#varset<-c("monthly_min_temp","monthly_max_temp")
#varset<-"monthly_max_temp"
#varset<-"monthly_tot_prec"
#Parametro de tipo texto (un texto que va entre comillas "")
##### NOta: como puede verse, se puede hacer una descarga y/o adaptacion de capas de futuro de un solo set de datos (opciones:"bioclimatic_indices", "monthly_min_temp","monthly_max_temp" y "monthly_tot_prec") o de varios set a la vez (usando la funcion c())

croplayer<-TRUE
#Parametro tipo TRUE o FALSE
#####Nota: croplayer le indica a la herramienta si las capas descargadas van a ser cortadas por pais o por puntos(TRUE) o se van a dejar sin corte (FALSE) y entonces quedan igual a la cobertura "world"

paiscrop<-TRUE #solo importa si croplayer=TRUE. 
#Parametro tipo TRUE o FALSE
#####Nota: Se va a cortar con el contorno de un pais o region previamente guardado en rdatamaps.

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
#pais<-"Costa Rica"
#pais<-"nordic_countries"
#pais<-"subsaharan_countries"
#etc
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: El pais/region seleccionado (usualmente la primera letra en mayuscula como "Ecuador") debe contar con la correspondiente carpeta (con el nombre del pais pero ahi en minuscula "ecuador") en rdatamaps.
##### Nota2: el nombre del pais se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 
##### Nota3: Si antes ha usado la herramienta rLayer y genero un conjunto de capas cortadas de acuerdo a las necesidades individuales del usuario, con un nombre definido en el parametro "uname", puede introducir aqui ese nombre para usar ese conjunto de capas

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt" #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: la tabla que se referencia como "pasaporte" debe estar en la carpeta CAPFITOGEN3/Pasaporte

geoqual<-TRUE #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro tipo TRUE o FALSE
##### Nota: geoqual solo aplica si antes la tabla de pasaporte ha pasado exitosamente por la herramienta GEOQUAL y ya cuenta con la columna "TOTALQUAL100"

totalqual<-50 #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

#cropway<-"square" #solo importa si croplayer=TRUE y paiscrop=FALSE. 
cropway<-"buffer" #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota: usando esta opcion para cropway=square, el corte se efectuara usando los maximos y minimos latitud y longitud de la distribucion de puntos que salen de pasaporte.
##### Nota: usando esta opcion para cropway=buffer, el corte se efectuara usando la distribucion de puntos que salen de pasaporte desde la cual se delineara un area de infuencia circular con una distancia de radio igual al parametro "buffer".

buffer<-20 #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: el parametro buffer significa el radio en km, medido desde cada punto de distribucion (puntos que vienen de tabla pasaporte) el cual generara un circulo.
##### Nota:la fusion de dichos circulos generara un area que se usara para cortar las capas de futuro. Si la distancia indicada en buffer es muy grande (en miles) puede no estar haciendo un corte ajustado a una distribucion sino un corte de grandes extensiones de territorio.  

uname<-"user2" #solo importa si croplayer=TRUE y paiscrop=FALSE
#Parametro de tipo texto (un texto que va entre comillas "")
##### uname se usara para darle un nombre a la carpeta que se creara dentro de la carpeta rdatamaps y donde se guardaran las capas descargadas y cortadas. 
##### Nota: Para la version de CAPFITOGEN local, solo se ofrecen las opciones "user1", "user2" y "user3".