###############################################
#Script de parametros Representa 2021
###############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

internet<-FALSE
#Parametro tipo TRUE o FALSE
#### Nota1: Mediante este parametro se le indica a la herramienta si el usuario cuenta con conexion a internet en el momento de ejecutar la herramienta Representa.
#### nota2: Contar con internet solo es necesario para importar datos de presencia de fuentes externas desde GBIF (parametro gbifFE)

#############################################
#Pasaporte y GEOQUAL
#############################################

pasaporte<-"Pasaporte_GEOQUAL.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-TRUE
#Parametro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-40 #Solo aplica si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

#############################################
#Datos externos y GEOQUAL
#############################################

fext<-TRUE
#Parametro tipo TRUE o FALSE
#### Nota: En este parametro el usuario indica que aportara una serie de registros o datos de presencia con fuentes externas.

fuentex<-"FuentesExternasECU.txt" #Solo aplica si fext=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: En este parametro se indica como se llama la tabla de fuentes externas, la cual debe estar en la carpeta "Pasaporte" o ruta X:/CAPFITOGEN/Pasaporte. El formato de esta tabla se puede encontrar en la carpeta con formatos excel.
#### Nota2: Esta tabla debe estar en formato de texto (.txt) y la extension se debe incluir en el nombre del archivo.

geoqualfe<-FALSE #Solo aplica si fext=TRUE
#Parametro tipo TRUE o FALSE
#### Nota: Indicar aqui si la tabla de fuentes externas Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)
#### Nota2: Para tener valores TOTALQUAL100, se requiere que la informacion en la tabla geoqualfe haya pasado por la herramienta GEOQUAL, pero GEOQUAL solo admite esa infiormacion en formato de tabla pasaporte, no fuentes externas. Esto exige poner primero la informacion de fuentes externas en formato tabla pasaporte, evaluarla con GEOQUAL y luego llevarla al formato de fuentes externas, incluyendo la columna TOTALQUAL100

totalqualfe<-70 #Solo aplica si geoqualfe=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla de fuentes externas tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

duplibg<-TRUE #Solo aplica si fext=TRUE
#Parametro tipo TRUE o FALSE
#### Nota1: En este parametro se indica si se consideraran (TRUE) o no (FALSE) registros de la tabla de fuentes externas que vienen de bancos de germoplasma como potenciales duplicados interbanco
#### Nota2: configurar duplibg=TRUE cuando todos los registros de la tabla de fuentes externas vienen de bancos de pasaporte (TYPESOURCE=40) generara un error, pues todos los registros de la tabla de fuentes externas seran descartados en el analisis de representatividad

gbifFE<-FALSE #Solo aplica si fext=TRUE y internet=TRUE
#Parametro tipo TRUE o FALSE
#### Nota: Este parametro le indica a la herramienta que el usuario desea descargar los datos de presencias como fuentes externas desde GBIF (global Biodiversity Information Facility, http://www.gbif.org)
#### Nota2: Para que gbifFe=TRUE, se debe contar con conexion a internet

genero<-"Arachis" #Solo aplica si fext=TRUE y gbifFE=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: En este parametro se indica para que genero desea descargar informacion de observaciones desde GBIF


especie<-"hypogaea" #Solo aplica si fext=TRUE y gbifFE=TRUE
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: En este parametro se indica para que especie (solo el epiteto) desea descargar informacion de observaciones desde GBIF
#### Nota2: En conjunto los parametros genero y especie configuran el taxon para el cual se quiere descargar informacion desde GBIF. 

#############################################
#Mapa ELC
#############################################

mapaelc<-"mapa_elc_ecuador.grd"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se indica como se llama mapa ELC (el que combina las categorias de los componentes bioclimatico, edafico y geofisico) producido como resultado herramienta ELC mapas (debe estar en la carpeta "CAPFITOGEN3/ELCmapas")
##### Nota2: Se requiere ubicar este archivo de mapa ELC en la ruta X:/CAPFITOGEN3/ELCmapas (siendo X la letra de la unidad de disco duro)

statelc<-"Estadist_ELC_ecuador.xls"
#Parametro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este parametro se indica como se llama la tabla de estadisricas que acompana el mapa ELC producido como resultado herramienta ELC mapas (debe estar en la carpeta "CAPFITOGEN3/ELCmapas")
##### Nota2: A partir de CAPFITOGEN3, utilice la tabla de estadisticas del mapa ELC cuyo archivo terimna en .xls y no el que termina en .txt
##### Nota3: Se requiere ubicar este archivo de mapa ELC en la ruta X:/CAPFITOGEN3/ELCmapas (siendo X la letra de la unidad de disco duro)

#############################################
#Duplicidad
#############################################

distdup<-0
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
##### Nota1: Este parametro numerico indoica el umbral de distancia bajo el cual se considera que dos sitios de recoleccion realmente representan una misma poblacion (expresado en km)
##### Nota2: Un numero muy alto en distdup puede reducir notablemente la cantidad de accesiones en el analisis

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/Representa"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados