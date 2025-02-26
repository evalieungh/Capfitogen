##############################################
#Script de parametros TesTable 2021
##############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

#### NOTA: Recuerde que el analisis de las tablas de ingreso de informacion que hace esta herramienta se guarda automaticamente en la carpeta "Pasaporte", donde se encuentra la tabla del parametro "pasaporte"

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)

tiptable<-"Pasaporte"
#tiptable<-"FuentesExternas"
#tiptable<-"Fenotipo"
#tiptable<-"Genotipo"
#tiptable<-"NaturalezaVariables"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: El parametro tiptable le indica a la herramienta TesTable el tipo de tabla que se va a revisar en busca de errores o faltas al formato requerido.
#### Nota2: Es muy recomendable que el usuario cree sus tablas a partir de las tablas modelo que se ofrecen en la ruta X:/CAPFITOGEN/Formatos_Formats Englis/Espanol

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta" (usualmente X:/CAPFITOGEN/)
#### Nota2: esta es la tabla que TesTable revisara

access<-198
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: mediante el parametro "access", se le indica a la herramienta TesTable, el numero de registros (filas) que tiene la tabla definida en "pasaporte", sin incluir el encabezado de la tabla.  
#### Nota2: el numero de registros/filas/accesiones puede ser para una tabla tipo pasaporte, fuentes externas, fenotipo o genotipo. Si se trata de una tabla de naturaleza de variables, corresponde al numero de variables que contiene esa tabla.

geoqual<-FALSE #Solo aplica si tiptable="Pasaporte" o tiptable="FuentesExternas"
#Parametro tipo TRUE o FALSE
#### Nota1: Mediante este parametro se le indica a la herramienta si la tabla de pasaporte o la tabla de fuentes externas tienen informacion sobre la calidad de la georreferenciacion de los sitios de recoleccion/observacion (se obtuvo columnas SUITQUAL, COORQUAL, LOCALQUAL,TOTALQUAL y TOTALQUAL100 para tablas pasaporte o TOTALQUAL100 para tablas de fuentes externas). 

availab<-FALSE #Solo aplica si tiptable="Pasaporte"
#Parametro tipo TRUE o FALSE
#### Nota1: Mediante este parametro se le indica a la herramienta si la tabla de pasaporte tienen informacion sobre la disponibilidad de las accesiones (columna AVAILAB en la parte derecha de la tabla). 
#### Nota2: Este tipo de tablas con informacion sobre disponibilidad es de uso en herramientas como Representa o Complementa

fixthem<-TRUE
#Parametro tipo TRUE o FALSE
#### Nota1: Este parametro le indica a TesTable si el usuario quiere (TRUE) o no (FALSE) una copia de la tabla que se esta revisando con correccion automatrica de los errores detectados.
#### Nota2: El hecho que el usuario indique fixthem=TRUE no implica que se vaya a reemplazar o reescribir la tabla original

nmark<-1 #Solo aplica para tablas de fenotipo o genotipo (tiptable="Fenotipo" o tiptable="Genotipo")
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#### Nota1: el parametro nmark le indica a TesTable, el numero de marcadores o descriptores o variables que contiene la tabla de caracterizacion fenotipica o genotipica.
#### Nota2: El numero de marcadores/descriptores/variables en las tablas genotipo/fenotipo se obtiene al contar el numero de columnas que tiene la tabla, menos uno, que corresponde a la primera columna correspondiente a ACCENUMB, o codigo de identificacion de la accession.

phenot<-"NatVarMorfologia.txt" #Solo aplica cuando tiptable="NaturalezaVariables"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota1: En "phenot" escriba el nombre de la tabla que contiene la informacion fenotipica a la que hace referencia la tabla 'NaturalezaVariables' que desea analizar. Recuerde que esta, como el resto de tablas, debe estar guardada en la carpeta 'Pasaporte'. No olvide incluir la extension (.txt).
#### Nota2: Con esta informacion, la herramienta TesTable va a asegurarse que la tabla de caracterizacion fenotipica contiene el numero correcto de columnas (descriptores) y que su nombre coincide con el nombre indicado en la tabla de naturaleza de variables.