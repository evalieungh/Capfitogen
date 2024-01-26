#####################################################################
# Script  de la herramienta SelecVIF - SelecVIF tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2021
#####################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS L?NEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRARA DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
##########################################################################################################
#Parametros
#Usar? tabla previa de par?metros

setwd(paste(ruta))
tablaparametros<-read.delim(paste("ModelOptions/",partablename,sep=""))
pais<-paste(tablaparametros[2,2])
pasaporte<-paste(tablaparametros[3,2])
geoqual<-as.logical(paste(tablaparametros[4,2]))
totalqual<-as.numeric(paste(tablaparametros[5,2]))
distdup<-as.numeric(paste(tablaparametros[6,2]))
resol1<-paste(tablaparametros[7,2])
variabv<-paste(tablaparametros[8,2])
if(paste(tablaparametros[9,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[9,2]))
}
if(paste(tablaparametros[10,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[10,2]))
}
if(paste(tablaparametros[11,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[11,2]))
}
if(paste(tablaparametros[12,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[12,2]))
}
if(paste(tablaparametros[13,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[13,2]))
}
if(paste(tablaparametros[14,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[14,2]))
}
if(paste(tablaparametros[15,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[15,2]))
}
if(paste(tablaparametros[16,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[16,2]))
}
if(paste(tablaparametros[17,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[17,2]))
}
if(paste(tablaparametros[18,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[18,2]))
}
if(paste(tablaparametros[19,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[19,2]))
}
if(paste(tablaparametros[20,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[20,2]))
}
if(paste(tablaparametros[21,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[21,2]))
}
if(paste(tablaparametros[22,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[22,2]))
}
if(paste(tablaparametros[23,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[23,2]))
}
if(paste(tablaparametros[24,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[24,2]))
}
if(paste(tablaparametros[25,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[25,2]))
}
if(paste(tablaparametros[26,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[26,2]))
}
if(paste(tablaparametros[27,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[27,2]))
}
latitud<-as.logical(paste(tablaparametros[28,2]))
if(is.na(latitud)){
  latitud<-FALSE
}
longitud<-as.logical(paste(tablaparametros[29,2]))
if(is.na(longitud)){
  longitud<-FALSE
}
genero<-paste(tablaparametros[30,2])
especie<-paste(tablaparametros[31,2])
ntest<-as.numeric(paste(tablaparametros[32,2]))
ausencia<-paste(tablaparametros[33,2])
pasaporteb<-paste(tablaparametros[34,2])
pareps<-as.numeric(paste(tablaparametros[35,2]))
pansel<-as.numeric(paste(tablaparametros[36,2]))
pastrat<-paste(tablaparametros[37,2])
padiskmin<-as.numeric(paste(tablaparametros[38,2]))
padiskmax<-as.numeric(paste(tablaparametros[39,2]))
pasreq<-as.numeric(paste(tablaparametros[40,2]))
paelc<-paste(tablaparametros[41,2])
if(paste(tablaparametros[42,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[42,2]))
}
if(paste(tablaparametros[43,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[43,2]))
}
if(paste(tablaparametros[44,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[44,2]))
}
mapaelc<-paste(tablaparametros[45,2])
statelc<-paste(tablaparametros[46,2])
testNAs<-paste(tablaparametros[47,2])
cutoff<-as.numeric(paste(tablaparametros[48,2]))
dynamic<-paste(tablaparametros[49,2])
resultados<-paste(tablaparametros[50,2])

setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write("______Herramienta/Tool SelecVIF________", file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("variabv:", variabv,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("genero:", genero,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("especie:", especie,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("ntest:", ntest,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("ausencia:", ausencia,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pasaporteb:", pasaporteb,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pareps:", pareps,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pansel:", pansel,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pastrat:", pastrat,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("padiskmin:", padiskmin,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("padiskmax:", padiskmax,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("pasreq:", pasreq,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("paelc:", paelc,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("statelc:", statelc,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("testNAs:", testNAs,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("cutoff:", cutoff,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("dynamic:", dynamic,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.SelecVIF.txt", append=TRUE)

#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO SelecVIF________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

write("1.Terminado proceso de determinaci?n de directorio de trabajo", file="Error/process_info.txt", append=TRUE)
#introducci?n tabla de lista de pa?ses y resoluciones de extracci?n a elegir y traducci?n

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
if(system.file(package="biomod2")==""){
  packages2<-append(packages2,"biomod2")
}
if(system.file(package="car")==""){
  packages2<-append(packages2,"car")
}
if(system.file(package="plyr")==""){
  packages2<-append(packages2,"plyr")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}
library(sp)
library(raster)
library(maptools)
library(rgdal)
library(dismo)
library(cluster)
library(ade4)
library(labdsv)
#library(ncdf)
library(biomod2)
library(car)
library(plyr)

write("2.Terminado proceso de instalaci?n de paquetes", file="Error/process_info.txt", append=TRUE)
#activar paquetes ya instalados y necesarios

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

###########IntroDatos y Capas###############
#Intro data y limpieza
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
#Eliminaci?n entradas bajo umbral geoqual
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}

write("4.Terminado proceso de intro datos presencia", file="Error/process_info.txt", append=TRUE)


#Pasaporte sin duplicados espaciales
if (mean(pasaporte$DECLATITUDE)<23&mean(pasaporte$DECLATITUDE> -23)){
  distdup1<-distdup*0.00833
}
if ((mean(pasaporte$DECLATITUDE)>23&mean(pasaporte$DECLATITUDE)<45)|(mean(pasaporte$DECLATITUDE)< -23&mean(pasaporte$DECLATITUDE)> -45)){
  distdup1<-distdup*0.00975
}
if ((mean(pasaporte$DECLATITUDE)>45&mean(pasaporte$DECLATITUDE)<67)|(mean(pasaporte$DECLATITUDE)< -45&mean(pasaporte$DECLATITUDE)> -67)){
  distdup1<-distdup*0.0127
}
if (mean(pasaporte$DECLATITUDE)>67|mean(pasaporte$DECLATITUDE)< -67){
  distdup1<-distdup*0.02299
}
#con este distdup1 se salta de aqu? a arreglo puntos en Modelizaci?n

#Intro pa?s y resoluci?n
#transformaci?n pais uppercase to lowercase
pais<-tolower(pais)
setwd(paste(ruta))
#Definici?n pa?s
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
#Definici?n resoluci?n
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
write("5.Terminado proceso de determinar pais y resol", file="Error/process_info.txt", append=TRUE)


#############################################################
#Extracci?n sobre capas de Presente
#############################################################
#Creaci?n capas lat/long si son requeridos
if(longitud){
  long<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
  long2<-rasterToPoints(long)
  long<-rasterize(long2[,c("x","y")],long,long2[,"x"])
  names(long)<-"longitude"
  rm(long2)
}

if(latitud){
  lat<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
  lat2<-rasterToPoints(lat)
  lat<-rasterize(lat2[,c("x","y")],lat,lat2[,"y"])
  names(lat)<-"latitude"
  rm(lat2)
}

write("6.Terminado proceso de crear capas lat/long", file="Error/process_info.txt", append=TRUE)

#Resto de variables
#Condicional figvartotal por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("figvartotal.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  figvartotal<-read.delim("figvartotal.txt")
}
rm(abcd)
rm(loadError)

variabv1<-as.data.frame(variabv)
colnames(variabv1)[1]<-"VARDESCR"
variabv1<-merge(figvartotal,variabv1, by="VARDESCR", all=FALSE)
variabv1<-as.character(variabv1[,3])

###Arreglo de un stack ?nico
#Sin lat/long
if(!latitud&!longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  expstack<-do.call("stack",explana)
}
#Con lat
if(latitud&!longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-lat
  expstack<-do.call("stack",explana)
}
#Con long
if(!latitud&longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-long
  expstack<-do.call("stack",explana)
}
#Con lat/long
if(latitud&longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-long
  explana[[totvar+2]]<-lat
  expstack<-do.call("stack",explana)
}
#Correccion de res y extent en soil y bioclim layers
elev<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
elevext<-extent(elev)
elevres<-res(elev)
#Evitar error por load de geophys, edaph y bioclim.RData
loadError<-FALSE
abcd<-try(load("edaph.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  edaph<-read.delim("edaph.txt")
}
rm(abcd)
rm(loadError)
loadError<-FALSE
abcd<-try(load("bioclim.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  bioclim<-read.delim("bioclim.txt")
}
rm(abcd)
rm(loadError)

aaa<-names(expstack)
bbb<-edaph[,"VARCODE"]
ccc<-bioclim[,"VARCODE"]
for(i in 1:length(aaa)){
  for(j in 1:length(bbb)){
    if(aaa[i]==bbb[j]){
      extent(expstack@layers[[i]])<-elevext
      res(expstack@layers[[i]])<-elevres
    }
  }
  for(k in 1:length(ccc)){
    if(aaa[i]==ccc[k]){
      extent(expstack@layers[[i]])<-elevext
      res(expstack@layers[[i]])<-elevres
    }
  }
}
rm(elev)
rm(elevext)
rm(elevres)
rm(edaph)
rm(bioclim)
rm(aaa)
rm(bbb)
rm(ccc)

write("6.5 Terminado proceso de carga de capas y stack presente", file="Error/process_info.txt", append=TRUE)

########################################################################
########################################################################
###########Data input y Model configuration#############################
###Arreglo puntos
puntos0<-pasaporte[,c("DECLONGITUDE","DECLATITUDE")]
#SpatialPoints para BIOMOD_FormatingData
puntos<-SpatialPoints(puntos0)
#SpatialPointsDataFrame para PA por ELCmapa
puntos0<-SpatialPointsDataFrame(puntos0,pasaporte)
#Remoci?n duplis
puntos<-remove.duplicates(puntos,zero=distdup1)
puntos0<-remove.duplicates(puntos0,zero=distdup1)
write("8.Terminado proceso remoci?n duplicados espaciales", file="Error/process_info.txt", append=TRUE)
##################################################################
#Remoci?n de puntos que no extraen info
#Validaci?n de que todos los puntos extraen y no quedar?n NAs
if(testNAs){
  testNAs<-data.frame(extract(expstack,puntos))
  xxx<-vector()
  for(i in 1:nrow(testNAs)){
    if(any(is.na(testNAs[i,c(1:ncol(testNAs))]))){
      puntos<-puntos[-i,]
      puntos0<-puntos0[-i,]
      xxx<-c(xxx,puntos0$ACCENUMB[i])
    }
  }
  write.table(xxx, file = paste(resultados,"/ACCENUMBwithoutExtraction.txt",sep=""), sep = "/t", row.names = FALSE, qmethod = "double")
  rm(testNAs)
  rm(xxx)
}

##################################################################
###Arreglo input para biomod y Dismo
if(ausencia=="absence"){
  setwd(paste(resultados))
  dir.create(as.vector(paste("Real_Absences_",genero,"_",especie,sep="")))
  resultadosabs<-paste(resultados,"/Real_Absences_",genero,"_",especie,sep="")
  setwd(paste(ruta))
  #Entrada Ausencias reales
  pasaporteb<-read.delim(paste("Pasaporte/",pasaporteb,sep=""))
  pasaporteb<-subset(pasaporteb,!is.na(DECLATITUDE))
  pasaporteb<-subset(pasaporteb,!is.na(DECLONGITUDE))
  #Eliminaci?n entradas bajo umbral geoqual
  if(geoqual){
    pasaporteb<-subset(pasaporteb,TOTALQUAL100>=totalqual)
  }
  #Remoci?n duplicados espaciales ausencias
  puntosb<-pasaporteb[,c("DECLONGITUDE","DECLATITUDE")]
  puntosb<-SpatialPointsDataFrame(puntosb,pasaporteb)
  puntosb<-remove.duplicates(puntosb,zero=distdup1)
  #Remoci?n duplicados germo sin evaluar
  if(ncol(puntos0@data)!=ncol(puntosb@data)){
    stop("Number of columns from presence and absence tables does not match")
  }
  PresAbsReal<-data.frame(rbind(puntos0@data,puntosb@data))
  PresAbs<-c(rep(1,length(puntos0)),rep(0,length(puntosb)))
  PresAbsReal<-data.frame(PresAbsReal,PresAbs)
  varres<-PresAbsReal[,"PresAbs"]
  puntos<-PresAbsReal[,c("DECLONGITUDE","DECLATITUDE")]
  #Ahora el formato BIOMOD_FormatingData ("inputs" para la parte figs)
  inputs<-BIOMOD_FormatingData(varres,expstack,resp.xy=puntos,
                               resp.name=paste(genero,especie,sep="."),na.rm=TRUE)
  #Tablas y shapefile de entrada de datos
  extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
  shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
  
  #Exportaci?n
  setwd(paste(resultadosabs))
  write.table(extract.table,file="extraction_table_PresAbs.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(extract.table,file="extraction_table_PresAbs.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  writeOGR(shapefile2,dsn=paste(resultadosabs),layer="Final_extraction_PresAbs",driver="ESRI Shapefile")
  #Reporte
  write(paste(), file="input_data.txt", append=TRUE)
  write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
  write(paste(), file="input_data.txt", append=TRUE)
  write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
  write(paste("Data introduced"), file="input_data.txt", append=TRUE)
  origsize<-nrow(pasaporte)
  write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
  origsize<-length(puntos)
  write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
  pressize<-length(which(inputs@data.species==1))
  write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
  envarsize<-length(inputs@data.env.var)
  write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
  write(paste(), file="input_data.txt", append=TRUE)
  setwd(paste(ruta))
}
#Pseudoausencias por ELC
if(ausencia=="pseudo absence"){
  if(pastrat=="elc"){
    #Creaci?n directorio en Resultados
    setwd(paste(resultados))
    dir.create(as.vector(paste("PseudoAbsences_ELC_",genero,"_",especie,sep="")))
    resultadospaelc<-paste(resultados,"/PseudoAbsences_ELC_",genero,"_",especie,sep="")
    setwd(paste(ruta))
    
    #Introducci?n y c?lculo de cuartiles en mapa completo ELC
    mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
    write("8.1.Terminado carga de mapa ELC formato paquete raster", file="Error/process_info.txt", append=TRUE)
    fmapaelc<-as.data.frame(freq(mapaelc,merge=TRUE))
    colnames(fmapaelc)[1]<-"ELC_CAT"
    colnames(fmapaelc)[2]<-"Frec_celdas"
    fmapaelc<-subset(fmapaelc,!is.na(fmapaelc[,1]))
    cuartil25<-quantile(fmapaelc[,2],probs=0.25,type=3)
    cuartil50<-quantile(fmapaelc[,2],probs=0.5,type=3)
    cuartil75<-quantile(fmapaelc[,2],probs=0.75,type=3)
    tablaclas<-data.frame(nrow=1,ncol=3)
    tablaclas[1,1]<-cuartil25
    colnames(tablaclas)[1]<-"25%"
    tablaclas[1,2]<-cuartil50
    colnames(tablaclas)[2]<-"50%"
    tablaclas[1,3]<-cuartil75
    colnames(tablaclas)[3]<-"75%"
    PorcentajeELC<-vector(length=length(fmapaelc$Frec_celdas))
    sumaELC<-sum(fmapaelc$Frec_celdas)
    ClasificacionMapaELC<-vector(length=length(fmapaelc$Frec_celdas))
    for(i in 1:length(fmapaelc$Frec_celdas)){
      ClasificacionMapaELC[i]<-ifelse(fmapaelc$Frec_celdas[i]==0,"nula/null",
                                      ifelse(fmapaelc$Frec_celdas[i]>0&fmapaelc$Frec_celdas[i]<=cuartil25,"baja/low",
                                             ifelse(fmapaelc$Frec_celdas[i]<=cuartil50,"media baja/mid-low",
                                                    ifelse(fmapaelc$Frec_celdas[i]<=cuartil75,"media alta/mid-high","alta/high"))))
      PorcentajeELC[i]<-(fmapaelc$Frec_celdas[i]*100)/sumaELC
    }
    elc<-cbind(fmapaelc,PorcentajeELC,ClasificacionMapaELC)
    #Extracci?n categor?a
    BGcat<-extract(mapaelc,puntos0)
    write("8.2.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    pasaporte2<-data.frame(puntos0,BGcat)
    setwd(paste(resultadospaelc))
    write.table(pasaporte2,file="Genbank_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte2,file="Genbank_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Intro de columna de categor?as
    statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
    statelc<-as.data.frame(statelc[,"ELC_CAT"])
    colnames(statelc)[1]<-"ELC_CAT"
    #Tablas de frecuencias desde pasaporte o BG
    BGfrec<-as.data.frame(table(pasaporte2[,"BGcat"]))
    colnames(BGfrec)[1]<-"ELC_CAT"
    colnames(BGfrec)[2]<-"BGfrec"
    #Asignaci?n a lista categor?as total
    statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
    for (i in 1:length(statelc$BGfrec)){
      if (is.na(statelc$BGfrec[i])){
        statelc$BGfrec[i]<-0
      }
    }
    #S?lo para frecuencias diferentes a cero (no nulas), c?lculo cuartil
    FrecTotal<-subset(statelc,BGfrec>0)  
    cuartil25<-quantile(FrecTotal$BGfrec,probs=0.25,type=3)
    cuartil50<-quantile(FrecTotal$BGfrec,probs=0.5,type=3)
    cuartil75<-quantile(FrecTotal$BGfrec,probs=0.75,type=3)
    tablaclas<-data.frame(nrow=1,ncol=3)
    tablaclas[1,1]<-cuartil25
    colnames(tablaclas)[1]<-"25%"
    tablaclas[1,2]<-cuartil50
    colnames(tablaclas)[2]<-"50%"
    tablaclas[1,3]<-cuartil75
    colnames(tablaclas)[3]<-"75%"
    clasificacionBG<-vector(length=length(statelc$BGfrec))
    PorcentajeBG<-vector(length=length(statelc$BGfrec))
    sumaBG<-sum(statelc$BGfrec)
    #Asignaci?n de interpretaci?n cuartiles BG
    for(i in 1:length(statelc$BGfrec)){
      clasificacionBG[i]<-ifelse(statelc$BGfrec[i]==0,"nula/null",
                                 ifelse(statelc$BGfrec[i]>0&statelc$BGfrec[i]<=cuartil25,"baja/low",
                                        ifelse(statelc$BGfrec[i]>cuartil25&statelc$BGfrec[i]<=cuartil50,"media baja/mid-low",
                                               ifelse(statelc$BGfrec[i]>cuartil50&statelc$BGfrec[i]<=cuartil75,"media alta/mid-high","alta/high"))))
      PorcentajeBG[i]<-(statelc$BGfrec[i]*100)/sumaBG
    }
    statelc<-cbind(statelc,PorcentajeBG,clasificacionBG)
    statelc<-merge(statelc,elc,by="ELC_CAT")
    Class_BG<-vector(length=length(statelc[,1]))
    Class_ELC<-vector(length=length(statelc[,1]))
    #Asignaci?n valores num?ricos a cuartiles tanto para BG como para mapaELC
    for(i in 1:length(statelc[,1])){
      Class_BG[i]<-ifelse(statelc$clasificacionBG[i]=="nula/null",0,
                          ifelse(statelc$clasificacionBG[i]=="baja/low",1,
                                 ifelse(statelc$clasificacionBG[i]=="media baja/mid-low",2,
                                        ifelse(statelc$clasificacionBG[i]=="media alta/mid-high",3,4))))
      Class_ELC[i]<-ifelse(statelc$ClasificacionMapaELC[i]=="baja/low",1,
                           ifelse(statelc$ClasificacionMapaELC[i]=="media baja/mid-low",2,
                                  ifelse(statelc$ClasificacionMapaELC[i]=="media alta/mid-high",3,4)))
    }
    #Creaci?n mapa final ELC recategorizado por cuartiles
    statelc2<-cbind(statelc,Class_BG,Class_ELC)
    liminf<-statelc2$ELC_CAT-0.5
    limsup<-statelc2$ELC_CAT+0.5
    reclass2<-cbind(liminf,limsup,statelc2$Class_BG)
    Class_Sp<-reclassify(mapaelc,reclass2)
    setwd(paste(resultadospaelc))
    writeRaster(Class_Sp,filename="mapa_Class_Sp.grd",overwrite=T,datatype='FLT4S')
    writeRaster(Class_Sp,filename="mapa_Class_Sp.tif",overwrite=T,datatype='FLT4S')
    setwd(paste(ruta))
    #Conversi?n de mapa cuartiles a mapa zonas aptas para seleccionar PA 
    #Evitar error por load de FreqELC.RData
    loadError<-FALSE
    abcd<-try(load("FreqELC.RData"),silent=TRUE)
    loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
    if(loadError){
      FreqELC<-read.delim("FreqELC.txt")
    }
    rm(abcd)
    rm(loadError)
    
    paelc1<-data.frame(paelc,rep(1,length(paelc)))
    colnames(paelc1)[1]<-"clasificacionBG"
    colnames(paelc1)[2]<-"PA_availab"
    FreqELC<-merge(FreqELC,paelc1, by="clasificacionBG", all=TRUE)
    liminf<-FreqELC$value-0.5
    limsup<-FreqELC$value+0.5
    reclass3<-cbind(liminf,limsup,FreqELC$PA_availab)
    PA_availab<-reclassify(Class_Sp,reclass3)
    #Salvar mapa reconvertido por Disponibilidad para PA
    setwd(paste(resultadospaelc))
    writeRaster(PA_availab,filename="PA_availab.grd",overwrite=T,datatype='FLT4S')
    writeRaster(PA_availab,filename="PA_availab.tif",overwrite=T,datatype='FLT4S')
    colnames(statelc)[2]<-"BGfrec/GBfreq"
    colnames(statelc)[3]<-"PorcentajeBG/GBpercentage"
    colnames(statelc)[4]<-"Clasificacion_cuartil_BG/GB_quartile_classification"
    colnames(statelc)[5]<-"FrecTotalceldas/TotalCellsFreq"
    colnames(statelc)[6]<-"Porcentaje_MapaELC/ELCmap_percentage"
    colnames(statelc)[7]<-"ELCmapa_clases-cuartil/Quartile_classes_ELCmap"
    write.table(statelc,file="Quartile_ELCmap_Classification.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(statelc,file="Quartile_ELCmap_Classification.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    puntos<-data.frame(puntos,rep(1,length(puntos)))
    colnames(puntos)[1]<-"x"
    colnames(puntos)[2]<-"y"
    colnames(puntos)[3]<-"pres_abs"
    resvar<-data.frame(randomPoints(PA_availab,pansel*pareps),rep(NA,pansel))
    colnames(resvar)[3]<-"pres_abs"
    #consolidaci?n tabla resp.var y resp.xy
    resvar<-rbind(puntos,resvar)
    resxy<-resvar[,c("x","y")]
    resvar<-resvar[,"pres_abs"]
    #Consolidaci?n tabla repeticiones PA
    patable<-list()
    for(i in 1:pareps){
      aaa<-rep(TRUE,nrow(puntos0))
      bbb<-c(1:(length(resvar)-nrow(puntos0)))
      bbb<-sample(bbb,size=pansel)
      ccc<-rep(FALSE,length(resvar)-nrow(puntos0))
      ccc[bbb]<-TRUE
      patable[[i]]<-c(aaa,ccc)
    }
    patable<-do.call("data.frame",patable)
    for (i in 1:pareps){
      colnames(patable)[i]<-paste("PA",i,sep="")
    }
    paelcfin<-data.frame(resxy,resvar,patable)
    #Creaci?n de shapefile de puntos finales (pres+pseudoabs)
    shapefile1<-SpatialPointsDataFrame(resxy, paelcfin)
    #Guardado
    setwd(paste(resultadospaelc))
    write.table(paelcfin,file="PAtable_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(paelcfin,file="PAtable_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile1,dsn=paste(resultadospaelc),layer="Presences_Pseudoabsences_ELC",driver="ESRI Shapefile")
    setwd(paste(ruta))
    
    #Ahora el BIOMOD_FormatingData con formato Random
    inputs<-BIOMOD_FormatingData(resvar,expstack,resp.xy=resxy,
                                 resp.name=paste(genero,especie,sep="."),
                                 PA.nb.rep=pareps,PA.nb.absences=pansel,
                                 PA.strategy="user.defined",PA.table=patable,
                                 na.rm=TRUE)
    
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    setwd(paste(resultadospaelc))
    write.table(extract.table,file="extraction_table_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(extract.table,file="extraction_table_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile2,dsn=paste(resultadospaelc),layer="Final_extraction_ELC",driver="ESRI Shapefile")
    #Creaci?n reporte
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
    write(paste("Data introduced"), file="input_data.txt", append=TRUE)
    origsize<-nrow(pasaporte)
    write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
    origsize<-length(puntos0)
    write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
    pressize<-length(which(inputs@data.species==1))
    write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
    envarsize<-length(inputs@data.env.var)
    write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
    repsize<-length(inputs@PA)
    write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
    repsize<-length(inputs@PA$PA1)
    write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
    pasize<-length(which(inputs@data.species==1))
    pasize<-(length(inputs@data.species))-(pasize)
    write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
    write(paste("Quartile(s) used to define PA:",paelc,sep=" "), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    setwd(paste(ruta))
    write("8.3.Terminado PA por ELC", file="Error/process_info.txt", append=TRUE)
  }
  
  if(pastrat!="elc"){
    #Creaci?n directorio
    setwd(paste(resultados))
    if(pastrat=="random"){
      dir.create(as.vector(paste("PseudoAbsences_Random_",genero,"_",especie,sep="")))
      resultadosparandom<-paste(resultados,"/PseudoAbsences_Random_",genero,"_",especie,sep="")
    }
    if(pastrat=="disk"){
      dir.create(as.vector(paste("PseudoAbsences_Disk_",genero,"_",especie,sep="")))
      resultadospadisk<-paste(resultados,"/PseudoAbsences_Disk_",genero,"_",especie,sep="")
    }
    if(pastrat=="sre"){
      dir.create(as.vector(paste("PseudoAbsences_SRE_",genero,"_",especie,sep="")))
      resultadospasre<-paste(resultados,"/PseudoAbsences_SRE_",genero,"_",especie,sep="")
    }
    setwd(paste(ruta))
    
    if(pastrat=="random"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   na.rm=TRUE)
    }
    if(pastrat=="disk"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   PA.dist.min=padiskmin,PA.dist.max=padiskmax,
                                   na.rm=TRUE)
    }
    if(pastrat=="sre"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   PA.sre.quant=pasreq,
                                   na.rm=TRUE)
    }
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    
    
    write("8.2.Terminado creaci?n BIOMOD_FormatingData", file="Error/process_info.txt", append=TRUE)
    
    if(pastrat=="random"){
      setwd(paste(resultadosparandom))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Random.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Random.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadosparandom),layer="Final_extraction_Random",driver="ESRI Shapefile")
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
    
    if(pastrat=="disk"){
      setwd(paste(resultadospadisk))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Disk.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Disk.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadospadisk),layer="Final_extraction_Disk",driver="ESRI Shapefile")
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste("Disk around presence sites for PA selection - from: ",padiskmin," to: ", padiskmax,"meters", sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
    if(pastrat=="sre"){
      setwd(paste(resultadospasre))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Sre.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Sre.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadospasre),layer="Final_extraction_Sre",driver="ESRI Shapefile")
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste("Quantile value (sre model) used for PA selection: ",pasreq,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
  }
}
setwd(paste(ruta))
write("9.Terminado proceso de BIOMOD_FormatingData", file="Error/process_info.txt", append=TRUE)

##################################################################################
##################################################################################
#####Colinealidad#################################################################
resplogreg<-data.frame(inputs@data.species)
colnames(resplogreg)[1]<-"Response"
resplogreg$Response[is.na(resplogreg$Response)]<-0
envivar<-data.frame(resplogreg,inputs@data.env.var)
#Dependencia lineal total o duplicado accidental de variables
eslineal<-alias(glm(Response ~ ., family = binomial(logit), data = envivar))
objeslineal<-as.vector(ls(eslineal))
if(length(objeslineal)>1){
  setwd(paste(resultados))
  write(paste(eslineal[[1]],sep=""), file="model.txt", append=TRUE)
  sonlineales<-data.frame(eslineal[[2]])
  if(nrow(sonlineales)>0){
    VariableName<-data.frame(paste(rownames(sonlineales),sep=""))
    colnames(VariableName)[1]<-"LinealVariables"
    sonlineales<-data.frame(eslineal[[2]],row.names=NULL)
    sonlineales<-cbind(VariableName,sonlineales)
    write.table(sonlineales,file="List_of_LinealorDuplicated_Variables.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(sonlineales,file="List_of_LinealorDuplicated_Variables.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    stop(paste("Stopped process. Please check your 'List_of_LinealorDuplicated_Variables' table, VIF process cannot continue / Proceso detenido, revise su tabla 'List_of_LinealorDuplicated_Variables', obtenci?n de VIF es inviable"))
  }
}
if(length(objeslineal)>=1){
  #VIF
  logreg<-glm(Response ~ ., family = binomial(logit), data = envivar)
  VIFlogreg<-vif(logreg)
  VIFlogreg<-data.frame(VIFlogreg)
  colnames(VIFlogreg)[1]<-"VIF values"
  Variables_names<-rownames(VIFlogreg)
  VIFlogreg<-data.frame(Variables_names,VIFlogreg,row.names=NULL)
  VIFlogreg <- VIFlogreg[order(-VIFlogreg[ ,2]), ]
  Variable_Discard<-vector(mode="character")
  for(i in 1:nrow(VIFlogreg)){
    if(VIFlogreg[i,2]>cutoff){
      Variable_Discard[i]<-"Yes"
    }
    else{
      Variable_Discard[i]<-"No"
    }
  }
  VIFlogreg<-cbind(VIFlogreg,Variable_Discard)
  setwd(paste(resultados))
  dir.create(as.vector(paste("VIF_",genero,"_",especie,sep="")))
  resultadosvif<-paste(resultados,"/VIF_",genero,"_",especie,sep="")
  setwd(paste(resultadosvif))
  write.table(VIFlogreg,file="VIF_values.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(VIFlogreg,file="VIF_values.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  if(dynamic){
    logreg<-glm(Response ~ ., family = binomial(logit), data = envivar)
    flag<-TRUE
    viftable<-data.frame()
    while(flag) {
      VIFlogreg<-vif(logreg)
      viftable=rbind.fill(viftable,as.data.frame(t(VIFlogreg)))
      if(max(VIFlogreg)>cutoff){
        logreg<-update(logreg,as.formula(paste(".","~",".","-",names(which.max(VIFlogreg)))))
      }
      else { flag<-FALSE } }
   steps<-1:nrow(viftable)
   viftable<-cbind(steps,viftable)
   setwd(paste(resultadosvif))
   write.table(viftable,file="Stepwise_VIF_filtering.txt", sep = "\t", row.names = FALSE, qmethod = "double")
   write.table(viftable,file="Stepwise_VIF_filtering.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
}

#FIN#
