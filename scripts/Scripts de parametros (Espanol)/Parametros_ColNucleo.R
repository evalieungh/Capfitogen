##############################################
#Script de parametros ColNucleo 2021
##############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:http://www.capfitogen.net/es

####Como usar este script: Por favor configure cada parametro, seleccione todas las lineas de este script y haga click en el boton "Run". Luego, abra por favor el script de herramienta correspondiente y ejecutelo.

#### para cada parametro (palabra en color negro) por favor asigne un valor o seleccione una opcion

ruta<-"C:/CAPFITOGEN3"
#Parametro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN2 o CAPFITOGEN3 que esta localizada en la raiz del disco duro principal (usualmente c:/)


#############################################
#Pasaporte con GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL_ColNucleo.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que esta dentro de "ruta"
# Nota: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL


geoqual<-TRUE
#Parametro tipo TRUE o FALSE
# Tiene el pasaporte evaluacion GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)
# Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del parametro TOTALQUAL)
# Nota: aplicar geoqual=TRUE cuando la tabla pasaporte aun no ha pasado por la herramienta GEOQUAL o la tabla referenciada en el parametro pasaporte no tiene columna TOTALQUAL100 con valores validos, generara un error 

totalqual<-60 #Aplica solo si geoqual=TRUE
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
# Nota: debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ningun registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generara un error.

#############################################
#Mapa ELC
#############################################
mapaelc<-"mapa_elc_ecuador.grd"
#Parametro de tipo texto (un texto que va entre comillas "")
#Nota1: como se llama mapa ELC obtenido por utilizar herramienta ELC mapas previamente (archivo .grd y .gri que deben estar siempre en la carpeta CAPFITOGEN2/ELCmapas) (text box)
#Nota2: esta herramienta requiere haber obtenido antes un mapa ecogeografico de caracterizacion del territorio (ELC), que viene de la herramienta ELCmapas

statelc<-"Estadist_ELC_ecuador.txt"
#Parametro de tipo texto (un texto que va entre comillas "")
#Nota: Como se llama la tabla que contiene las estadisticas del mapa ELC? archivo .txt obtenido por utilizar herramienta ELC mapas previamente que acompana al mapa (siempre estara en la carpeta "ELCmapas") (text box)

#############################################
#Duplicidad
#############################################

distdup<-0
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
#Nota1: Umbral de distancia (en km) bajo la cual se considera que dos sitios de recoleccion realmente representan una misma poblacion
#Nota2: distdup no puede ser menor de cero y tampoco puede ser un numero exageradamente alto pues haria que todos los puntos son en realidad duplicados y el analisis se haria para un solo punto.

#############################################
#Caracteristicas de la coleccion nucleo
#############################################
#Porcentaje (%) de la coleccion total que definira el tamano (numero de entradas) de la coleccion nucleo/nuclear 
porcol<-10
#Parametro tipo numero (el cual en Rstudio aparecera con color azul)
# Nota: valor que debe estar entre 0 y 100

estratcol<-"P" #Proporcional
#estratcol<-"C" #Uniforme
#estratcol<-"L" #Logaritmico
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Estrategia de alocacion para la conformacion de la coleccion nucleo/nuclear, solo opciones validas: C, P, L

availab<-FALSE
#Parametro tipo TRUE o FALSE
# Nota: si availab=TRUE la tabla pasaporte debe tener hacia la parte derecha una columna llamada AVAILAB con valores YES/NO/NA. De no ser asi, se generara un error
# Nota2: Desea utilizar el campo AVAILAB (disponibilidad de entrada) para seleccionar cuales entradas serian apropiadas para formar parte de la coleccion nucleo/nuclear?

#############################################
#Resultados
#############################################
resultados<-"C:/CAPFITOGEN3/ResultadosColNucleo"
#Parametro de tipo texto (un texto que va entre comillas "")
# Nota: Ruta de una carpeta (existente) donde se guardaran los resultados