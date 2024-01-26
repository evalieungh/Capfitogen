###############################################
#Script de parametros Mcompare 2021
###############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

rutapresent<-"C:/CAPFITOGEN3/Modela/Results_Project_raw_Arachis"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra el mapa proveniente de la proyeccion del modelo con datos bioclimaticos de presente.
#### Nota: Usar slash (/) antes que backslash (\) para seprar cada parte de la ruta.

modelpresent<-"Arachis.hypogaea_PA2_RUN2_RF.tif"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es el nombre del mapa del modelo proyectado con datos bioclimaticos de presente.
#### Nota: Al nombre del archivo debe agregar la extension del mapa, puede ser un mapa .tif o .grd.

binarizedp<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: El mapa de proyeccion del modelo con datos bioclimaticos de presente esta binarizado?
##### Nota: Binarizado significa que los valores originales (raw) de proyeccion del modelo, que usualmente van de 0 a 1000, fueron binarizados mediante un umbral que sirve de punto de corte, por abajo de el el valor del mapa binarizado es cero, por encima es uno.
##### Nota: Mcompare tambien puede trabajar con mapas no binarizados.

binarthresp<-306 #Solo aplica si binarizedp=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: binarthresp debe ser un numero entre 1 y 999, Usualmente viene del valor cutoff de la tabla de evaluacion de los modelos por ROC, Kappa, TSS, etc.

rutaigual<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: En rutaigual se especifica si los mapas de proyeccion de los modelos con datos bioclimaticos de presente y futuro estan en la misma carpeta (en la misma ruta) o no. TRUE= ambos mapas estan en la misma carpeta.

rutafuture<-"C:/CAPFITOGEN3/Modela/Results_Project_raw_Arachis_Future" #Solo aplica si rutaigual=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra el mapa proveniente de la proyeccion del modelo con datos bioclimaticos de futuro.
#### Nota: Usar slash (/) antes que backslash (\) para seprar cada parte de la ruta.

modelfuture<-"Arachis.hypogaea_PA2_RUN2_RF_Fut.tif"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es el nombre del mapa del modelo proyectado con datos bioclimaticos de futuro.
#### Nota: Al nombre del archivo debe agregar la extension del mapa, puede ser un mapa .tif o .grd.

binarizedf<-FALSE
#Parametro tipo TRUE o FALSE
##### Nota: El mapa de proyeccion del modelo con datos bioclimaticos de futuro esta binarizado?
##### Nota: Binarizado significa que los valores originales (raw) de proyeccion del modelo, que usualmente van de 0 a 1000, fueron binarizados mediante un umbral que sirve de punto de corte, por abajo de el el valor del mapa binarizado es cero, por encima es uno.

binarthresf<-306 #Solo aplica si binarizedf=FALSE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota: binarthresf debe ser un numero entre 1 y 999, Usualmente viene del valor cutoff de la tabla de evaluacion de los modelos por ROC, Kappa, TSS, etc.

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-TRUE
#Parametro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-50 #Solo aplica si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

distdup<-1
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico indica el umbral de distancia bajo el cual se considera que dos sitios de recoleccion realmente representan una misma poblacion (expresado en km)
##### Nota2: Un numero muy alto en distdup puede reducir notablemente la cantidad de accesiones en el analisis

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosMcompare"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados