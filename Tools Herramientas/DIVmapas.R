######################################################################
# Script  de la herramienta DIVmapas - DIVmapas Tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2021
######################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#C?MO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS L?NEAS DE ESTE SCRIPT Y DESPU?S HAGA CLICK EN EL BOT?N "RUN". LOS RESULTADOS LOS ENCONTRAR? DONDE LO INDIC? EN EL SCRIPT DE PAR?METROS

##########################################################################################################
##########################################################################################################
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write("______Herramienta/Tool DIVmapas________", file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("buffy:", buffy,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("tamp:", tamp,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("ecogeo:", ecogeo,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("bioclimsn:", bioclimsn,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("bioclimv:", bioclimv,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("edaphsn:", edaphsn,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("edaphv:", edaphv,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("geophyssn:", geophyssn,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
if(exists("geophys")){
  geophysv<-geophys
  rm(geophys)
}
write(paste("geophysv:", geophysv,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenotip:", phenotip,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenot:", phenot,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenotv:", phenotv,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genotip:", genotip,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genot:", genot,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("neigd:", neigd,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("csimilar:", csimilar,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("rgrid:", rgrid,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("buffer:", buffer,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("ecogeoclus:", ecogeoclus,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("ecogeoclustype:", ecogeoclustype,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("ecogeopca:", ecogeopca,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("ecogeopcaxe:", ecogeopcaxe,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenoclus:", phenoclus,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenoclustype:", phenoclustype,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenopca:", phenopca,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenopcaxe:", phenopcaxe,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("phenovarq:", phenovarq,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genoclus:", genoclus,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genoclustype:", genoclustype,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genopco:", genopco,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("genopcoaxe:", genopcoaxe,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("mantelt:", mantelt,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("mantelmeth:", mantelmeth,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("mentelper:", mantelper,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.DIVmapas.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

#Conversion pais upcase to lowercase
pais<-tolower(pais)

#Check del nombre del set de capas ecogeograficas en rdatamap
#Carga del pais
setwd(paste(ruta))
loadError<-FALSE
abcd<-try(load("lista.paises.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  Paises<-read.delim("lista.paises.txt")
}
rm(abcd)
rm(loadError)

pais2<-data.frame(pais)
colnames(pais2)[1]<-"Paises"

abcd<-merge(Paises,pais2,by="Paises",all.y=TRUE)

if(is.na(abcd[1,2])){
  stop("pais parameter introduced by the user is not the expected, please check lista_paises.xlsx file for the correct option",call.=FALSE)
}
rm(abcd)
rm(pais2)
#Creacion de directorios de resultados
setwd(paste(resultados))
if(ecogeo){
  dir.create(as.vector(paste("EcogeographicResults_",pais,sep="")))
  resultadosEcogeo<-paste(resultados,"/EcogeographicResults_",pais,sep="")
}
if(phenotip){
  dir.create(as.vector(paste("PhenotypicResults_",pais,sep="")))
  resultadosPheno<-paste(resultados,"/PhenotypicResults_",pais,sep="")
}
if(genotip){
  dir.create(as.vector(paste("GenotypicResults_",pais,sep="")))
  resultadosGeno<-paste(resultados,"/GenotypicResults_",pais,sep="")
}
if(ecogeoclus|ecogeopca|phenoclus|phenopca|genoclus|genopco){
  dir.create(as.vector(paste("ClassicMultivariateResults_",pais,sep="")))
  resultadosClassic<-paste(resultados,"/ClassicMultivariateResults_",pais,sep="")
}
if(mantelt){
  dir.create(as.vector(paste("MantelCorrelationResults_",pais,sep="")))
  resultadosMantel<-paste(resultados,"/MantelCorrelationResults_",pais,sep="")
}
#Desactivaciones
if(!ecogeo){
  ecogeoclus<-FALSE
  ecogeopca<-FALSE
}
if(!phenotip){
  phenoclus<-FALSE
  phenopca<-FALSE
}
if(!genotip){
  neigd<-FALSE
  genoclus<-FALSE
  genopco<-FALSE
}

#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO DIVmapas________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

write("1.Terminado proceso de determinaci?n de directorio de trabajo", file="Error/process_info.txt", append=TRUE)

#introduccion tabla de lista de paises y resoluciones de extraccion a elegir y traduccion

#Evitar error por load de lista.paises.RData
loadError<-FALSE
abcd<-try(load("lista.paises.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  Paises<-read.delim("lista.paises.txt")
}
rm(abcd)
rm(loadError)

pais<-data.frame(pais)
colnames(pais)[1]<-"Paises"
pais<-merge(Paises,pais,by="Paises",all.y=TRUE)
pais<-paste(pais[1,2])
pais<-tolower(pais)

#Condicional resol por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("resol.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  resol<-read.delim("resol.txt")
}
rm(abcd)
rm(loadError)

resol<-subset(resol,resolucion==paste(resol1))
resol<-as.character(resol[1,2])
write("2.Terminado proceso carga de tablas de lista de paises y resolucion", file="Error/process_info.txt", append=TRUE)
#activar paquetes ya instalados y necesarios
#Check e instalacion si a lugar
packages2<-vector()
if(system.file(package="sp")==""){
  packages2<-append(packages2,"sp")
}
if(system.file(package="raster")==""){
  packages2<-append(packages2,"raster")
}
if(system.file(package="maptools")==""){
  packages2<-append(packages2,"maptools")
}
if(system.file(package="rgdal")==""){
  packages2<-append(packages2,"rgdal")
}
if(system.file(package="dismo")==""){
  packages2<-append(packages2,"dismo")
}
if(system.file(package="cluster")==""){
  packages2<-append(packages2,"cluster")
}
if(system.file(package="ade4")==""){
  packages2<-append(packages2,"ade4")
}
if(system.file(package="labdsv")==""){
  packages2<-append(packages2,"labdsv")
}
if(system.file(package="vegan")==""){
  packages2<-append(packages2,"vegan")
}
if(system.file(package="rgeos")==""){
  packages2<-append(packages2,"rgeos")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}

#Carga de paquetes

library(sp)
library(raster)
library(maptools)
library(rgdal)
library(dismo)
library(cluster)
library(ade4)
library(labdsv)
library(vegan)
#library(ncdf)
library(rgeos)

write("4.Terminado proceso de carga de paquetes", file="Error/process_info.txt", append=TRUE)
#########################

#introducci?n de pasaporte
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
#introducci?n de datos fenot?picos/genot?picos (primera columna ACCENUMB, luego los descriptores)
if(phenotip){
  phenot12<-phenot
  phenot<-read.delim(paste("Pasaporte/",phenot,sep=""))
}
if(genotip){
  genot<-read.delim(paste("Pasaporte/",genot,sep=""))
}
write("5.Terminado proceso de carga de tablas originales de pasaporte, fenotipo y/o genotipo", file="Error/process_info.txt", append=TRUE)
#Selecci?n de pasaportes sobre el umbral de geoqual
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE)&!is.na(DECLONGITUDE))
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}
write("6.Terminado proceso de fijaci?n de umbral de TOTALQUAL", file="Error/process_info.txt", append=TRUE)
#Tabla coordenadas desde pasaporte y cruce con tablas con datos fenot?picos o genot?picos (eliminando datos sin coordenadas)
tabla<-pasaporte[,c(2,23,25)]
tablaccenum<-as.data.frame(tabla[,1])
colnames(tablaccenum)[1]<-"ACCENUMB"
if(phenotip){
  phenot<-merge(tablaccenum,phenot,by="ACCENUMB",all.x=TRUE)
}
if(genotip){
  genot<-merge(tablaccenum,genot,by="ACCENUMB",all.x=TRUE)
}
#Borrado NAs para datos genotipicos
if(genotip){
for (i in 2:length(genot[1,])){
  genot<-subset(genot,!is.na(genot[,i]))
}
}
write("7.Terminado proceso de creaci?n tablas accenumb+xy+datos (tablas genot y phenot)", file="Error/process_info.txt", append=TRUE)
#####################################################
#Extracci?n ecogeogr?fica
if (ecogeo){
  tabla1<-data.frame(tabla$ACCENUMB)
  colnames(tabla1)[1]<-"ACCENUMB"
  if(buffy){
    tamp<-tamp*0.008333
  }
  if(bioclimsn){
    ###BIOCLIM
    #carga de lista de variables
    if(vvv<=2019){
      bioclim<-read.delim("bioclim.txt")
    }
    if(vvv>2019){
      load("bioclim.RData")
    }
    #Elemento introducido por el usuario: bioclimv
    #Traducci?n de variables desde java a lista de variables
    bioclim2<-1:length(bioclimv)
    bioclimv<-as.data.frame(cbind(bioclim2,bioclimv))
    colnames(bioclimv)[2]<-"VARDESCR"
    bioclimv<-merge(bioclim,bioclimv, by="VARDESCR", all=F)
    bioclimv<-as.character(bioclimv[,3])
    #armado de stacks
    biocliml<-list()
    for(i in 1:length(bioclimv)){
      biocliml[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",bioclimv[i],".tif",sep=""))
    }
    bioclimstack<-do.call("stack",biocliml)
    #Extracci?n de informaci?n
    #bioclim?tica
    if(!buffy){
      bioclim<-extract(bioclimstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      bioclim<-extract(bioclimstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    bioclim<-data.frame(tabla[,1],bioclim)
    colnames(bioclim)[1]<-"ACCENUMB"
    #consolidaci?n tabla bioclim?tica
    ecogeot1<-merge(tabla1,bioclim,by="ACCENUMB",all.x=TRUE)
  }
  if(geophyssn){
    ###GEOPHYS
    if(vvv<=2019){
      geophys<-read.delim("geophys.txt")
    }
    if(vvv>2019){
      load("geophys.RData")
    }
    #Elemento introducido por el usuario: geophysv
    #Traducci?n de variables desde java a lista de variables
    geophys2<-1:length(geophysv)
    geophysv<-as.data.frame(cbind(geophys2,geophysv))
    colnames(geophysv)[2]<-"VARDESCR"
    geophysv<-merge(geophys,geophysv, by="VARDESCR", all=F)
    geophysv<-as.character(geophysv[,3])
    #armado de stacks
    geophysl<-list()
    for(i in 1:length(geophysv)){
      geophysl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",geophysv[i],".tif",sep=""))
    }
    geophysstack<-do.call("stack",geophysl)
    #Extracci?n de informaci?n
    #geof?sica
    if(!buffy){
      geophys<-extract(geophysstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      geophys<-extract(geophysstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    geophys<-data.frame(tabla[,1],geophys)
    colnames(geophys)[1]<-"ACCENUMB"
    #consolidaci?n tabla geof?sica
    ecogeot2<-merge(tabla1,geophys,by="ACCENUMB",all.x=TRUE,sort=FALSE)
  }
  if(edaphsn){
    ###EDAPHIC
    if(vvv<=2019){
      edaph<-read.delim("edaph.txt")
    }
    if(vvv>2019){
      load("edaph.RData")
    }
    #Elemento introducido por el usuario: edaphv
    edaph2<-1:length(edaphv)
    edaphv<-as.data.frame(cbind(edaph2,edaphv))
    colnames(edaphv)[2]<-"VARDESCR"
    edaphv<-merge(edaph,edaphv, by="VARDESCR", all=F)
    edaphv<-as.character(edaphv[,3])
    #armado de stacks
    edaphl<-list()
    for(i in 1:length(edaphv)){
      edaphl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",edaphv[i],".tif",sep=""))
    }
    edaphstack<-do.call("stack",edaphl)
    #Extracci?n de informaci?n
    #ed?fica
    if(!buffy){
      edaph<-extract(edaphstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      edaph<-extract(edaphstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    edaph<-data.frame(tabla[,1],edaph)
    colnames(edaph)[1]<-"ACCENUMB"
    #consolidaci?n tabla ed?fica
    ecogeot3<-merge(tabla1,edaph,by="ACCENUMB",all.x=TRUE)
  }
  #Tabla final ecogeot (bioclimsn edaphsn geophyssn)
  #usando los tres
  if(bioclimsn&edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando s?lo bioclim y edaph
  if(bioclimsn&edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando s?lo bioclim y geophys
  if(bioclimsn&!edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
  }
  #Usando s?lo geophys y edaph
  if(!bioclimsn&edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando s?lo bioclim
  if(bioclimsn&!edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
  }
  #usando s?lo edaph
  if(!bioclimsn&edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando s?lo geophys
  if(!bioclimsn&!edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
  }
  #Exportando tabla ecogeot
  write.table(ecogeot, file = paste(resultadosEcogeo,"/TablaVarEcogeograficas",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(ecogeot, file = paste(resultadosEcogeo,"/TablaVarEcogeograficas",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
}
write("8.Terminado proceso de extracci?n informaci?n ecogeogr?fica", file="Error/process_info.txt", append=TRUE)
#########################################
#creaci?n de mallas
#Traducci?n de la resoluci?n de kil?metros a grados decimales
#Evitar error por load de tablaGRIDres.RData
loadError<-FALSE
abcd<-try(load("tablaGRIDres.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  tablaGRIDres<-read.delim("tablaGRIDres.txt")
}
rm(abcd)
rm(loadError)

tablaGRIDres<-subset(tablaGRIDres,grid==paste(rgrid))
tablaGRIDres<-tablaGRIDres[1,2]
#creacion spatialPointsDataframe con los sitios de recolecci?n
puntos<-SpatialPoints(tabla[,c(3,2)], proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
#creaci?n del raster sobre los buffers desde los puntos
influ<-circles(puntos,d=as.numeric(paste(buffer))*1000,lonlat=TRUE)
influ<-influ@polygons
#area de influencia total
malla<-raster(influ)
res(malla)<-as.numeric(paste(tablaGRIDres))
malla<-extend(malla,extent(malla)+(as.numeric(paste(tablaGRIDres))*10))
projection(malla)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
values(malla)<-1:(malla@ncols*malla@nrows)
#asignar ID a cada celda
malla<-mask(malla,influ)
##############################
#Creaci?n de vecindarios
##############################
#preparaci?n tabla de centroides de celdas con sus coord
centroides<-data.frame(xyFromCell(malla, c(1:length(malla@data@values))))
cellID<-1:length(malla@data@values)
centroides<-cbind(cellID,centroides)
rm(cellID)
centroides<-subset(centroides,!is.na(cellID))
centroideSp<-SpatialPoints(centroides[,c(2,3)], proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
#ahora si vecindarios
tablafin<-list()
for(i in 1:nrow(centroides)){
  circulo<-circles(centroideSp[i,],d=as.numeric(paste(buffer))*1000,lonlat=TRUE)
  circulo<-circulo@polygons
  circulo@proj4string<-CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  tablafin[[i]]<-over(puntos,circulo)
  tablafin[[i]]<-tabla[!is.na(tablafin[[i]]),]
  group<-rep(centroides[i,1],length(tablafin[[i]][,1]))
  tablafin[[i]]<-data.frame(group,tablafin[[i]])
}
tablafin<-do.call("rbind",tablafin)
tablafrec<-data.frame(table(tablafin[,1]))
colnames(tablafrec)[1]<-"cellID"
grupofrec<-merge(centroides,tablafrec,by="cellID",all.y=TRUE)
grupofrec<-subset(grupofrec,!is.na(Freq))
#Creacion de mapa con valores promedio
mapafrec<-rasterize(grupofrec[,c("x","y")],malla,grupofrec[,4],fun=max)
crs(mapafrec)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
writeRaster(mapafrec,filename=paste(resultados,"/mapa_neighborhood_size.grd",sep=""),overwrite=T,datatype='FLT4S')
writeRaster(mapafrec,filename=paste(resultados,"/mapa_neighborhood_size.tif",sep=""),overwrite=T,datatype='FLT4S')
rm(tablafrec)
rm(grupofrec)
rm(mapafrec)


#####################################
##An?lisis de diversidad
#Ecogeogr?fica
if(ecogeo){
  if(latitud&longitud){
    colnames(ecogeot)[2]<-"Y"
    colnames(ecogeot)[3]<-"X"
  }
  if(latitud&!longitud){
    ecogeot<-ecogeot[,-3]
    colnames(ecogeot)[2]<-"Y"
  }
  if(!latitud&longitud){
    ecogeot<-ecogeot[,-2]
    colnames(ecogeot)[2]<-"X"
  }
  if(!latitud&!longitud){
    ecogeot<-ecogeot[,c(-2,-3)]
  }
  write("9.1 Terminado tabla con o sin LatLong", file="Error/process_info.txt", append=TRUE)
  #borrado de entradas con extracciones ecogeo NA
  for(i in 1:length(ecogeot[,1])){
    if(all(is.na(ecogeot[i,2:length(ecogeot[1,])]))){
      write("Existen entradas cuyas coordenadas no extraen informaci?n en ninguna de las capas solicitadas", file="Error/process_info.txt", append=TRUE)
      ecogeot<-ecogeot[-i,]
    }
  }
  write("9.2 Terminado eliminaci?n entradas cuya extracci?n para todas variables ecogeo fue NA", file="Error/process_info.txt", append=TRUE)
  #tabla que entra a distancia  
  ecogeot1<-merge(tablafin,ecogeot,by="ACCENUMB")
  #aqu? se ordena por el ID del grupo o de la celda del mapa
  i <- order(ecogeot1$group)
  ecogeot1 <- ecogeot1[i,]
  write("9.3 Terminado asignaci?n variables ecogeo a grupos de influencia", file="Error/process_info.txt", append=TRUE)
  grupos<-unique(ecogeot1[,2])
  #Determinaci?n de distancias de cada grupo funci?n daisy
  distecogeo<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
  distecogeo<-cbind(grupos,distecogeo)
  colnames(distecogeo)[2]<-"DistPromedio"
  for(i in 1:length(grupos)){
    j<-grupos[i]
    dmatrix<-subset(ecogeot1,group==j)
    dist<-as.matrix(daisy(dmatrix[,5:length(ecogeot1[1,])],metric="euclidean",stand=TRUE))
    if(dim(dist)[1]==1){
      distecogeo[i,2]<-0
    }
    if(dim(dist)[1]>1){
      distecogeo[i,2]<-sum(dist)/(dim(dist)[1]^2-dim(dist)[1])
    }
  }
  write("9.4 Terminado determinaci?n de distancia ecogeo promedio por grupo", file="Error/process_info.txt", append=TRUE)
  i <- order(distecogeo$grupos)
  distecogeo <- distecogeo[i,]
  
  grupo2ras<-merge(centroides,distecogeo,by.x="cellID",by.y="grupos",all.y=TRUE)
  grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
  #Creacion de mapa con valores promedio
  mapaecogeo<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
  crs(mapaecogeo)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  
  #creaci?n mapa sin ceros
  grupo3ras<-subset(grupo2ras,DistPromedio!=0)
  mapaecogeoW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
  crs(mapaecogeoW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  writeRaster(mapaecogeoW0,filename=paste(resultadosEcogeo,"/mapadiv_ecogeoW0_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaecogeoW0,filename=paste(resultadosEcogeo,"/mapadiv_ecogeoW0_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  rm(mapaecogeoW0)
  rm(grupo3ras)

  write("9.5 Terminado rasterizaci?n de mapa dist prom ecogeo", file="Error/process_info.txt", append=TRUE)
  #exportando mapa
  #formato google earth
  KML(mapaecogeo,file=paste(resultadosEcogeo,"/mapadiv_ecogeo_",pais,".kml",sep=""),overwrite=T)
  #formato DIVA
  writeRaster(mapaecogeo,filename=paste(resultadosEcogeo,"/mapadiv_ecogeo_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaecogeo,filename=paste(resultadosEcogeo,"/mapadiv_ecogeo_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  #estadisticas
  Mean<-cellStats(mapaecogeo,stat="mean")
  STdev<-cellStats(mapaecogeo,stat="sd")
  Max<-cellStats(mapaecogeo,stat="max")
  Min<-cellStats(mapaecogeo,stat="min")
  Nacces<-nrow(ecogeot)
  stats_mapa_ecogeo<-data.frame(Nacces,Mean,STdev,Max,Min)
  write.table(stats_mapa_ecogeo, file=paste(resultadosEcogeo,"/tabla_estadisticas_mapadiv_ecogeo.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(stats_mapa_ecogeo, file=paste(resultadosEcogeo,"/tabla_estadisticas_mapadiv_ecogeo.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("9.6 Terminado exportaci?n productos ecogeo", file="Error/process_info.txt", append=TRUE)
  rm(mapaecogeo)
}

#####################################
##An?lisis de diversidad
#fenot?pica
if(phenotip){
  write("10.1 Iniciando analisis fenot?pico", file="Error/process_info.txt", append=TRUE)
  #carga tabla conversion tipo de variable
  #Evitar error por load de tablavar.RData
  loadError<-FALSE
  abcd<-try(load("tablavar.RData"),silent=TRUE)
  loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
  if(loadError){
    tablavar<-read.delim("tablavar.txt")
  }
  rm(abcd)
  rm(loadError)
  
  #carga tabla tipo de variable por usuario
  varphenot<-read.delim(paste("Pasaporte/",phenotv,sep=""))
  write("10.2 Terminado carga de tablas de conversi?n y tipo de variables", file="Error/process_info.txt", append=TRUE)
  #conversi?n
  varphenot<-merge(varphenot,tablavar,by.x="NATVAR",by.y="TIPVAR",all.x=TRUE)
  i <- order(varphenot$ID)
  varphenot<- varphenot[i,]
  #conversi?n de tipos de variables a la naturaleza de las variables para daisy
  phenotx<-list()
  phenotx[[1]]<-phenot[,1]
  for (i in 1:length(varphenot[,1])){
    if(varphenot[i,5]=="as.numeric"){
      aaa<-as.numeric(phenot[,i+1])
    }
    if(varphenot[i,5]=="as.factor"){
      aaa<-as.factor(phenot[,i+1])
    }
    if(varphenot[i,5]=="as.ordered"){
      aaa<-as.ordered(phenot[,i+1])
    }
    phenotx[[i+1]]<-aaa
  }
  phenotx<-do.call("data.frame",phenotx)
  colnames(phenotx)<-colnames(phenot)
  phenot<-phenotx
  rm(phenotx)
  
  phenot1<-merge(tablafin,phenot,by="ACCENUMB")
  i <- order(phenot1$group)
  phenot1 <- phenot1[i,]
  grupos<-unique(phenot1[,2])
  write("10.3 Terminado conversi?n del tipo de la variables phenot a la naturaleza que pide gower", file="Error/process_info.txt", append=TRUE)
  #tipos ?nicos de variables
  typesv<-paste(unique(varphenot$NATVAR),sep="")
  
  ######################################
  #1
  #Si hay variables binarias sim?tricas y asim?tricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    binsimetric<-subset(varphenot,NATVAR=="Binario simetrico",select=NOMVAR)
    binsimetric<-binsimetric$NOMVAR
    binasimetric<-subset(varphenot,NATVAR=="Binario asimetrico",select=NOMVAR)
    binasimetric<-binasimetric$NOMVAR
    #Determinaci?n de distancias de cada grupo funci?n daisy
    distphenot<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
    distphenot<-cbind(grupos,distphenot)
    colnames(distphenot)[2]<-"DistPromedio"
    for(i in 1:length(grupos)){
      j<-grupos[i]
      dmatrix<-subset(phenot1,group==j)
      dist<-as.matrix(daisy(dmatrix[,5:length(phenot1[1,])],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric))))
      if(dim(dist)[1]==1){
        distphenot[i,2]<-0
      }
      if(dim(dist)[1]>1){
        distphenot[i,2]<-sum(dist)/(dim(dist)[1]^2-dim(dist)[1])
      }
    }
    i <- order(distphenot$grupos)
    distphenot <- distphenot[i,]
  
    grupo2ras<-merge(centroides,distphenot,by.x="cellID",by.y="grupos",all.y=TRUE)
    grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
    #Creacion de mapa con valores promedio
    mapaphenot<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
    crs(mapaphenot)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    
    #creaci?n mapa sin ceros
    grupo3ras<-subset(grupo2ras,DistPromedio!=0)
    mapaphenotW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
    crs(mapaphenotW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    rm(mapaphenotW0)
    rm(grupo3ras)
    
    #exportando mapa
    #formato google earth
    KML(mapaphenot,file=paste(resultadosPheno,"/mapadiv_phenot_",pais,".kml",sep=""),overwrite=T)
    #formato DIVA
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    #estadisticas
    Mean<-cellStats(mapaphenot,stat="mean")
    STdev<-cellStats(mapaphenot,stat="sd")
    Max<-cellStats(mapaphenot,stat="max")
    Min<-cellStats(mapaphenot,stat="min")
    Nacces<-nrow(phenot)
    stats_mapa_phenot<-data.frame(Nacces,Mean,STdev,Max,Min)
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    rm(mapaphenot)
  }
  write("10.45 Terminado distancias y esportaci?n mapa phenot si hay binarias sim y asim", file="Error/process_info.txt", append=TRUE)
  ##################################
  #2
  #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    binsimetric<-subset(varphenot,NATVAR=="Binario simetrico",select=NOMVAR)
    binsimetric<-binsimetric$NOMVAR
    #Determinaci?n de distancias de cada grupo funci?n daisy
    distphenot<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
    distphenot<-cbind(grupos,distphenot)
    colnames(distphenot)[2]<-"DistPromedio"
    for(i in 1:length(grupos)){
      j<-grupos[i]
      dmatrix<-subset(phenot1,group==j)
      dist<-as.matrix(daisy(dmatrix[,5:length(phenot1[1,])],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric))))
      if(dim(dist)[1]==1){
        distphenot[i,2]<-0
      }
      if(dim(dist)[1]>1){
        distphenot[i,2]<-sum(dist)/(dim(dist)[1]^2-dim(dist)[1])
      }
    }
    i <- order(distphenot$grupos)
    distphenot <- distphenot[i,]
    
    grupo2ras<-merge(centroides,distphenot,by.x="cellID",by.y="grupos",all.y=TRUE)
    grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
    
    #Creacion de mapa con valores promedio
    mapaphenot<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
    crs(mapaphenot)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    #creaci?n mapa sin ceros
    grupo3ras<-subset(grupo2ras,DistPromedio!=0)
    mapaphenotW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
    crs(mapaphenotW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    rm(mapaphenotW0)
    rm(grupo3ras)
    
    #exportando mapa
    #formato google earth
    KML(mapaphenot,file=paste(resultadosPheno,"/mapadiv_phenot_",pais,".kml",sep=""),overwrite=T)
    #formato DIVA
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    
    #estadisticas
    Mean<-cellStats(mapaphenot,stat="mean")
    STdev<-cellStats(mapaphenot,stat="sd")
    Max<-cellStats(mapaphenot,stat="max")
    Min<-cellStats(mapaphenot,stat="min")
    Nacces<-nrow(phenot)
    stats_mapa_phenot<-data.frame(Nacces,Mean,STdev,Max,Min)
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    rm(mapaphenot)
    
  }
  write("10.45 Terminado distancias y esportaci?n mapa phenot si s?lo hay binarias sim", file="Error/process_info.txt", append=TRUE)
  #####################################
  #3
  #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    binasimetric<-subset(varphenot,NATVAR=="Binario asimetrico",select=NOMVAR)
    binasimetric<-binasimetric$NOMVAR
    
    #Determinaci?n de distancias de cada grupo funci?n daisy
    distphenot<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
    distphenot<-cbind(grupos,distphenot)
    colnames(distphenot)[2]<-"DistPromedio"
    for(i in 1:length(grupos)){
      j<-grupos[i]
      dmatrix<-subset(phenot1,group==j)
      dist<-as.matrix(daisy(dmatrix[,5:length(phenot1[1,])],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric))))
      if(dim(dist)[1]==1){
        distphenot[i,2]<-0
      }
      if(dim(dist)[1]>1){
        distphenot[i,2]<-sum(dist)/(dim(dist)[1]^2-dim(dist)[1])
      }
    }
    i <- order(distphenot$grupos)
    distphenot <- distphenot[i,]
    
    grupo2ras<-merge(centroides,distphenot,by.x="cellID",by.y="grupos",all.y=TRUE)
    grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
    #Creacion de mapa con valores promedio
    mapaphenot<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
    crs(mapaphenot)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    
    #creaci?n mapa sin ceros
    grupo3ras<-subset(grupo2ras,DistPromedio!=0)
    mapaphenotW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
    crs(mapaphenotW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    rm(mapaphenotW0)
    rm(grupo3ras)
    
    #exportando mapa
    #formato google earth
    KML(mapaphenot,file=paste(resultadosPheno,"/mapadiv_phenot_",pais,".kml",sep=""),overwrite=T)
    #formato DIVA
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    #estadisticas
    Mean<-cellStats(mapaphenot,stat="mean")
    STdev<-cellStats(mapaphenot,stat="sd")
    Max<-cellStats(mapaphenot,stat="max")
    Min<-cellStats(mapaphenot,stat="min")
    Nacces<-nrow(phenot)
    stats_mapa_phenot<-data.frame(Nacces,Mean,STdev,Max,Min)
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    rm(mapaphenot)
  }
  write("10.45 Terminado distancias y esportaci?n mapa phenot si s?lo hay binarias asim", file="Error/process_info.txt", append=TRUE)
  
  ##################################
  #4
  #si NO hay variables binarias
  if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
    
    #Determinaci?n de distancias de cada grupo funci?n daisy
    distphenot<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
    distphenot<-cbind(grupos,distphenot)
    colnames(distphenot)[2]<-"DistPromedio"
    for(i in 1:length(grupos)){
      j<-grupos[i]
      dmatrix<-subset(phenot1,group==j)
      dist<-as.matrix(daisy(dmatrix[,5:length(phenot1[1,])],metric="gower",stand=TRUE))
      if(dim(dist)[1]==1){
        distphenot[i,2]<-0
      }
      if(dim(dist)[1]>1){
        distphenot[i,2]<-sum(dist)/(dim(dist)[1]^2-dim(dist)[1])
      }
    }
    i <- order(distphenot$grupos)
    distphenot <- distphenot[i,]
    
    grupo2ras<-merge(centroides,distphenot,by.x="cellID",by.y="grupos",all.y=TRUE)
    grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
    #Creacion de mapa con valores promedio
    mapaphenot<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
    crs(mapaphenot)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    
    #creaci?n mapa sin ceros
    grupo3ras<-subset(grupo2ras,DistPromedio!=0)
    mapaphenotW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
    crs(mapaphenotW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenotW0,filename=paste(resultadosPheno,"/mapadiv_phenotW0_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    rm(mapaphenotW0)
    rm(grupo3ras)
    
    #exportando mapa
    #formato google earth
    KML(mapaphenot,file=paste(resultadosPheno,"/mapadiv_phenot_",pais,".kml",sep=""),overwrite=T)
    #formato DIVA
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(mapaphenot,filename=paste(resultadosPheno,"/mapadiv_phenot_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
    #estadisticas
    Mean<-cellStats(mapaphenot,stat="mean")
    STdev<-cellStats(mapaphenot,stat="sd")
    Max<-cellStats(mapaphenot,stat="max")
    Min<-cellStats(mapaphenot,stat="min")
    Nacces<-nrow(phenot)
    stats_mapa_phenot<-data.frame(Nacces,Mean,STdev,Max,Min)
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stats_mapa_phenot, file=paste(resultadosPheno,"/tabla_estadisticas_mapadiv_phenot.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    rm(mapaphenot)
  }
  write("10.45 Terminado distancias y esportaci?n mapa phenot sin variables binarias", file="Error/process_info.txt", append=TRUE)
}

#####################################
##An?lisis de diversidad
#genot?pica x distancia (d=sqrt(1-s))
if(genotip){
  write("11.1 Iniciando an?lisis genot?pico x distancia de datos binarios", file="Error/process_info.txt", append=TRUE)
  
  genot1<-merge(tablafin,genot,by="ACCENUMB")
  i <- order(genot1$group)
  genot1 <- genot1[i,]
  #Borrado de entradas NA
  for (i in 5:length(genot1[1,])){
    genot1<-subset(genot1,!is.na(genot1[,i]))
  }
  write("11.2 terminado fusi?n genot con tabla de grupos de influencia", file="Error/process_info.txt", append=TRUE)
  grupos<-unique(genot1[,2])
  
  #Determinaci?n de distancias de cada grupo funci?n daisy
  distgenot<-as.data.frame(matrix(nrow=length(grupos),ncol=1))
  distgenot<-cbind(grupos,distgenot)
  colnames(distgenot)[2]<-"DistPromedio"
  #Obtenci?n distancias
  for(i in 1:length(grupos)){
    j<-grupos[i]
    dmatrix<-subset(genot1,group==j)
    dist<-dist.binary(dmatrix[,5:length(genot1[1,])],method=csimilar)
    if(is.na(dist[1])){
      distgenot[i,2]<-0
    }
    if(!is.na(dist[1])){
      distgenot[i,2]<-mean(dist)
    }
  }
  
  write("11.3 terminado distancias genot por grupo de influencia", file="Error/process_info.txt", append=TRUE)
  i <- order(distgenot$grupos)
  distgenot <- distgenot[i,]
  grupo2ras<-merge(centroides,distgenot,by.x="cellID",by.y="grupos",all.y=TRUE)
  grupo2ras<-subset(grupo2ras,!is.na(DistPromedio))
  grupo3ras<-subset(grupo2ras,DistPromedio!=0)
  #Creacion de mapa con valores promedio
  mapa_GenotDistance<-rasterize(grupo2ras[,c("x","y")],malla,grupo2ras[,4],fun=mean)
  mapa_GenotDistanceW0<-rasterize(grupo3ras[,c("x","y")],malla,grupo3ras[,4],fun=mean)
  rm(grupo3ras)
  crs(mapa_GenotDistance)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  crs(mapa_GenotDistanceW0)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  write("11.4 terminado rasteriozaci?n mapa genot x distancia gower/jaccard", file="Error/process_info.txt", append=TRUE)
  
  #exportando mapa
  #formato google earth
  KML(mapa_GenotDistance,file=paste(resultadosGeno,"/mapadiv_GenotDistance_",pais,".kml",sep=""),overwrite=T)
  #formato DIVA
  writeRaster(mapa_GenotDistance,filename=paste(resultadosGeno,"/mapadiv_GenotDistance_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapa_GenotDistance,filename=paste(resultadosGeno,"/mapadiv_GenotDistance_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapa_GenotDistanceW0,filename=paste(resultadosGeno,"/mapadiv_GenotDistance_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapa_GenotDistanceW0,filename=paste(resultadosGeno,"/mapadiv_GenotDistance_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  #estadisticas
  Mean<-cellStats(mapa_GenotDistance,stat="mean")
  STdev<-cellStats(mapa_GenotDistance,stat="sd")
  Max<-cellStats(mapa_GenotDistance,stat="max")
  Min<-cellStats(mapa_GenotDistance,stat="min")
  Nacces<-nrow(genot)
  stats_mapa_GenotDistance<-data.frame(Nacces,Mean,STdev,Max,Min)
  write.table(stats_mapa_GenotDistance, file=paste(resultadosGeno,"/tabla_estadisticas_mapa_GenotDistance.txt",sep=""), sep = "\t", row.names=FALSE, qmethod = "double")
  write.table(stats_mapa_GenotDistance, file=paste(resultadosGeno,"/tabla_estadisticas_mapa_GenotDistance.xls",sep=""), sep = "\t", row.names=FALSE, qmethod = "double")
  write("11.5 terminado exportaci?n datos y mapas genot por distancia para datos binarios", file="Error/process_info.txt", append=TRUE)
  rm(mapa_GenotDistance)
  rm(mapa_GenotDistanceW0)
}

###############################################################################################################################
##An?lisis de distancia
#genot?pica x Nei's gene diversity
if(genotip&neigd){
  write("12.1 Nei: Iniciando an?lisis genot?pico por Nei's gene diversity", file="Error/process_info.txt", append=TRUE)
  genot2<-merge(tablafin,genot,by="ACCENUMB")
  i <- order(genot2$group)
  genot2 <- genot2[i,]
  genot2<-genot2[,c(-3,-4)]
  #borrado de entradas con NAs
  for (i in 3:length(genot2[1,])){
    genot2<-subset(genot2,!is.na(genot2[,i]))
  }
  grupos2<-as.data.frame(table(genot2[,2]))
  grupos2<-subset(grupos2,Freq>1)
  grupos2<-as.data.frame(grupos2[,1])
  colnames(grupos2)[1]<-"group"
  genot2<-merge(genot2,grupos2,by="group")
  genot2<-genot2[,c(2,1,3:length(genot2[1,]))]
  write("12.2 Nei: Terminada adecuaci?n datos genot?picos al formato AFLPdat", file="Error/process_info.txt", append=TRUE)
  
  #Determinaci?n de distancias de cada grupo funci?n daisy
  mat <- genot2
  manb <- dim(mat)[2]-2
  innb <- dim(mat)[1]
  mat <- mat[1:innb,]
  mat <- mat[order(mat[,2]),]
  pops <- as.vector(mat[,2])
  matm <- as.matrix(mat[,(3:(manb+2))])
  popsizes <- table (pops)
  npop <- length(popsizes)
  popnames <- vector(mode="character", npop)
  div <- matrix(NA, npop, 2)
  n <- 0
  for (i in 1:npop) {
    popmat <- (matm[(n + 1):(n + popsizes[i]), ])
    mode(popmat) <- "integer"
    freqs <- apply(popmat, 2, mean)
    div[i, 2] <- mean((1-(freqs^2+(1-freqs)^2)))*(popsizes[i]/(popsizes[i]-1))
    vari <- vector(mode="numeric", manb)
    for (j in 1:manb) {
      if (freqs[j]==0 | freqs[j]==1) vari[j] <- 0 else vari[j] <- 1} 
    div[i, 1] <- mean(vari)
    popnames[i] <- pops[n+1]
    n <- n + popsizes [i]
  }
  write("12.3 Terminado c?lculo Nei's gene distance por funci?n Diversity de AFLPdat", file="Error/process_info.txt", append=TRUE)
  div<-as.data.frame(div)
  popsizes<-as.data.frame(popsizes)
  popsizes<-as.numeric(popsizes[,2])
  popsizes<-data.frame(popsizes,div)
  div <- data.frame(popnames, popsizes)
  colnames(div)[1]<-"group"
  colnames(div)[3]<-"proportion of variable markers"
  colnames(div)[4]<-"gene diversity"
 
  grupo2ras2<-merge(centroides,div,by.x="cellID",by.y="group",all.y=TRUE)
  for (i in 1:length(grupo2ras2[,4])){
    grupo2ras2[i,4]<-ifelse(is.na(grupo2ras2[i,4]),1,grupo2ras2[i,4])
    grupo2ras2[i,5]<-ifelse(is.na(grupo2ras2[i,5]),0,grupo2ras2[i,5])
    grupo2ras2[i,6]<-ifelse(is.na(grupo2ras2[i,6]),0,grupo2ras2[i,6])
  }
  write("12.4 Terminado asignaci?n de Nei's gene diversity a cada grupo de influencia", file="Error/process_info.txt", append=TRUE)
  mapagenot_groupsize<-rasterize(grupo2ras2[,c("x","y")],malla,grupo2ras2[,4],fun=mean)
  crs(mapagenot_groupsize)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  mapagenot_propvarmark<-rasterize(grupo2ras2[,c("x","y")],malla,grupo2ras2[,5],fun=mean)
  crs(mapagenot_propvarmark)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  mapagenot_Neisgenediversity<-rasterize(grupo2ras2[,c("x","y")],malla,grupo2ras2[,6],fun=mean)
  crs(mapagenot_Neisgenediversity)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
  write("12.5 Terminado creaci?n mapas Nei's gene diversity", file="Error/process_info.txt", append=TRUE)
  #exportando mapa
  #formato google earth
  KML(mapagenot_Neisgenediversity,file=paste(resultadosGeno,"/mapadiv_NeisGeneDiversity_",pais,".kml",sep=""),overwrite=T)
  KML(mapagenot_propvarmark,file=paste(resultadosGeno,"/mapadiv_ProportionVariableMarkers_",pais,".kml",sep=""),overwrite=T)
  KML(mapagenot_groupsize,file=paste(resultadosGeno,"/mapadiv_groupsize_",pais,".kml",sep=""),overwrite=T)
  #formato DIVA
  writeRaster(mapagenot_Neisgenediversity,filename=paste(resultadosGeno,"/mapadiv_NeisGeneDiversity_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapagenot_Neisgenediversity,filename=paste(resultadosGeno,"/mapadiv_NeisGeneDiversity_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapagenot_groupsize,filename=paste(resultadosGeno,"/mapadiv_GroupSize_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapagenot_groupsize,filename=paste(resultadosGeno,"/mapadiv_GroupSize_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapagenot_propvarmark,filename=paste(resultadosGeno,"/mapadiv_ProportionVariableMarkers_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapagenot_propvarmark,filename=paste(resultadosGeno,"/mapadiv_ProportionVariableMarkers_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  #estadisticas
  Mean<-cellStats(mapagenot_Neisgenediversity,stat="mean")
  STdev<-cellStats(mapagenot_Neisgenediversity,stat="sd")
  Max<-cellStats(mapagenot_Neisgenediversity,stat="max")
  Min<-cellStats(mapagenot_Neisgenediversity,stat="min")
  Nacces<-nrow(genot)
  stats_mapa_NeiGeneDiversity<-data.frame(Nacces,Mean,STdev,Max,Min)
  write.table(stats_mapa_NeiGeneDiversity, file=paste(resultadosGeno,"/tabla_estadisticas_mapa_NeiGeneDiversity.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(stats_mapa_NeiGeneDiversity, file=paste(resultadosGeno,"/tabla_estadisticas_mapa_NeiGeneDiversity.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("12.6 Terminado exportaci?n de mapas Nei's gene diversity", file="Error/process_info.txt", append=TRUE)
  rm(mapagenot_groupsize)
  rm(mapagenot_Neisgenediversity)
  rm(mapagenot_propvarmark)
}

#######################################
#Exportar mapas de puntos (pasaporte)
puntosMap<-SpatialPointsDataFrame(pasaporte[,c(25,23)],pasaporte)
writeOGR(puntosMap,dsn=paste(resultados),layer="ShapefilePuntosPasaporte",driver="ESRI Shapefile")
proj4string(puntosMap)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
writeOGR(puntosMap["ACCENUMB"],dsn=paste(resultados,"/mapa_puntospas_google.kml",sep=""), layer="ACCENUMB", driver="KML")
write("13. Terminado creaci?n y exportaci?n mapas de puntos", file="Error/process_info.txt", append=TRUE)

############################################################################################################
#An?lisis agrupamientos cl?sico
############################################################################################################
#Ecogeogr?fico
if(ecogeoclus){
  ecogeodist<-daisy(ecogeot[,-1],metric="euclidean",stand=TRUE)
  ecogeodist<-hclust(ecogeodist,paste(ecogeoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_ecogeo.wmf")
  if(length(ecogeot[,1])>=200){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 0.3)
  }
  if(length(ecogeot[,1])>=50&length(ecogeot[,1])<200){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 0.5)
  }
  if(length(ecogeot[,1])<50){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.1 Terminado analisis agrupamientos ecogeo", file="Error/process_info.txt", append=TRUE)
}
if (ecogeopca){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  #PCA
  if(ecogeopcaxe>length(ecogeot[,-1])){
    ecogeopcaxe<-length(ecogeot[,-1])
  }
  ecogeopca<-dudi.pca(ecogeot[,-1],center=TRUE,scale=TRUE,scannf=FALSE,nf=ecogeopcaxe)
  variables<-colnames(ecogeot)[-1]
  accenumb<-ecogeot[,1]
  eigenvalues<-ecogeopca$eig
  eigenvectors<-ecogeopca$c1
  eigenvalues<-data.frame(1:length(eigenvalues),eigenvalues)
  colnames(eigenvalues)[1]<-"Component"
  variancet<-sum(eigenvalues[,2])
  variance<-vector(length=length(eigenvalues[,1]))
  var.accumul<-vector(length=length(eigenvalues[,1]))
  for (i in 1:length(eigenvalues[,1])){
    variance[i]<-(eigenvalues[i,2]*100)/variancet
    if(i==1){
      var.accumul[i]<-variance[i]
    }
    if(i>1){
      var.accumul[i]<-var.accumul[i-1]+variance[i]
    }
  }
  eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
  eigenvectors<-data.frame(variables,eigenvectors)
  pcascores<-data.frame(accenumb,ecogeopca$li)
  setwd(paste(resultadosClassic))
  write.table(eigenvalues,file="ecogeographic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvalues,file="ecogeographic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvectors,file="ecogeographic_eigenvectors.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvectors,file="ecogeographic_eigenvectors.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcascores,file="ecogeographic_pcascores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcascores,file="ecogeographic_pcascores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  #parte gr?fica
  win.metafile(file="pca_ecogeo.wmf")
  biplot(ecogeopca)
  dev.off()
  setwd(paste(ruta))
  write("14.2 Terminado analisis PCA ecogeo", file="Error/process_info.txt", append=TRUE)
}
#####################################
#Fenot?pico
if(phenoclus){
  phenot12<-read.delim(paste("Pasaporte/",phenot12,sep=""))
  #1
  #Si hay variables binarias sim?tricas y asim?tricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
  }
  #2
  #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
  }
  #3
  #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
  }
  #4
  #si NO hay variables binarias
  if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE)
  }
  #hierarchical clustering
  phenodist<-hclust(phenodist,paste(phenoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_fenotipico.wmf")
  if(length(phenot12[,1])>=200){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 0.3)
  }
  if(length(phenot12[,1])>=50&length(phenot12[,1])<200){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 0.5)
  }
  if(length(phenot12[,1])<50){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.3 Terminado analisis agrupamientos fenot?picos", file="Error/process_info.txt", append=TRUE)
}
if (phenopca){
  if(all(typesv=="Cuantitativo")){
    #Borrado de NA's
    phenot<-phenot[complete.cases(phenot),]
    #PCA
    if(phenopcaxe>length(phenot[,-1])){
      phenopcaxe<-length(phenot[,-1])
    }
    phenopca<-dudi.pca(phenot[,-1],center=TRUE,scale=TRUE,scannf=FALSE,nf=phenopcaxe)
    variables<-colnames(phenot)[-1]
    accenumb<-phenot[,1]
    eigenvalues<-phenopca$eig
    eigenvectors<-phenopca$c1
    eigenvalues<-data.frame(1:length(eigenvalues),eigenvalues)
    colnames(eigenvalues)[1]<-"Component"
    variancet<-sum(eigenvalues[,2])
    variance<-vector(length=length(eigenvalues[,1]))
    var.accumul<-vector(length=length(eigenvalues[,1]))
    for (i in 1:length(eigenvalues[,1])){
      variance[i]<-(eigenvalues[i,2]*100)/variancet
      if(i==1){
        var.accumul[i]<-variance[i]
      }
      if(i>1){
        var.accumul[i]<-var.accumul[i-1]+variance[i]
      }
    }
    eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
    eigenvectors<-data.frame(variables,eigenvectors)
    pcascores<-data.frame(accenumb,phenopca$li)
    setwd(paste(resultadosClassic))
    write.table(eigenvalues,file="phenotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvalues,file="phenotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvectors,file="phenotypic_eigenvectors.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvectors,file="phenotypic_eigenvectors.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcascores,file="phenotypic_pcascores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcascores,file="phenotypic_pcascores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    #parte gr?fica
    win.metafile(file="pca_pheno.wmf")
    biplot(phenopca)
    dev.off()
    setwd(paste(ruta))
    write("14.4 Terminado analisis PCA/PCoA fenot?pico", file="Error/process_info.txt", append=TRUE)
  }
  if(any(typesv!="Cuantitativo")){
    #Borrado de NA's
    phenot<-phenot[complete.cases(phenot),]
    #Distancias
    #1
    #Si hay variables binarias sim?tricas y asim?tricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
    }
    #2
    #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
    }
    #3
    #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE)
    }
    #PCO
    if(phenopcaxe>length(phenot[,-1])){
      phenopcaxe<-length(phenot[,-1])
    }
    phenotpco<-pco(phenodist,k=phenopcaxe)
    eigenvalues<-phenotpco$eig
    eigenvalues<-data.frame(c(1:length(phenot[,1])),eigenvalues)
    colnames(eigenvalues)[1]<-"Coordinate"
    variancet<-sum(eigenvalues[,2])
    variance<-vector(length=length(eigenvalues[,1]))
    var.accumul<-vector(length=length(eigenvalues[,1]))
    for (i in 1:length(eigenvalues[,1])){
      variance[i]<-(eigenvalues[i,2]*100)/variancet
      if(i==1){
        var.accumul[i]<-variance[i]
      }
      if(i>1){
        var.accumul[i]<-var.accumul[i-1]+variance[i]
      }
    }
    eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
    accenumb<-phenot[,1]
    pcoscores<-data.frame(accenumb,phenotpco$points)
    setwd(paste(resultadosClassic))
    write.table(eigenvalues,file="phenotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvalues,file="phenotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcoscores,file="phenotypic_pcoscores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcoscores,file="phenotypic_pcoscores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    #parte gr?fica
    win.metafile(file="pco_phenot.wmf")
    #Mete ahora lo que quieres que aparezcan en las gr?ficas, uno tras de otro
    plot(phenotpco,title="PCO for phenotypic characterization",pch=20)
    #Cierra el "device", despu?s de esto, lo que a?adas como plots o points no quedar?n reflejados en el png
    dev.off()
    setwd(paste(ruta))
    write("14.4 Terminado analisis PCA/PCoA fenot?pico", file="Error/process_info.txt", append=TRUE)
  }  
}
#####################################
#Genot?pico
if(genoclus){
  #Borrado de NA's
  genot<-genot[complete.cases(genot),]
  #Distancia
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #hierarchical clustering
  genodist<-hclust(genodist,paste(genoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_genotipico.wmf")
  if(length(genot[,1])>=200){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 0.3)
  }
  if(length(genot[,1])>=50&length(genot[,1])<200){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 0.5)
  }
  if(length(phenot[,1])<50){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.5 Terminado analisis agrupamientos genot?pico", file="Error/process_info.txt", append=TRUE)
}
if (genopco){
  #Borrado de NA's
  genot<-genot[complete.cases(genot),]
  #PCA
  if(genopcoaxe>length(genot[,-1])){
    genopcoaxe<-length(genot[,-1])
  }
  #Distancia
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #PCO
  genotpco<-pco(genodist,k=genopcoaxe)
  eigenvalues<-genotpco$eig
  eigenvalues<-data.frame(c(1:length(genot[,1])),eigenvalues)
  colnames(eigenvalues)[1]<-"Coordinate"
  variancet<-sum(eigenvalues[,2])
  variance<-vector(length=length(eigenvalues[,1]))
  var.accumul<-vector(length=length(eigenvalues[,1]))
  for (i in 1:length(eigenvalues[,1])){
    variance[i]<-(eigenvalues[i,2]*100)/variancet
    if(i==1){
      var.accumul[i]<-variance[i]
    }
    if(i>1){
      var.accumul[i]<-var.accumul[i-1]+variance[i]
    }
  }
  eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
  accenumb<-genot[,1]
  pcoscores<-data.frame(accenumb,genotpco$points)
  setwd(paste(resultadosClassic))
  write.table(eigenvalues,file="genotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvalues,file="genotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcoscores,file="genotypic_pcoscores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcoscores,file="genotypic_pcoscores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  #parte gr?fica
  win.metafile(file="pco_genot.wmf")
  #Mete ahora lo que quieres que aparezcan en las gr?ficas, uno tras de otro
  plot(genotpco,title="PCO for genotypic characterization",pch=20)
  #Cierra el "device", despu?s de esto, lo que a?adas como plots o points no quedar?n reflejados en el png
  dev.off()
  setwd(paste(ruta))
  write("14.6 Terminado analisis PCoA genot?pico", file="Error/process_info.txt", append=TRUE)
}

############################################################################################################
#Correlacione matriciales
############################################################################################################
#Ecogeogr?fico vs fenot?pico
if(ecogeo&phenotip){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  phenot<-phenot[complete.cases(phenot),]
  ecogeolist<-as.data.frame(ecogeot[,1])
  colnames(ecogeolist)[1]<-"ACCENUMB"
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  ecogeom<-merge(ecogeot,phenolist,by="ACCENUMB")
  phenom<-merge(phenot,ecogeolist,by="ACCENUMB")
  if(dim(ecogeom)[1]==dim(phenom)[1]){
    ecogeodist<-daisy(ecogeom[,-1],metric="euclidean",stand=TRUE)
    matriz.ecogeodist<-as.matrix(ecogeodist)
    colnames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    rownames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #1
    #Si hay variables binarias sim?tricas y asim?tricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #2
    #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #3
    #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE)
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    mantel.ecogeo.pheno<-mantel(ecogeodist,phenodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - ecogeographic vs. phenotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.ecogeo.pheno$method,mantel.ecogeo.pheno$statistic,mantel.ecogeo.pheno$signif,mantel.ecogeo.pheno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"M?todo"
    colnames(tablamantel)[3]<-"Estad?stico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"N?mero permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_phenotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_phenotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.1 Terminado analisis Mantel ecogeo vs phenotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(ecogeom)[1]==dim(phenom)[1]){
    write("Error en Mantel: Diferente n?mero de entradas analizadas entre ecogeograf?a y fenotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#Ecogeogr?fico vs genot?pico
if(ecogeo&genotip){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  genot<-genot[complete.cases(genot),]
  ecogeolist<-as.data.frame(ecogeot[,1])
  colnames(ecogeolist)[1]<-"ACCENUMB"
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  ecogeom<-merge(ecogeot,genolist,by="ACCENUMB")
  genom<-merge(genot,ecogeolist,by="ACCENUMB")
  if(dim(ecogeom)[1]==dim(genom)[1]){
    ecogeodist<-daisy(ecogeom[,-1],metric="euclidean",stand=TRUE)
    #Exportar
    matriz.ecogeodist<-as.matrix(ecogeodist)
    colnames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    rownames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Genotip
    genodist<-dist.binary(genom[,-1],method=csimilar)
    #Exportar
    matriz.genodist<-as.matrix(genodist)
    colnames(matriz.genodist)<-genom$ACCENUMB
    rownames(matriz.genodist)<-genom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Mantel
    mantel.ecogeo.geno<-mantel(ecogeodist,genodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - ecogeographic vs. genotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.ecogeo.geno$method,mantel.ecogeo.geno$statistic,mantel.ecogeo.geno$signif,mantel.ecogeo.geno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"M?todo"
    colnames(tablamantel)[3]<-"Estad?stico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"N?mero permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_genotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_genotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.2 Terminado analisis Mantel ecogeo vs genotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(ecogeom)[1]==dim(genom)[1]){
    write("Error en Mantel: Diferente n?mero de entradas analizadas entre ecogeograf?a y genotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#Genot?pico vs fenot?pico
if(genotip&phenotip){
  #Borrado de NA's
  phenot<-phenot[complete.cases(phenot),]
  genot<-genot[complete.cases(genot),]
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  genom<-merge(genot,phenolist,by="ACCENUMB")
  phenom<-merge(phenot,genolist,by="ACCENUMB")
  if(dim(genom)[1]==dim(phenom)[1]){
    genodist<-dist.binary(genom[,-1],method=csimilar)
    #Exportar
    matriz.genodist<-as.matrix(genodist)
    colnames(matriz.genodist)<-genom$ACCENUMB
    rownames(matriz.genodist)<-genom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #1
    #Si hay variables binarias sim?tricas y asim?tricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #2
    #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #3
    #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE)
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    mantel.geno.pheno<-mantel(genodist,phenodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - genotypic vs. phenotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.geno.pheno$method,mantel.geno.pheno$statistic,mantel.geno.pheno$signif,mantel.geno.pheno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"M?todo"
    colnames(tablamantel)[3]<-"Estad?stico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"N?mero permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_genotypic_Vs_phenotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_genotypic_Vs_phenotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.3 Terminado analisis Mantel genotypic vs phenotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(genom)[1]==dim(phenom)[1]){
    write("Error en Mantel: Diferente n?mero de entradas analizadas entre genotipo y fenotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#fenot?pico vs geogr?fico
if(phenotip){
  phenot<-phenot[complete.cases(phenot),]
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  geogra1<-pasaporte[,c(2,25,23)]
  geogra1<-merge(geogra1,phenolist,by="ACCENUMB",all.y=TRUE)
  geogra2<-daisy(geogra1[,-1],metric="euclidean",stand=FALSE)
  #Exporta
  matriz.geogra<-as.matrix(geogra2)
  colnames(matriz.geogra)<-geogra1$ACCENUMB
  rownames(matriz.geogra)<-geogra1$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Distancia pheno
  #1
  #Si hay variables binarias sim?tricas y asim?tricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #2
  #si hay s?lo variables binarias sim?tricas (sin asim?tricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #3
  #si hay s?lo variables binarias asim?tricas (sin sim?tricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #4
  #si NO hay variables binarias
  if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE)
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  mantel.pheno.geo<-mantel(phenodist,geogra2,method=paste(mantelmeth),permutations=mantelper)
  t1<-"Mantel matrix correlation - phenotypic vs. geographic"
  tablamantel<-as.data.frame(cbind(t1,mantel.pheno.geo$method,mantel.pheno.geo$statistic,mantel.pheno.geo$signif,mantel.pheno.geo$permutations))
  colnames(tablamantel)[1]<-"Componentes comparados"
  colnames(tablamantel)[2]<-"M?todo"
  colnames(tablamantel)[3]<-"Estad?stico de Mantel"
  colnames(tablamantel)[4]<-"significancia"
  colnames(tablamantel)[5]<-"N?mero permutaciones"
  setwd(paste(resultadosMantel))
  write.table(tablamantel,file="Mantel_phenotypic_Vs_geographic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablamantel,file="Mantel_phenotypic_Vs_geographic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  write("15.4 Terminado analisis Mantel phenotypic vs geographic", file="Error/process_info.txt", append=TRUE)
}

#Genot?pico vs geogr?fico
if(genotip){
  genot<-genot[complete.cases(genot),]
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  geogra1<-pasaporte[,c(2,25,23)]
  geogra1<-merge(geogra1,genolist,by="ACCENUMB",all.y=TRUE)
  geogra2<-daisy(geogra1[,-1],metric="euclidean",stand=FALSE)
  #Exporta
  matriz.geogra<-as.matrix(geogra2)
  colnames(matriz.geogra)<-geogra1$ACCENUMB
  rownames(matriz.geogra)<-geogra1$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Genodist
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #Exportar
  matriz.genodist<-as.matrix(genodist)
  colnames(matriz.genodist)<-genot$ACCENUMB
  rownames(matriz.genodist)<-genot$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Mantel
  mantel.geno.geo<-mantel(genodist,geogra2,method=paste(mantelmeth),permutations=mantelper)
  t1<-"Mantel matrix correlation - genotypic vs. geographic"
  tablamantel<-as.data.frame(cbind(t1,mantel.geno.geo$method,mantel.geno.geo$statistic,mantel.geno.geo$signif,mantel.geno.geo$permutations))
  colnames(tablamantel)[1]<-"Componentes comparados"
  colnames(tablamantel)[2]<-"M?todo"
  colnames(tablamantel)[3]<-"Estad?stico de Mantel"
  colnames(tablamantel)[4]<-"significancia"
  colnames(tablamantel)[5]<-"N?mero permutaciones"
  setwd(paste(resultadosMantel))
  write.table(tablamantel,file="Mantel_genotypic_Vs_geographic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablamantel,file="Mantel_genotypic_Vs_geographic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  write("15.5 Terminado analisis Mantel genotypic vs geographic", file="Error/process_info.txt", append=TRUE)
}
  
  