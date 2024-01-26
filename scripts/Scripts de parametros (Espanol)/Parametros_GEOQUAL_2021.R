#############################################
#Script de parametros GEOQUAL 2021
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota2: esta tabla no debe haber pasado antes por la herramienta GEOQUAL y debe tener el numero y nombre de columnas indicada por el formato que se encuentra en la ruta "X:/CAPFITOGEN3/Formatos_Formats/Espanol/Formatos GEOQUAL" (siendo X la letra de la unidad de disco duro)  

precision<-"alta"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota1: En este parametro se define que calidad de mapas de costas se utilizaran para determinar si un punto (sitio de recoleccion) cae en el mar y si fuera asi, que tasn lejos de la costa.
# Nota2: Tener en cuenta en procesadores lentos o con poca capacidad y memoria, que la "precision<-"alta" significa un alto consumo de recursos y un proceso mas prolongado.

local<-TRUE
#Parametro tipo TRUE o FALSE
# Nota1: En este parametro se debe indicar si se va a solicitar a la herramienta la elaboracion del criterio LOCALQUAL para calcular el valor final de calidad (TOTALQUAL/TOTALQUAL100)
# Nota2: Recordar que bajo tres criterios se calcula TOTALQUAL o TOTALQUAL100, que son LOCALQUAL (donde se compara la descripcion de localidad que sale de las coordenadas con la que se aporta en los datos de pasaporte), SUITQUAL (que tan apropiado es el sitio para el crecimiento de una planta) y COORQUAL (calidad intrinseca de la georeferenciacion del sitio).


#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosGEOQUAL"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados





