#######################################################################
# Script  de la herramienta GEOQUAL - GEOQUAL Tool script
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2021
#######################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LINEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRARA DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
##########################################################################################################
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write("______Herramienta/Tool GEOQUAL________", file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste("local:", local,sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.GEOQUAL.txt", append=TRUE)




#Ajustar el directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO GEOQUAL________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)
write("1.Determinada la direcci?n de trabajo", file="Error/process_info.txt", append=TRUE)

#activar paquetes ya instalados necesarios
#Check e instalacion si a lugar
packages2<-vector()
if(system.file(package="sp")==""){
  packages2<-append(packages2,"sp")
}
if(system.file(package="raster")==""){
  packages2<-append(packages2,"raster")
}
#if(system.file(package="maptools")==""){
#  packages2<-append(packages2,"maptools")
#}
#if(system.file(package="rgdal")==""){
#  packages2<-append(packages2,"rgdal")
#}
#if(system.file(package="rgeos")==""){
#  packages2<-append(packages2,"rgeos")
#}
#####Nuevo y reemplazando a rgdal, rgeos y maptools
if(system.file(package="sf")==""){
  packages2<-append(packages2,"sf")
}
if(system.file(package="dismo")==""){
  packages2<-append(packages2,"dismo")
}
if(system.file(package="RJSONIO")==""){
  packages2<-append(packages2,"RJSONIO")
}
if(system.file(package="googleVis")==""){
  packages2<-append(packages2,"googleVis")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}
#Carga de paquetes
library(sp)
library(raster)
#library(maptools)
library(dismo)
#library(rgdal)
#library(rgeos)
library(sf)
library(RJSONIO)
library(googleVis)
write("3. Terminada la carga de paquetes", file="Error/process_info.txt", append=TRUE)


#entra tabla 
#Entrar funcion para determinar si se produce (TRUE) un error
is.error<-function (expr, tell = FALSE, force = FALSE) 
{
  expr_name <- deparse(substitute(expr))
  test <- try(expr, silent = TRUE)
  iserror <- inherits(test, "try-error")
  if (tell) 
    if (iserror) 
      message("Note in is.error: ", test)
  if (force) 
    if (!iserror) 
      stop(expr_name, " is not returning an error.", call. = FALSE)
  iserror
}

if(is.error(read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character")))){
  read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"), fileEncoding="latin1",encoding="UTF-8")
} else {pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"), encoding="latin1")}

i <- order(pasaporte$ACCENUMB)
pasaporte <- pasaporte[i,]
write("4.Cargados los datos de pasaporte y ordenados por ACCENUMB", file="Error/process_info.txt", append=TRUE)


#Trifurcaci?n (sin coordenadas, con coordenadas sexagesimales, con coordenadas decimales)
sincoord<-subset(pasaporte,(is.na(LATITUDE)|is.na(LONGITUDE))&(is.na(DECLATITUDE)|is.na(DECLONGITUDE)))

sexagesimal<-subset(pasaporte,(!is.na(LATITUDE)&!is.na(LONGITUDE)))
sexagesimal<-sexagesimal[,c(1:22,24,26:ncol(sexagesimal))]
decimal<-subset(pasaporte,(is.na(LATITUDE)|is.na(LONGITUDE))&(!is.na(DECLATITUDE)&!is.na(DECLONGITUDE)))


###Sexagesimal a decimal  
#Obtenci?n de las coordenadas en formato decimal a partir de sexagesimal codificadas tal como lo indica el formato IPGRI 2001
if(length(sexagesimal[,1])>0){
  coordec<-as.data.frame(matrix(nrow = length(sexagesimal[,1]), ncol = 2))
  #colnames(coordec)[1]<-"DECLATITUDE"
  #colnames(coordec)[2]<-"DECLONGITUDE"
  coordec<-data.frame(sexagesimal$ACCENUMB,coordec)
  colnames(coordec)[1]<-"ACCENUMB"
  for (i in 1:length(sexagesimal[,1])) {
    coordec[i,2]<-ifelse(sexagesimal$LATITUDE[i]=='NA','NA', ((as.numeric(substr(sexagesimal$LATITUDE[i],1,2))+
                                                                 (ifelse(substr(sexagesimal$LATITUDE[i],3,4)=='--',0,(as.numeric(substr(sexagesimal$LATITUDE[i],3,4))/60)))+
                                                                 (ifelse(substr(sexagesimal$LATITUDE[i],5,6)=='--',0,(as.numeric(substr(sexagesimal$LATITUDE[i],5,6))/3600))))                                               
                                                              *(as.numeric(ifelse(substr(sexagesimal$LATITUDE[i],7,7)=='N',1,-1)))))
    coordec[i,3]<-ifelse(sexagesimal$LONGITUDE[i]=='NA','NA', ((as.numeric(substr(sexagesimal$LONGITUDE[i],1,3))+
                                                                  (ifelse(substr(sexagesimal$LONGITUDE[i],4,5)=='--',0,(as.numeric(substr(sexagesimal$LONGITUDE[i],4,5))/60)))+
                                                                  (ifelse(substr(sexagesimal$LONGITUDE[i],6,7)=='--',0,(as.numeric(substr(sexagesimal$LONGITUDE[i],6,7))/3600))))                                               
                                                               *(as.numeric(ifelse(substr(sexagesimal$LONGITUDE[i],8,8)=='E',1,-1)))))
  }
  sexagesimal<-cbind(sexagesimal[,1:22],coordec[,2],sexagesimal[,23],coordec[,3],sexagesimal[,24:ncol(sexagesimal)])
  colnames(sexagesimal)[23]<-"DECLATITUDE"
  colnames(sexagesimal)[24]<-"LATITUDE"
  colnames(sexagesimal)[25]<-"DECLONGITUDE"
  write("5.Terminado proceso de transformaci?n sexagesimal a decimal", file="Error/process_info.txt", append=TRUE)
  ###Unificaci?n coordenadas sexagesimal a decimal y decimal original
  puntosorig<-rbind(sexagesimal,decimal)
}
if(length(sexagesimal[,1])==0){
  puntosorig<-decimal
}
write("6.Unificaci?n de tabla con todas las coordenadas en decimal", file="Error/process_info.txt", append=TRUE)


#Validaci?n de las coordenadas, si error, aviso
if(any(puntosorig$DECLATITUDE>=90|puntosorig$DECLATITUDE<=-90|puntosorig$DECLONGITUDE>=180|puntosorig$DECLONGITUDE<=-180)){ 
  write("Alguna coordenada sobrepasa los limites permitidos, revise, corrija y pruebe de nuevo", file="process_info.txt", append=TRUE)
}

#Creaci?n de un archivo espacial de puntos
puntos<-SpatialPoints(puntosorig[,c(25,23)],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
write("7.Creaci?n archivo de puntos espacial (SpatialPoints) a partir de coordenadas decimal", file="Error/process_info.txt", append=TRUE)



#Carga de shapefiles GADM a nivel pa?s
load("ID0.RData")
if(proj4string(puntos)!=proj4string(ID0)){
  proj4string(ID0)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  proj4string(puntos)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
}
write("8.Carga de capa ID0 mundial y homogenizaci?n de sistema de coordenadas a WGS84", file="Error/process_info.txt", append=TRUE)



#Extracci?n del ISO de pa?s para los puntos y carga de GADM de s?lo pa?ses involucrados
CTYcode<-over(puntos,ID0)
CTYcode<-cbind(puntosorig[,c(2,25,23)],CTYcode)
write("9.Extracci?n del ISO de pa?s para los puntos y carga de GADM de s?lo pa?ses involucrados", file="Error/process_info.txt", append=TRUE)


#Separaci?n en puntos que caen en mar o aguas internas (no r?os)
enmar<-subset(CTYcode,is.na(ISO))
if(length(enmar[,1])!=0){
  enmar1<-SpatialPoints(enmar[,c(2,3)],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
}

#y puntos que caen en tierra
CTYcode<-subset(CTYcode,!is.na(ISO))
write("10.Separaci?n en puntos que caen en mar o aguas internas y puntos que caen en tierra", file="Error/process_info.txt", append=TRUE)

#Extraccion de informacion para puntos en tierra
aaa<-list()
CTY<-unique(CTYcode[,4])
for(i in 1:length(CTY))
{
  pais1<-paste("CTY/",CTY[i],sep="")
  paisext<-st_read(paste(ruta,"/",pais1,".shp",sep=""))
  paisext<-as_Spatial(paisext)
  proj4string(paisext)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"  
  puntosext<-subset(CTYcode,ISO==paste(CTY[i]))
  puntosext1<-SpatialPoints(puntosext[,c(2,3)],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  if(proj4string(puntosext1)!=proj4string(paisext)){
    proj4string(paisext)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    proj4string(puntosext1)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  }
  aaa[[paste(CTY[i])]]<-cbind(puntosext[,1],over(puntosext1,paisext))
}
extraccion<-do.call("rbind",aaa)
colnames(extraccion)[1]<-"ACCENUMB"
write("11.Extracci?n de informaci?n para puntos que caen en tierra", file="Error/process_info.txt", append=TRUE)



#extraccion para puntos en mar
if(length(enmar[,1])!=0){

  #Determinacion paises en datos objetivo desde coord o localidad que tienen costas
  paismar<-read.delim("ListaPaisesMar.txt")
  CTY2<-as.character(unique(pasaporte[,16]))
  CTY2<-CTY2[!is.na(CTY2)]
  CTY2<-unique(c(as.character(CTY),CTY2))
  CTY2<-data.frame(cbind(1:length(CTY2),CTY2))
  colnames(CTY2)[2]<-"ISO"
  CTY2<-merge(CTY2,paismar,by="ISO")
  CTY2<-as.character(CTY2$ISO)
  #Carga y extraccion desde anillo 1km paises desde coord o local con mar
  aaa<-list()
  for(i in 1:length(CTY2))
  {
    pais1<-paste("highr/1km/",paste(CTY2[i]),".RData",sep="")
    mar1k<-get(load(pais1))
    if(proj4string(enmar1)!=proj4string(mar1k)){
      proj4string(enmar1)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
      proj4string(mar1k)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    }
    aaa[[i]]<-over(enmar1,mar1k)
  }
  mar1k.orig<-do.call("cbind",aaa)
  colnames(mar1k.orig)[]<-CTY2
  #tabla si a 1 kilometro (0/1)
  aaa<-list()
  for (i in 1:length(enmar[,1])){
    ccc<-as.vector(as.numeric(mar1k.orig[i,]))
    bbb<-ifelse(any(ccc==1),1,0)
    aaa[[i]]<-bbb
  }
  mar1k<-do.call("rbind",aaa)
  mar1k<-data.frame(enmar[,1],mar1k)
  colnames(mar1k)[1]<-"ACCENUMB"
  #tabla origcty a 1km con destino LOCALQUAL
  mar1k.cty<-data.frame(lapply(mar1k.orig, as.character), stringsAsFactors=FALSE)
  aaa<-list()
  for (i in 1:length(mar1k.cty[,1]))
  {
    bbb<-as.vector(unique(as.character(mar1k.cty[i,])))
    if(any(!is.na(bbb)))
    {
      bbb<-bbb[!is.na(bbb)]
      bbb<-bbb[1]
    }
    aaa[[i]]<-bbb
  }
  mar1k.cty<-do.call("rbind",aaa)
  #tabla final 1 km
  mar1k<-data.frame(mar1k,mar1k.cty)
  #10km
  #Carga y extracci?n desde anillo 10km paises desde coord o local con mar
  aaa<-list()
  for(i in 1:length(CTY2))
  {
    pais1<-paste("highr/10km/",paste(CTY2[i]),".RData",sep="")
    mar10k<-get(load(pais1))
    
    if(proj4string(enmar1)!=proj4string(mar10k)){
      proj4string(enmar1)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
      proj4string(mar10k)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    }
    
    aaa[[i]]<-over(enmar1,mar10k)
  }
  mar10k.orig<-do.call("cbind",aaa)
  colnames(mar10k.orig)[]<-CTY2
  #tabla si a 10 kilometro (0/1)
  aaa<-list()
  for (i in 1:length(enmar[,1])){
    ccc<-as.vector(as.numeric(mar10k.orig[i,]))
    bbb<-ifelse(any(ccc==1),10,0)
    aaa[[i]]<-bbb
  }
  mar10k<-do.call("rbind",aaa)
  mar10k<-data.frame(enmar[,1],mar10k)
  colnames(mar10k)[1]<-"ACCENUMB"
  #tabla origcty a 10km con destino LOCALQUAL
  mar10k.cty<-data.frame(lapply(mar10k.orig, as.character), stringsAsFactors=FALSE)
  aaa<-list()
  for (i in 1:length(mar10k.cty[,1]))
  {
    bbb<-as.vector(unique(as.character(mar10k.cty[i,])))
    if(any(!is.na(bbb)))
    {
      bbb<-bbb[!is.na(bbb)]
      bbb<-bbb[1]
    }
    aaa[[i]]<-bbb
  }
  mar10k.cty<-do.call("rbind",aaa)
  #tabla final 10 km
  mar10k<-data.frame(mar10k,mar10k.cty)
  #Unificaci?n
  DISTOLAND<-as.data.frame(matrix(nrow=length(enmar[,1]),ncol=1))
  for(i in 1:length(enmar[,1])){
    if(is.na(mar1k[i,2])&is.na(mar10k[i,2])){
      DISTOLAND[i,1]<-11
    }
    if(!is.na(mar1k[i,2])){
      DISTOLAND[i,1]<-1
    }
    if(!is.na(mar10k[i,2])){
      DISTOLAND[i,1]<-10
    }
  }
  colnames(DISTOLAND)[1]<-"DISTOLAND"
  DISTOLAND<-data.frame(enmar[,1],DISTOLAND)
  colnames(DISTOLAND)[1]<-"ACCENUMB" 
  DISTOLAND<-merge(puntosorig,DISTOLAND,by="ACCENUMB",all.x=TRUE)
  DISTOLAND2<-DISTOLAND$DISTOLAND
  DISTOLAND2[is.na(DISTOLAND2)]<-0
  DISTOLAND2[DISTOLAND2==11]<-NA
  DISTOLAND<-cbind(DISTOLAND,DISTOLAND2)
  DISTOLAND<-DISTOLAND[,c(1,ncol(DISTOLAND))]
  colnames(DISTOLAND)[2]<-"DISTOLAND"
  write("12.Extracci?n de informaci?n para puntos que caen en mar_alta precisi?n", file="Error/process_info.txt", append=TRUE)
} 
#Unificacion tablas pasaporte y tablas extracci?n desde coordenadas
###################
unitabla<-merge(puntosorig,extraccion,by="ACCENUMB",all.x=TRUE)
if(length(enmar[,1])!=0){
  unitabla<-merge(unitabla,DISTOLAND,by="ACCENUMB",all.x=TRUE)
}
if(length(enmar[,1])==0){
  DISTOLAND<-rep(0,length(unitabla[,1]))
  DISTOLAND<-data.frame(unitabla$ACCENUMB,DISTOLAND)
  colnames(DISTOLAND)[1]<-"ACCENUMB"
  unitabla<-merge(unitabla,DISTOLAND,by="ACCENUMB",all.x=TRUE)
}
rm(ID0)

write("13.Unificacion tablas pasaporte y tablas extracci?n desde coordenadas", file="Error/process_info.txt", append=TRUE)

#SUITQUAL# -> A todo con coordenadas
##########
#Importaci?n capa Global Land Cover 2000
glc2000<-raster("glc2000_300.tif")
#Extracci?n de uso de suelo
globlandc<-extract(glc2000,unitabla[,c("DECLONGITUDE","DECLATITUDE")])
unitabla<-cbind(unitabla,globlandc)
write("14.SUITQUAL-Introducci?n capa Global Land Cover 2000 y extracci?n desde unitabla", file="Error/process_info.txt", append=TRUE)

#Introducci?n de tabla que asigna valores SUITQUAL
tablaglc<-read.delim("SUITQUALtableGLC2000.txt")
#Divisi?n de entradas entre cultivadas y silvestres
culti<-subset(unitabla,SAMPSTAT!=100&SAMPSTAT!=110&SAMPSTAT!=120|is.na(SAMPSTAT))
wild<-subset(unitabla,SAMPSTAT==100|SAMPSTAT==110|SAMPSTAT==120)
#asignaci?n de SUITQUAL diferenciada cultivadas/wild
tablaglcculti<-tablaglc[,c(1,3)]
tablaglcwild<-tablaglc[,c(1,4)]
culti<-merge(culti,tablaglcculti,by.x="globlandc",by.y="VALUE",all.x=T)
wild<-merge(wild,tablaglcwild,by.x="globlandc",by.y="VALUE",all.x=T)

colnames(culti)[ncol(culti)]<-"SUITQUAL"
colnames(wild)[ncol(wild)]<-"SUITQUAL"
unitabla<-rbind(culti,wild)
unitabla<-unitabla[,c(2:(ncol(unitabla)-2),1,(ncol(unitabla)-1),(ncol(unitabla)))]


write("15.SUITQUAL-Introducci?n tabla correspondencias y aplicaci?n par?metro SUITQUAL por STAT", file="Error/process_info.txt", append=TRUE)
#Correcci?n al alza de SUITQUAL para puntos que caen en cuerpos de agua de acuerdo uso de suelo pero en tierra de acuerdo a GADM
for(i in 1:length(unitabla[,1])){
  unitabla[i,(ncol(unitabla))]<-ifelse(unitabla[i,(ncol(unitabla)-1)]==0&unitabla[i,(ncol(unitabla))]==0,5,unitabla[i,(ncol(unitabla))])
}
#Correcci?n al alza de SUITQUAL para puntos que caen en cuerpos de agua x GLC pero caen en anillo 1km o 10 km
#para puntos a 1 km
for(i in 1:length(unitabla[,1])){
  unitabla[i,(ncol(unitabla))]<-ifelse(unitabla[i,(ncol(unitabla)-1)]==1&unitabla[i,(ncol(unitabla))]==0,10,unitabla[i,(ncol(unitabla))])
}
#para puntos a 10 km
#para puntos a 1 km
for(i in 1:length(unitabla[,1]))
{
  unitabla[i,(ncol(unitabla))]<-ifelse(unitabla[i,(ncol(unitabla)-1)]==10&unitabla[i,(ncol(unitabla))]==0,5,unitabla[i,(ncol(unitabla))])
}

rm(glc2000)
write("16.SUITQUAL-Correcciones del par?metro y fin del proceso", file="Error/process_info.txt", append=TRUE)

#LOCALQUAL# -> A coordenadas en tierra, en mar
###########

#Introducci?n tabla GADM con descripci?n de pol?gonos administrativos hasta NAME4
setwd(paste(ruta,"/CTY",sep=""))
load("gadm2.RData")
setwd(paste(ruta))
#Asignaci?n de informaci?n GADM a las entradas a partir del n?mero del pol?gono
unitabla<-merge(unitabla,gadm2,by="OBJECTID",all.x=T)
unitabla1<-subset(unitabla,DISTOLAND==0)
unitabla1<-unitabla1[,c(2:(ncol(unitabla1)-19),1,(ncol(unitabla1)-18):(ncol(unitabla1)))]
write("17.LOCALQUAL-Introducci?n tabla GADM y asignaci?n de info GADM a partir del No de Pol?gono", file="Error/process_info.txt", append=TRUE)

#introducci?n tabla nivel m?ximo de comparaci?n ADM
admlevel<-read.delim("ADMlevel.txt")
admlevel<-admlevel[,c(1,4)]

#Tabla temporal con informaci?n a comparar y nivel de comparaci?n
local1<-unitabla1[,c(1,16,18,19,20,21,(ncol(unitabla1)-17),(ncol(unitabla1)-14),(ncol(unitabla1)-13),(ncol(unitabla1)-10),(ncol(unitabla1)-9),(ncol(unitabla1)-6),(ncol(unitabla1)-5),(ncol(unitabla1)-2),(ncol(unitabla1)-1))]
local1<-merge(local1,admlevel,by="ORIGCTY",all.x=T)
write("18.LOCALQUAL-Introducci?n tabla ADMlevel para niveles de comparaci?n admisibles por pa?s", file="Error/process_info.txt", append=TRUE)

##Comparaci?n entre cadenas de caracteres de descripci?n de localidad
##proveniente de datos de pasaporte y provenientes de GADM a partir de coordenadas
#funci?n Agrep y distancia generalizada de Levenshtein

#comparaci?n entre c?digo ISO de pa?s
comp1<-as.data.frame(matrix(nrow = length(local1[,1]), ncol = 41))
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,1],local1[i,7],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,1] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,1],local1[i,7],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,2] <- ifelse(length(axb)>0,axb,0)
}
colnames(comp1)[1]<-"ISO_D0"
colnames(comp1)[2]<-"ISO_D1"

#Comparaci?n entre ADM1 y Name1, se compara adem?s con Varname1
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,8],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,3] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,8],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,4] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,8],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,5] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,9],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,6] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,9],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,7] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,3],local1[i,9],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,8] <- ifelse(length(axb)>0,axb,0)
}
colnames(comp1)[3]<-"ADM1_D0"
colnames(comp1)[4]<-"ADM1_D1"
colnames(comp1)[5]<-"ADM1_D2"
colnames(comp1)[6]<-"ADM1v_D0"
colnames(comp1)[7]<-"ADM1v_D1"
colnames(comp1)[8]<-"ADM1v_D2"

#Comparaci?n entre ADM2 y Name2, se compara adem?s con Varname2
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,10],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,9] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,10],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,10] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,10],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,11] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,11],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,12] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,11],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,13] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,4],local1[i,11],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,14] <- ifelse(length(axb)>0,axb,0)
}
colnames(comp1)[9]<-"ADM2_D0"
colnames(comp1)[10]<-"ADM2_D1"
colnames(comp1)[11]<-"ADM2_D2"
colnames(comp1)[12]<-"ADM2v_D0"
colnames(comp1)[13]<-"ADM2v_D1"
colnames(comp1)[14]<-"ADM2v_D2"

#Comparaci?n entre ADM3 y Name3, se compara adem?s con Varname3
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,12],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,15] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,12],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,16] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,12],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,17] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,13],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,18] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,13],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,19] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,5],local1[i,13],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,20] <- ifelse(length(axb)>0,axb,0)
}
colnames(comp1)[15]<-"ADM3_D0"
colnames(comp1)[16]<-"ADM3_D1"
colnames(comp1)[17]<-"ADM3_D2"
colnames(comp1)[18]<-"ADM3v_D0"
colnames(comp1)[19]<-"ADM3v_D1"
colnames(comp1)[20]<-"ADM3v_D2"

#Comparaci?n entre ADM4 y Name4, se compara adem?s con Varname4
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,14],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,21] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,14],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,22] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,14],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,23] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,15],ignore.case=TRUE,value=F,max=list(all=0))
  comp1[i,24] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,15],ignore.case=TRUE,value=F,max=list(all=1))
  comp1[i,25] <- ifelse(length(axb)>0,axb,0)
}
for(i in 1:length(local1[,1]))
{
  axb<- agrep(local1[i,6],local1[i,15],ignore.case=TRUE,value=F,max=list(all=2))
  comp1[i,26] <- ifelse(length(axb)>0,axb,0)
}
colnames(comp1)[21]<-"ADM4_D0"
colnames(comp1)[22]<-"ADM4_D1"
colnames(comp1)[23]<-"ADM4_D2"
colnames(comp1)[24]<-"ADM4v_D0"
colnames(comp1)[25]<-"ADM4v_D1"
colnames(comp1)[26]<-"ADM4v_D2"
#consolidaci?n de resultados (coincidencia entre ADM y Name o ADM y Varname)
for(i in 1:length(comp1[,1]))
{
  #ORIGCTY vs ISO
  comp1[i,27]<- ifelse(is.na(comp1$ISO_D0[i]),"NA",
                              ifelse (comp1$ISO_D0[i]>0|comp1$ISO_D1[i]>0,1,0))
  comp1[i,28] <- ifelse(comp1$ISO_D0[i]==0&comp1$ISO_D1[i]>0, "ORIGCTY/ISO iguales?","Ok")
  comp1[i,29] <- ifelse(comp1$ISO_D0[i]==0&comp1$ISO_D1[i]==0, "ORIGCTY/ISO diferentes?","Ok")
  #ADM1 vs Name1/Varname1
  comp1[i,30]<- ifelse(is.na(comp1$ADM1_D0[i]),"NA",
                       ifelse (comp1$ADM1_D0[i]>0|comp1$ADM1_D1[i]>0|comp1$ADM1_D2[i]>0|comp1$ADM1v_D0[i]>0|comp1$ADM1v_D1[i]>0|comp1$ADM1v_D2[i]>0,1,0))
  comp1[i,31] <- ifelse(comp1$ADM1_D0[i]==0&comp1$ADM1_D1[i]==0&comp1$ADM1_D2[i]>0|comp1$ADM1v_D0[i]==0&comp1$ADM1v_D1[i]==0&comp1$ADM1v_D2[i]>0, "ADM1/Name1-Varname1 iguales?","Ok")
  comp1[i,32] <- ifelse(comp1$ADM1_D2[i]==0&comp1$ADM1v_D2[i]==0, "ADM1/Name1-Varname1 diferentes?","Ok")
  #ADM2 vs Name2/Varname2
  comp1[i,33]<- ifelse(is.na(comp1$ADM2_D0[i]),"NA",
                       ifelse (comp1$ADM2_D0[i]>0|comp1$ADM2_D1[i]>0|comp1$ADM2_D2[i]>0|comp1$ADM2v_D0[i]>0|comp1$ADM2v_D1[i]>0|comp1$ADM2v_D2[i]>0,1,0))
  comp1[i,34] <- ifelse(comp1$ADM2_D0[i]==0&comp1$ADM2_D1[i]==0&comp1$ADM2_D2[i]>0|comp1$ADM2v_D0[i]==0&comp1$ADM2v_D1[i]==0&comp1$ADM2v_D2[i]>0, "ADM2/Name2-Varname2 iguales?","Ok")
  comp1[i,35] <- ifelse(comp1$ADM2_D2[i]==0&comp1$ADM2v_D2[i]==0, "ADM2/Name2-Varname2 diferentes?","Ok")
  #ADM3 vs Name3/Varname3
  comp1[i,36]<- ifelse(is.na(comp1$ADM3_D0[i]),"NA",
                       ifelse (comp1$ADM3_D0[i]>0|comp1$ADM3_D1[i]>0|comp1$ADM3_D2[i]>0|comp1$ADM3v_D0[i]>0|comp1$ADM3v_D1[i]>0|comp1$ADM3v_D2[i]>0,1,0))
  comp1[i,37] <- ifelse(comp1$ADM3_D0[i]==0&comp1$ADM3_D1[i]==0&comp1$ADM3_D2[i]>0|comp1$ADM3v_D0[i]==0&comp1$ADM3v_D1[i]==0&comp1$ADM3v_D2[i]>0, "ADM3/Name3-Varname3 iguales?","Ok")
  comp1[i,38] <- ifelse(comp1$ADM3_D2[i]==0&comp1$ADM3v_D2[i]==0, "ADM3/Name3-Varname3 diferentes?","Ok")
  #ADM4 vs Name4/Varname4
  comp1[i,39]<- ifelse(is.na(comp1$ADM4_D0[i]),"NA",
                       ifelse (comp1$ADM4_D0[i]>0|comp1$ADM4_D1[i]>0|comp1$ADM4_D2[i]>0|comp1$ADM4v_D0[i]>0|comp1$ADM4v_D1[i]>0|comp1$ADM4v_D2[i]>0,1,0))
  comp1[i,40] <- ifelse(comp1$ADM4_D0[i]==0&comp1$ADM4_D1[i]==0&comp1$ADM4_D2[i]>0|comp1$ADM4v_D0[i]==0&comp1$ADM4v_D1[i]==0&comp1$ADM4v_D2[i]>0, "ADM4/Name4-Varname4 iguales?","Ok")
  comp1[i,41] <- ifelse(comp1$ADM4_D2[i]==0&comp1$ADM4v_D2[i]==0, "ADM4/Name4-Varname4 diferentes?","Ok")
  
}
colnames(comp1)[27]<-"ISOMATCH"
colnames(comp1)[28]<-"ISOFP"
colnames(comp1)[29]<-"ISOVN"
colnames(comp1)[30]<-"ADM1MATCH"
colnames(comp1)[31]<-"ADM1FP"
colnames(comp1)[32]<-"ADM1VN"
colnames(comp1)[33]<-"ADM2MATCH"
colnames(comp1)[34]<-"ADM2FP"
colnames(comp1)[35]<-"ADM2VN"
colnames(comp1)[36]<-"ADM3MATCH"
colnames(comp1)[37]<-"ADM3FP"
colnames(comp1)[38]<-"ADM3VN"
colnames(comp1)[39]<-"ADM4MATCH"
colnames(comp1)[40]<-"ADM4FP"
colnames(comp1)[41]<-"ADM4VN"
local1<-cbind(local1,comp1)

write("19.LOCALQUAL-Finalizaci?n de los proceso de comparaci?n de t?rminos a determinados niveles seg?n nivel", file="Error/process_info.txt", append=TRUE)

#Elaboraci?n tabla para revisi?n visual sobre falsos positivos (aciertos con un margen de 2 deleciones/inserciones/cambios donde podria no haberlos)
revisionFP<-subset(local1,ISOFP=="ORIGCTY/ISO iguales?"|ADM1FP=="ADM1/Name1-Varname1 iguales?"|ADM2FP=="ADM2/Name2-Varname2 iguales?"|ADM3FP=="ADM3/Name3-Varname3 iguales?"|ADM4FP=="ADM4/Name4-Varname4 iguales?")
revisionFP<-revisionFP[,c(1,7,44,3,8,9,47,4,10,11,50,5,12,13,53,6,14,15,56)]
#Exportar tabla para revisi?n en excel?
#write.table(revisionFP, file = "Revision_Visual_Falsos_Positivos.txt", sep = "\t", col.names = NA, qmethod = "double")


#revisar visualmente asegurandose que los campos que se compararon y se declararon como "correspondientes" o "equivalentes" en realidad lo sean. 
#EN caso de que haya alg?n error, corregir como se indica 

#Elaboraci?n tabla para revisi?n visual sobre verdaderos negativos
revisionVN<-subset(local1,ISOVN=="ORIGCTY/ISO diferentes?"|ADM1VN=="ADM1/Name1-Varname1 diferentes?"|ADM2VN=="ADM2/Name2-Varname2 diferentes?"|ADM3VN=="ADM3/Name3-Varname3 diferentes?"|ADM4VN=="ADM4/Name4-Varname4 diferentes?")
revisionVN<-revisionVN[,c(1,7,45,3,8,9,48,4,10,11,51,5,12,13,54,6,14,15,57)]
#Exportar tabla para revisi?n en excel?
#write.table(revisionVN, file = "Revision_Visual_Verdaderos_Negativos.txt", sep = "\t", col.names = NA, qmethod = "double")

#Corregir visualmente?
#RESULTADO 1

write("20.LOCALQUAL-Tablas de revisi?n visual producidas/exportadas", file="Error/process_info.txt", append=TRUE)


#Transformar NAs a cero en columnas "match"
for(i in 1:length(local1[,1]))
{
   if(local1[i,43]=="NA"){
     local1[i,43]<-0 
   }
   if(local1[i,46]=="NA"){
     local1[i,46]<-0 
   }
   if(local1[i,49]=="NA"){
     local1[i,49]<-0 
   }
   if(local1[i,52]=="NA"){
     local1[i,52]<-0 
   }
   if(local1[i,55]=="NA"){
     local1[i,55]<-0
   }
}
write("21.LOCALQUAL-Transformaci?n de NA's a ceros", file="Error/process_info.txt", append=TRUE)
#Calculo primario de LOCALQUAL
LOCALQUAL<-as.data.frame(matrix(nrow = length(local1[,1]), ncol = 1))
LOCALQUAL<-cbind(local1$ACCENUMB,local1$NIVELMAX,LOCALQUAL)
colnames(LOCALQUAL)[1]<-"ACCENUMB"
colnames(LOCALQUAL)[2]<-"NIVELMAX"
colnames(LOCALQUAL)[3]<-"LOCALQUAL"
for(i in 1:length(local1[,1]))
{
  if(is.na(local1[i,16])){
    LOCALQUAL[i,3]<-0
  }
  if(!is.na(local1[i,16])){
  if(local1[i,16]=="ORIGCTY"){
    LOCALQUAL[i,3]<- local1[i,43]*20 
  }
  if(local1[i,16]=="ADM1"){
    LOCALQUAL[i,3]<- (as.numeric(local1[i,43])+as.numeric(local1[i,46]))*(20/2) 
  }
  if(local1[i,16]=="ADM2"){
    LOCALQUAL[i,3]<- (as.numeric(local1[i,43])+as.numeric(local1[i,46])+as.numeric(local1[i,49]))*(20/3) 
  }
  if(local1[i,16]=="ADM3"){
    LOCALQUAL[i,3]<- (as.numeric(local1[i,43])+as.numeric(local1[i,46])+as.numeric(local1[i,49])+as.numeric(local1[i,52]))*(20/4) 
  }
  if(local1[i,16]=="ADM4"){
    LOCALQUAL[i,3]<- (as.numeric(local1[i,43])+as.numeric(local1[i,46])+as.numeric(local1[i,49])+as.numeric(local1[i,52])+as.numeric(local1[i,55]))*(20/5) 
  }
  }
}

write("22.LOCALQUAL-Generaci?n del par?metro final LOCALQUAL", file="Error/process_info.txt", append=TRUE)
#adici?n a la tabla general del par?metro LOCALQUAL
unitabla<-merge(unitabla,LOCALQUAL,by="ACCENUMB",all.x=TRUE)

#Correcci?n caso Espa?a, donde ADM3 no se usa en tablas de pasaporte, por lo que esa comparaci?n no debe tenerse en cuenta.
#Para Espa?a el m?ximo nivel de comparaci?n es ADM4, por lo que en caso de ocurrir 4 comparaciones positivas, el valor LOCALQUAL ser? 20
for(i in 1:length(unitabla[,1]))
{
  unitabla[i,(ncol(unitabla))]<- ifelse(unitabla[i,17]=="ESP"&unitabla[i,(ncol(unitabla))]==16,20,
                          ifelse(unitabla[i,17]=="ESP"&unitabla[i,(ncol(unitabla))]==12,15,
                                 ifelse(unitabla[i,17]=="ESP"&unitabla[i,(ncol(unitabla))]==8,10,
                                        ifelse(unitabla[i,17]=="ESP"&unitabla[i,(ncol(unitabla))]==4,5,unitabla[i,(ncol(unitabla))]))))
}
write("23.LOCALQUAL-Correcci?n caso Espa?a", file="Error/process_info.txt", append=TRUE)
#a?adiendo 0 a valor final LOCALQUAL para puntos en mar
for(i in 1:length(unitabla[,1]))
{
  unitabla[i,(ncol(unitabla))]<- ifelse(is.na(unitabla[i,(ncol(unitabla))]),0,unitabla[i,(ncol(unitabla))])
}
write("24.LOCALQUAL-Final proceso LOCALQUAL, asignaci?n valor cero a puntos en el mar", file="Error/process_info.txt", append=TRUE)

#COORQUAL# -> a todos los registros
###########

#Determinaci?n de subpar?metros ERRORES, PRECIS, GEORBLE y INTERTEMP

#Obtenci?n del a?o de recolecci?n INTERTEMP
intertemp<-vector(mode="numeric",length = length(pasaporte[,1]))
colldate<-as.numeric(substr(pasaporte$COLLDATE, 1,4))
intertemp<-data.frame(pasaporte$ACCENUMB,colldate,intertemp)
colnames(intertemp)[1]<-"ACCENUMB"
for(i in 1:length(intertemp[,1]))
{
  intertemp[i,3]<-ifelse(is.na(intertemp[i,2]),0,ifelse(intertemp[i,2]<1995,1,ifelse(intertemp[i,2]>=1995&intertemp[i,2]<2000,2,ifelse(intertemp[i,2]>=2000,3,0))))
}
intertemp<-intertemp[,c(1,3)]
write("25.COORQUAL-Obtenci?n subpar?metro INTERTEMP", file="Error/process_info.txt", append=TRUE)

#Obtenci?n de evidencias de errores en la codificaci?n de las coordenadas ERRORES
#Nota: s?lo aplica a entradas con coordenadas
#Codificaci?n: Error evidente=0 , sin evidencia de error=1
errores<-vector(mode="numeric",length = length(pasaporte[,1]))
errores[]<-1
errores<-data.frame(pasaporte$ACCENUMB,errores)
colnames(errores)[1]<-"ACCENUMB"
for(i in 1:length(errores[,1])){
  if(is.na(pasaporte[i,24])&is.na(pasaporte[i,26])&is.na(pasaporte[i,23])&is.na(pasaporte[i,25]))
  {
    errores[i,2]<-0
  }
  if(is.na(pasaporte[i,24])&is.na(pasaporte[i,26])&is.na(pasaporte[i,23])&!is.na(pasaporte[i,25]))
  {
    errores[i,2]<-0
  }
  if(is.na(pasaporte[i,24])&is.na(pasaporte[i,26])&!is.na(pasaporte[i,34])&is.na(pasaporte[i,25]))
  {
    errores[i,2]<-0
  }
  if(is.na(pasaporte[i,24])&!is.na(pasaporte[i,26])&is.na(pasaporte[i,23])&is.na(pasaporte[i,25]))
  {
    errores[i,2]<-0
  }
  if(!is.na(pasaporte[i,24])&is.na(pasaporte[i,26])&is.na(pasaporte[i,23])&is.na(pasaporte[i,25]))
  {
    errores[i,2]<-0
  }
  if(is.na(pasaporte[i,24])&is.na(pasaporte[i,26])&!is.na(pasaporte[i,23])&!is.na(pasaporte[i,25]))
  {
    if(pasaporte[i,23]>=90|pasaporte[i,23]<=-90|pasaporte[i,25]>=180|pasaporte[i,25]<=-180)
    {
      errores[i,2]<-0
    }
  }
  if(!is.na(pasaporte[i,24])&!is.na(pasaporte[i,26])&!is.na(pasaporte[i,23])&!is.na(pasaporte[i,25]))
  {
    if(substr(pasaporte[i,24],1,2)>=90|substr(pasaporte[i,26],1,3)>=180|substr(pasaporte[i,24],3,4)>=60|substr(pasaporte[i,26],4,5)>=60|substr(pasaporte[i,24],5,6)>=60|substr(pasaporte[i,26],6,7)>=60|(substr(pasaporte[i,24],7,7)!="N"&substr(pasaporte[i,24],7,7)!="S")|(substr(pasaporte[i,26],8,8)!="E"&substr(pasaporte[i,26],8,8)!="W"))
    {
      errores[i,2]<-0
    }
  }
}  
write("26.COORQUAL-Obtenci?n subpar?metro ERRORES", file="Error/process_info.txt", append=TRUE)

#Obtenci?n de precisi?n de las coordenadas a partir de coordenadas en formato sexagesimal PRECIS
#Nota: s?lo aplica a entradas con coordenadas y con s?lo coordenadas sexagesimales
precis<-vector(mode="numeric",length = length(pasaporte[,1]))
precis<-data.frame(pasaporte$ACCENUMB,precis)
colnames(precis)[1]<-"ACCENUMB"
for(i in 1:length(precis[,1])){
  if(!is.na(pasaporte[i,24])&!is.na(pasaporte[i,26]))
  {
    if(!is.na(substr(pasaporte[i,24],1,2))&!is.na(substr(pasaporte[i,26],1,3)))
    {
      precis[i,2]<-1
    }
    if(substr(pasaporte[i,24],3,4)!="--"&substr(pasaporte[i,26],4,5)!="--")
    {
      precis[i,2]<-2
    }
    if(substr(pasaporte[i,24],5,6)!="--"&substr(pasaporte[i,26],6,7)!="--")
    {
      precis[i,2]<-3
    }
  }
}
#Aplicaci?n del valor 3 a todas las entradas que est?n en exclusiva en formato decimal
for(i in 1:length(precis[,1]))
{
  if(any(precis[i,1]==decimal[,2]))
  {
  precis[i,2]<-3
  }
}
write("27.COORQUAL-Obtenci?n subpar?metro PRECIS", file="Error/process_info.txt", append=TRUE)

#Determinaci?n de georreferenciabilidad GEORBLE
#Nota: aplica a todo, incluso entradas sin coordenadas
georble<-vector(mode="numeric",length = length(pasaporte[,1]))
georble<-data.frame(pasaporte$ACCENUMB,pasaporte$ORIGCTY,georble)
colnames(georble)[1]<-"ACCENUMB"
colnames(georble)[2]<-"ORIGCTY"
georble<-merge(georble,admlevel,by="ORIGCTY",all.x=T)
i <- order(georble$ACCENUMB)
georble <- georble[i,]
for(i in 1:length(georble[,1])){
  georble[i,3]<-ifelse(is.na(georble[i,4]),0,
                       ifelse(georble[i,4]=="ORIGCTY",
                              ifelse(is.na(pasaporte[i,16])&!is.na(pasaporte[i,22]),1,
                                     ifelse(!is.na(pasaporte[i,16])&is.na(pasaporte[i,22]),2,3)),
                              ifelse(georble[i,4]=="ADM1",
                                     ifelse(is.na(pasaporte[i,18])&!is.na(pasaporte[i,22]),1,
                                            ifelse(!is.na(pasaporte[i,18])&is.na(pasaporte[i,22]),2,3)),
                                     ifelse(georble[i,4]=="ADM2",
                                            ifelse(is.na(pasaporte[i,19])&!is.na(pasaporte[i,22]),1,
                                                   ifelse(!is.na(pasaporte[i,19])&is.na(pasaporte[i,22]),2,3)),
                                            ifelse(georble[i,4]=="ADM3",
                                                   ifelse(is.na(pasaporte[i,20])&!is.na(pasaporte[i,22]),1,
                                                          ifelse(!is.na(pasaporte[i,20])&is.na(pasaporte[i,22]),2,3)),
                                                   ifelse(georble[i,4]=="ADM4",
                                                          ifelse(is.na(pasaporte[i,21])&!is.na(pasaporte[i,22]),1,
                                                                 ifelse(!is.na(pasaporte[i,21])&is.na(pasaporte[i,22]),2,3))))))))
}
georble<-georble[,c(2,3)]
write("27.COORQUAL-Obtenci?n subpar?metro GEORBLE", file="Error/process_info.txt", append=TRUE)

#Uso de GEOREFMETH en caso de que haya datos disponibles. S?lo aplicar? s? hay dato de GEOREFMETH para todos los casos
nogeoref<-TRUE
if(any(is.na(unitabla$GEOREFMETH))){
  nogeoref<-FALSE
}
if(nogeoref){
GEOREFMETH1<-vector(mode="numeric",length = length(pasaporte[,1]))
georefmeth<-data.frame(pasaporte$ACCENUMB,pasaporte$GEOREFMETH)
georefmeth<-data.frame(georefmeth,GEOREFMETH1)
colnames(georefmeth)[1]<-"ACCENUMB"
colnames(georefmeth)[2]<-"GEOREFMETH"
for(i in 1:length(georefmeth[,1])){
  georefmeth[i,3]<-ifelse(georefmeth[i,2]==100,3,
                          ifelse(georefmeth[i,2]==200,2,
                                 ifelse(georefmeth[i,2]==300|georefmeth[i,2]==400|georefmeth[i,2]==500,1,0)))
}
georefmeth<-georefmeth[,c(1,3)]
}
write("28.COORQUAL-Obtenci?n subpar?metro GEOREFMETH", file="Error/process_info.txt", append=TRUE)
#Determinaci?n final de COORQUAL (a partir de intertemp, errores, precis, georble)
if(nogeoref){
COORQUAL<-vector(mode="numeric",length = length(pasaporte[,1]))
COORQUAL[]<-0
COORQUAL<-data.frame(pasaporte$ACCENUMB,COORQUAL)
colnames(COORQUAL)[1]<-"ACCENUMB"
COORQUAL<-merge(COORQUAL,intertemp,by="ACCENUMB")
COORQUAL<-merge(COORQUAL,errores,by="ACCENUMB")
COORQUAL<-merge(COORQUAL,precis,by="ACCENUMB")
COORQUAL<-merge(COORQUAL,georble,by="ACCENUMB")
COORQUAL<-merge(COORQUAL,georefmeth,by="ACCENUMB")
for(i in 1:length(COORQUAL[,1]))
{
  if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==1&COORQUAL[i,7]==1)
  {
    COORQUAL[i,2]<-1
  }
  if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==2&COORQUAL[i,7]==1)
  {
    COORQUAL[i,2]<-2
  }
  if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==3&COORQUAL[i,7]==1)
  {
    COORQUAL[i,2]<-3
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==0)
  {
    COORQUAL[i,2]<-4
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==0)
  {
    COORQUAL[i,2]<-5
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==0)
  {
    COORQUAL[i,2]<-6
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==1)
  {
    COORQUAL[i,2]<-7
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==1)
  {
    COORQUAL[i,2]<-8
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==2)
  {
    COORQUAL[i,2]<-9
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==2)
  {
    COORQUAL[i,2]<-10
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==3)
  {
    COORQUAL[i,2]<-11
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==3)
  {
    COORQUAL[i,2]<-12
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,3]==0)
  {
    COORQUAL[i,2]<-13
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,3]==1)
  {
    COORQUAL[i,2]<-14
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,3]==2)
  {
    COORQUAL[i,2]<-15
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,3]==3)
  {
    COORQUAL[i,2]<-16
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==0&(COORQUAL[i,7]==2|COORQUAL[i,7]==3))
  {
    COORQUAL[i,2]<-17
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==1&(COORQUAL[i,7]==2|COORQUAL[i,7]==3))
  {
    COORQUAL[i,2]<-18
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==2&(COORQUAL[i,7]==2|COORQUAL[i,7]==3))
  {
    COORQUAL[i,2]<-19
  }
  if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==3&(COORQUAL[i,7]==2|COORQUAL[i,7]==3))
  {
    COORQUAL[i,2]<-20
  }
}
}

if(!nogeoref){
COORQUAL<-vector(mode="numeric",length = length(pasaporte[,1]))
COORQUAL<-data.frame(pasaporte$ACCENUMB,COORQUAL)
colnames(COORQUAL)[1]<-"ACCENUMB"
  COORQUAL<-merge(COORQUAL,intertemp,by="ACCENUMB")
  COORQUAL<-merge(COORQUAL,errores,by="ACCENUMB")
  COORQUAL<-merge(COORQUAL,precis,by="ACCENUMB")
  COORQUAL<-merge(COORQUAL,georble,by="ACCENUMB")
  for(i in 1:length(COORQUAL[,1]))
  {
    if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==1)
    {
      COORQUAL[i,2]<-1
    }
    if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==2)
    {
      COORQUAL[i,2]<-2
    }
    if(COORQUAL[i,4]==1&(COORQUAL[i,5]==0|COORQUAL[i,5]==1)&COORQUAL[i,6]==3)
    {
      COORQUAL[i,2]<-3
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==0)
    {
      COORQUAL[i,2]<-4
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==0)
    {
      COORQUAL[i,2]<-5
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==0)
    {
      COORQUAL[i,2]<-6
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==1)
    {
      COORQUAL[i,2]<-7
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==1)
    {
      COORQUAL[i,2]<-8
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==2)
    {
      COORQUAL[i,2]<-9
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==2)
    {
      COORQUAL[i,2]<-10
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&COORQUAL[i,6]==1&COORQUAL[i,3]==3)
    {
      COORQUAL[i,2]<-11
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==2&(COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==3)
    {
      COORQUAL[i,2]<-12
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,6]==0&COORQUAL[i,3]==0)
    {
      COORQUAL[i,2]<-13
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,6]==0&COORQUAL[i,3]==1)
    {
      COORQUAL[i,2]<-14
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,6]==0&COORQUAL[i,3]==2)
    {
      COORQUAL[i,2]<-15
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&COORQUAL[i,6]==0&COORQUAL[i,3]==3)
    {
      COORQUAL[i,2]<-16
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==0)
    {
      COORQUAL[i,2]<-17
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==1)
    {
      COORQUAL[i,2]<-18
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==2)
    {
      COORQUAL[i,2]<-19
    }
    if(COORQUAL[i,4]==1&COORQUAL[i,5]==3&(COORQUAL[i,6]==1|COORQUAL[i,6]==2|COORQUAL[i,6]==3)&COORQUAL[i,3]==3)
    {
      COORQUAL[i,2]<-20
    }
  }
}


#Adicion de COORQUAL a unitabla
unitabla<-merge(unitabla,COORQUAL,by="ACCENUMB",all.x=T)
FINAL<-unitabla[,c("ACCENUMB","DECLATITUDE","DECLONGITUDE","SUITQUAL","LOCALQUAL","COORQUAL")]
write("29.COORQUAL-Determinaci?n final de COORQUAL y adici?n del par?metro a Unitabla", file="Error/process_info.txt", append=TRUE)

########################
##PARAMETRO TOTALQUAL###
########################
if(local){
TOTALQUAL<-vector(mode="numeric",length = length(unitabla[,1]))
TOTALQUAL100<-vector(mode="numeric",length = length(unitabla[,1]))
FINAL<-data.frame(FINAL,cbind(TOTALQUAL,TOTALQUAL100))
for(i in 1:length(FINAL[,1]))
{
  FINAL[i,7]<-FINAL[i,4]+FINAL[i,5]+FINAL[i,6]
  FINAL[i,8]<-((FINAL[i,4]+FINAL[i,5]+FINAL[i,6])*100)/60
}
final<-FINAL[,c(1,7,8)]
unitabla<-merge(unitabla,final,by="ACCENUMB")
}

if(!local){
  TOTALQUAL<-vector(mode="numeric",length = length(unitabla[,1]))
  TOTALQUAL100<-vector(mode="numeric",length = length(unitabla[,1]))
  FINAL<-data.frame(FINAL,cbind(TOTALQUAL,TOTALQUAL100))
  for(i in 1:length(FINAL[,1]))
  {
    FINAL[i,7]<-FINAL[i,4]+FINAL[i,6]
    FINAL[i,8]<-((FINAL[i,4]+FINAL[i,6])*100)/40
  }
  final<-FINAL[,c(1,7,8)]
  unitabla<-unitabla[,1:75]
  unitabla<-merge(unitabla,final,by="ACCENUMB")
}
write("30.TOTALQUAL-Determinaci?n final de TOTALQUAL y TOTALQUAL100. Adici?n a tabla unitabla", file="Error/process_info.txt", append=TRUE)

###RESULTADOS###

#RESULTADO 2: TABLA PASAPORTE ORIGINAL + TOTALQUAL/TOTALQUAL100
if(local){
  pasaporte2<-merge(pasaporte,FINAL, by="ACCENUMB", all.x=T)
  pasaporte2[,23]<-pasaporte2[,ncol(pasaporte)+1]
  pasaporte2[,25]<-pasaporte2[,ncol(pasaporte)+2]
  pasaporte2<-pasaporte2[,c(-(ncol(pasaporte)+1),-(ncol(pasaporte)+2))]
  colnames(pasaporte2)[23]<-"DECLATITUDE"
  colnames(pasaporte2)[25]<-"DECLONGITUDE"
  pasaporte2<-pasaporte2[,c(2,1,3:(ncol(pasaporte2)))]
}
if(!local){
  pasaporte2<-merge(pasaporte,FINAL, by="ACCENUMB", all.x=T)
  pasaporte2[,23]<-pasaporte2[,ncol(pasaporte)+1]
  pasaporte2[,25]<-pasaporte2[,ncol(pasaporte)+2]
  pasaporte2<-pasaporte2[,c(-(ncol(pasaporte)+1),-(ncol(pasaporte)+2))]
  colnames(pasaporte2)[23]<-"DECLATITUDE"
  colnames(pasaporte2)[25]<-"DECLONGITUDE"
  pasaporte2<-pasaporte2[,c(2,1,3:(ncol(pasaporte2)))]
  pasaporte2$LOCALQUAL<-NA
}
write.table(pasaporte2, file=paste(resultados,"/PasaporteOriginalEvaluadoGEOQUAL.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(pasaporte2, file=paste(resultados,"/PasaporteOriginalEvaluadoGEOQUAL.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
#Creaci?n de tabla de estad?sticas
statmod <- function(x) { 
  z <- table(as.vector(x)) 
  names(z)[z == max(z)] 
}
if(local){ 
  Parameters<-c("SUITQUAL","LOCALQUAL","COORQUAL","TOTALQUAL","TOTALQUAL100")
  Mean<-c(mean(pasaporte2$SUITQUAL,na.rm=TRUE),mean(pasaporte2$LOCALQUAL,na.rm=TRUE),mean(pasaporte2$COORQUAL,na.rm=TRUE),mean(pasaporte2$TOTALQUAL,na.rm=TRUE),mean(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  mode1<-statmod(na.omit(pasaporte2$SUITQUAL))
  if(length(mode1)>1){
    mode1<-sample(mode1,1)
  }
  mode2<-statmod(na.omit(pasaporte2$LOCALQUAL))
  if(length(mode2)>1){
    mode2<-sample(mode2,1)
  }
  mode3<-statmod(na.omit(pasaporte2$COORQUAL))
  if(length(mode3)>1){
    mode3<-sample(mode3,1)
  }
  mode4<-statmod(na.omit(pasaporte2$TOTALQUAL))
  if(length(mode4)>1){
    mode4<-sample(mode4,1)
  }
  mode5<-statmod(na.omit(pasaporte2$TOTALQUAL100))
  if(length(mode5)>1){
    mode5<-sample(mode5,1)
  }
  Mode<-c(mode1,mode2,mode3,mode4,mode5)
  MaxValue<-c(max(pasaporte2$SUITQUAL,na.rm=TRUE),max(pasaporte2$LOCALQUAL,na.rm=TRUE),max(pasaporte2$COORQUAL,na.rm=TRUE),max(pasaporte2$TOTALQUAL,na.rm=TRUE),max(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  MinValue<-c(min(pasaporte2$SUITQUAL,na.rm=TRUE),min(pasaporte2$LOCALQUAL,na.rm=TRUE),min(pasaporte2$COORQUAL,na.rm=TRUE),min(pasaporte2$TOTALQUAL,na.rm=TRUE),min(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  StDevValue<-c(sd(pasaporte2$SUITQUAL,na.rm=TRUE),sd(pasaporte2$LOCALQUAL,na.rm=TRUE),sd(pasaporte2$COORQUAL,na.rm=TRUE),sd(pasaporte2$TOTALQUAL,na.rm=TRUE),sd(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  TotalAccessions<-c(NA,NA,NA,NA,length(pasaporte2$TOTALQUAL100))
  AccessionsAnalyzed<-c(NA,NA,NA,NA,length(na.omit(pasaporte2$TOTALQUAL100)))
  tablasum<-data.frame(Parameters,Mean,Mode,MaxValue,MinValue,StDevValue,TotalAccessions,AccessionsAnalyzed)
}
if(!local){ 
  Parameters<-c("SUITQUAL","COORQUAL","TOTALQUAL","TOTALQUAL100")
  Mean<-c(mean(pasaporte2$SUITQUAL,na.rm=TRUE),mean(pasaporte2$COORQUAL,na.rm=TRUE),mean(pasaporte2$TOTALQUAL,na.rm=TRUE),mean(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  Mode<-c(statmod(na.omit(pasaporte2$SUITQUAL)),statmod(na.omit(pasaporte2$COORQUAL)),statmod(na.omit(pasaporte2$TOTALQUAL)),statmod(na.omit(pasaporte2$TOTALQUAL100)))
  MaxValue<-c(max(pasaporte2$SUITQUAL,na.rm=TRUE),max(pasaporte2$COORQUAL,na.rm=TRUE),max(pasaporte2$TOTALQUAL,na.rm=TRUE),max(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  MinValue<-c(min(pasaporte2$SUITQUAL,na.rm=TRUE),min(pasaporte2$COORQUAL,na.rm=TRUE),min(pasaporte2$TOTALQUAL,na.rm=TRUE),min(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  StDevValue<-c(sd(pasaporte2$SUITQUAL,na.rm=TRUE),sd(pasaporte2$COORQUAL,na.rm=TRUE),sd(pasaporte2$TOTALQUAL,na.rm=TRUE),sd(pasaporte2$TOTALQUAL100,na.rm=TRUE))
  TotalAccessions<-c(NA,NA,NA,length(pasaporte2$TOTALQUAL100))
  AccessionsAnalyzed<-c(NA,NA,NA,length(na.omit(pasaporte2$TOTALQUAL100)))
  tablasum<-data.frame(Parameters,Mean,Mode,MaxValue,MinValue,StDevValue,TotalAccessions,AccessionsAnalyzed)
}
write.table(tablasum, file=paste(resultados,"/StatsSummaryGEOQUAL.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(tablasum, file=paste(resultados,"/StatsSummaryGEOQUAL.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")

write("31.Resultado2-Exportada tabla original m?s par?metros TOTALQUAL", file="Error/process_info.txt", append=TRUE)  
#RESULTADO 3: Tabla UNITABLA con todos los par?metros calculados (s?lo incluye entradas con coordenadas)

georefcol<-which(names(unitabla)=="GEOREFMETH1")
colnames(unitabla)[georefcol]<-"GEOREFM14"
write.table(unitabla, file=paste(resultados,"/tabla_de_analisisGEOQUAL.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(unitabla, file=paste(resultados,"/tabla_de_analisisGEOQUAL.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write("32.Resultado3-Exportada tabla con todos los par?metros y subpar?metros calculados m?s datos originales", file="Error/process_info.txt", append=TRUE)
#RESULTADO 4: Tabla UNITABLA en formato shapefile

geoqual<-SpatialPointsDataFrame(unitabla[,c(26,24)],unitabla)
proj4string(geoqual)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
geoqual<- st_as_sf(geoqual)
st_write(geoqual,dsn=paste(resultados),layer="ShapefilePuntosGEOQUAL",driver="ESRI Shapefile")
write("33.Resultado4-Exportado shapefile de puntos con tabla con todos los par?metros y subpar?metros", file="Error/process_info.txt", append=TRUE)

#RESULTADO 5: mapa en google maps

st_write(geoqual["TOTALQUAL100"],paste(resultados,"/mapa_puntos_google.kml",sep=""), layer="TOTALQUAL", driver="KML")
write("34- Exportada capa de puntos en kml para googlemaps/earth", file="Error/process_info.txt", append=TRUE)
write("35- FINAL", file="Error/process_info.txt", append=TRUE)
