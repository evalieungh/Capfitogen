######################################################################
# Script  de la herramienta Bfuture - Bfuture Tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2021
######################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas. 
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#This tool depends on the available files from Worldclim (https://www.worldclim.org/), therefore any change in that website (i.e. paths to files) can affect the performance of this tool. 
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LINEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRARA DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
###########################################################################################################Parametros
setwd(paste(ruta,"/rdatamapsf",sep=""))
write(paste(), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write("______Herramienta/Tool Bfuture________", file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Bfuture.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("local:", local,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("ssp:", ssp,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("gcm:", gcm,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("proy:", proy,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("varset:", varset,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("croplayer:", croplayer,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("paiscrop:", paiscrop,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("cropway:", cropway,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("buffer:", buffer,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)
write(paste("uname:", uname,sep=""), file="Parametros.Parameters.Bfuture.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

setwd(paste(ruta))

#Check e instalación si a lugar
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
if(system.file(package="rgeos")==""){
  packages2<-append(packages2,"rgeos")
}
if(system.file(package="rgdal")==""){
  packages2<-append(packages2,"rgdal")
}
if(system.file(package="dismo")==""){
  packages2<-append(packages2,"dismo")
}
#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}

#Carga paquetes
library(sp)
library(raster)
library(maptools)
library(rgeos)
library(rgdal)
library(dismo)

#Carga y selecci?n del codigo modelo
futmodels<-paste(gcm)
#Carga de resoulciones
#Condicional futresol por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("futresol1.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  futresol1<-read.delim("futresol1.txt")
}
rm(abcd)
rm(loadError)

futresol1<-subset(futresol1,Resol1==paste(resol1))
futresol1<-as.character(futresol1[1,2])
#set de variables
varset1<-vector()
varset2<-vector()

if(any(varset=="monthly_min_temp")){
  varset2<-c(varset2,"tmin")
  varset1<-c(varset1,"tn")
}
if(any(varset=="monthly_max_temp")){
  varset2<-c(varset2,"tmax")
  varset1<-c(varset1,"tx")
}
if(any(varset=="monthly_tot_prec")){
  varset2<-c(varset2,"prec")
  varset1<-c(varset1,"pr")
}
if(any(varset=="bioclimatic_indices")){
  varset2<-c(varset2,"bioc")
  varset1<-c(varset1,"bi")
}

if(proy==2030){
  proy2<-"2021-2040"
}
if(proy==2050){
  proy2<-"2041-2060"
}
if(proy==2070){
  proy2<-"2061-2080"
}
if(proy==2090){
  proy2<-"2081-2100"
}

rcp<-ssp
rm(ssp)

############################################
#Descarga de capas desde worldclim
setwd(paste(ruta,"/rdatamapsf",sep=""))

if(!local){
  for(i in 1:length(varset2)){
    download.file(paste("https://geodata.ucdavis.edu/cmip6/",futresol1,"/",gcm,"/ssp",rcp,"/wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".tif",sep=""),
                  paste(ruta,"/rdatamapsf/future_",varset1[i],".tif",sep=""), mode = "wb")
  }
}
#Ejemplos links descarga worldclim 2022:
#https://geodata.ucdavis.edu/cmip6/10m/INM-CM4-8/ssp126/wc2.1_10m_bioc_INM-CM4-8_ssp126_2021-2040.tif
#https://geodata.ucdavis.edu/cmip6/10m/HadGEM3-GC31-LL/ssp126/wc2.1_10m_prec_HadGEM3-GC31-LL_ssp126_2021-2040.tif
#https://geodata.ucdavis.edu/cmip6/10m/MRI-ESM2-0/ssp126/wc2.1_10m_tmin_MRI-ESM2-0_ssp126_2021-2040.tif

#Creaci?n carpetas para pais dentro de rdatamapsf
if(croplayer&paiscrop){
  setwd(paste(ruta))
  #Definici?n pa?s
  #Evitar error por load de lista.paises.RData
  pais<-tolower(pais)
  
  #Check del nombre del set de capas ecogeograficas en rdatamap
  #Carga del pais
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
  
  setwd(paste(ruta,"/rdatamapsf",sep=""))
  dir.create(as.vector(paste(pais)))
  setwd(paste(ruta,"/rdatamapsf/",pais,sep=""))
  dir.create(as.vector(paste(gcm,"_",rcp,"_",proy,sep="")))
  setwd(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,sep=""))
  if(futresol1=="10m"){
    dir.create(as.vector("20x20"))
    setwd(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/","20x20",sep=""))
  }
  if(futresol1=="5m"){
    dir.create(as.vector("10x10"))
    setwd(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/","10x10",sep=""))
  }
  if(futresol1=="2.5m"){
    dir.create(as.vector("5x5"))
    setwd(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/","5x5",sep=""))
  }
  if(futresol1=="30s"){
    dir.create(as.vector("1x1"))
    setwd(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/","1x1",sep=""))
  }
}
#Para puntos
if(croplayer&!paiscrop){
  setwd(paste(ruta,"/rdatamapsf",sep=""))
  dir.create(as.vector(paste(uname)))
  setwd(paste(ruta,"/rdatamapsf/",uname,sep=""))
  dir.create(as.vector(paste(gcm,"_",rcp,"_",proy,sep="")))
  setwd(paste(ruta,"/rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,sep=""))
  if(futresol1=="10m"){
    dir.create(as.vector("20x20"))
    setwd(paste(ruta,"/rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/","20x20",sep=""))
  }
  if(futresol1=="5m"){
    dir.create(as.vector("10x10"))
    setwd(paste(ruta,"/rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/","10x10",sep=""))
  }
  if(futresol1=="2.5m"){
    dir.create(as.vector("5x5"))
    setwd(paste(ruta,"/rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/","5x5",sep=""))
  }
  if(futresol1=="30s"){
    dir.create(as.vector("1x1"))
    setwd(paste(ruta,"/rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/","1x1",sep=""))
  }
}

#Para obtener la capa world sin corte, creaci?n de ruta con world
if(!croplayer){
  setwd(paste(ruta,"/rdatamapsf",sep=""))
  dir.create(as.vector("world"))
  setwd(paste(ruta,"/rdatamapsf/world",sep=""))
  dir.create(as.vector(paste(gcm,"_",rcp,"_",proy,sep="")))
  setwd(paste(ruta,"/rdatamapsf/world/",gcm,"_",rcp,"_",proy,sep=""))
  if(futresol1=="10m"){
    dir.create(as.vector("20x20"))
    setwd(paste(ruta,"/rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/20x20",sep=""))
  }
  if(futresol1=="5m"){
    dir.create(as.vector("10x10"))
    setwd(paste(ruta,"/rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/10x10",sep=""))
  }
  if(futresol1=="2.5m"){
    dir.create(as.vector("5x5"))
    setwd(paste(ruta,"/rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/5x5",sep=""))
  }
  if(futresol1=="30s"){
    dir.create(as.vector("1x1"))
    setwd(paste(ruta,"/rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/1x1",sep=""))
  }
}


#unzip de las capas
#Se cancela a partir de la descarga de .tif directamente desde worldclim
#if(!local){
#  for(i in 1:length(varset2)){
#    unzip(paste(ruta,"/rdatamapsf/future_",varset1[i],".zip",sep=""))
#  }
#}
if(local){
  for(i in 1:length(varset2)){
    if(!file.exists(paste(ruta,"/rdatamapsf/wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".tif",sep=""))){
      stop(paste("The file ", "wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".tif"," downloaded by the user from worldclim.org is not in the right path CAPFITOGEN2/rdatamapsf",sep=""))
    }
    #if(file.exists(paste(ruta,"/rdatamapsf/wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".zip",sep=""))){
     # for(i in 1:length(varset2)){
      #  unzip(paste(ruta,"/rdatamapsf/wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".tif",sep=""))
      #}
    #}
    file.rename(paste(ruta,"/rdatamapsf/wc2.1_",futresol1,"_",varset2[i],"_",gcm,"_ssp",rcp,"_",proy2,".tif",sep=""),
                paste(ruta,"/rdatamapsf/future_",varset1[i],".tif",sep=""))
  }
  
}


#######################################################
#Con corte por puntos, preparar los puntos
if(croplayer&!paiscrop){
  setwd(paste(ruta))
  #introducci?n tabla de lista de pa?ses y resoluciones de extracci?n a elegir y traducci?n
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
    pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"), fileEncoding="latin1")
  } else {pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"))}
  
  i <- order(pasaporte$ACCENUMB)
  pasaporte <- pasaporte[i,]
  
  #filtro por GEOQUAL
  if(geoqual){
    pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
  }
  
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
  
  puntos<-SpatialPoints(puntosorig[,c(25,23)],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  
  if(cropway=="buffer"){
    ##Necesario aun sin corte
    if(futresol1=="10m"){
      resol<-"20x20"
    }
    if(futresol1=="5m"){
      resol<-"10x10"
    }
    if(futresol1=="2.5m"){
      resol<-"5x5"
    }
    if(futresol1=="30s"){
      resol<-"1x1"
    }
    #Entra la parte espacial
    
    #creaci?n del raster sobre los buffers desde los puntos
    influ<-circles(puntos,d=as.numeric(paste(buffer))*1000,lonlat=TRUE)
    influ<-influ@polygons
    #Creaci?n de la m?scara
    #Primero la resoluci?n o cell size
    if(resol=="1x1"){resolucion<-0.00833333333333333}
    if(resol=="5x5"){resolucion<-0.0416666688384401}
    if(resol=="10x10"){resolucion<-0.0833333376793981}
    if(resol=="20x20"){resolucion<-0.166666675358796}
    #Creacion m?scara
    molde<-raster(influ)
    res(molde)<-resolucion
    moldextent<-extent(molde)
    projection(molde)<-"+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    values(molde)<-1
    molde<-mask(molde,influ)
  }
  
  if(cropway=="square"){
    #Fijar extent
    if(futresol1=="30s"){
      expand<-0.1
    }
    if(futresol1=="2.5m"){
      expand<-0.15
    }
    if(futresol1=="5m"){
      expand<-0.15
    }
    if(futresol1=="10m"){
      expand<-0.25
    }
    
    xmin<-min(puntosorig$DECLONGITUDE)-(expand)
    if(xmin< -180){
      xmin<- -180
    }
    xmax<-max(puntosorig$DECLONGITUDE)+(expand)
    if(xmin>180){
      xmin<- 180
    }
    ymin<-min(puntosorig$DECLATITUDE)-(expand)
    if(ymin< -90){
      ymin<- -90
    }
    ymax<-max(puntosorig$DECLATITUDE)+(expand)
    if(ymax>90){
      ymax<-90
    }
    molde<-extent(xmin,xmax,ymin,ymax)
    
    
    ##Necesario aun sin corte
    if(futresol1=="10m"){
      resol<-"20x20"
    }
    if(futresol1=="5m"){
      resol<-"10x10"
    }
    if(futresol1=="2.5m"){
      resol<-"5x5"
    }
    if(futresol1=="30s"){
      resol<-"1x1"
    }
  }
  
  #########################################################################
  #########################################################################
  ####transformaci?n de geotiff a .tif y corte all in one 
  #########################################################################
  
  #Bioclimatic var
  if(any(varset1=="bi")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_bi.tif",sep="")),molde)
    if(cropway=="buffer"){
      extent(bio)<-moldextent
      bio<-mask(bio,molde)
    }
    for(i in 1:19){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_bi.tif",sep=""))
  }
  #Precipitation
  if(any(varset1=="pr")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_pr.tif",sep="")),molde)
    if(cropway=="buffer"){
      extent(bio)<-moldextent
      bio<-mask(bio,molde)
    }
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_pr.tif",sep=""))
  }
  #Temp min
  if(any(varset1=="tn")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_tn.tif",sep="")),molde)
    if(cropway=="buffer"){
      extent(bio)<-moldextent
      bio<-mask(bio,molde)
    }
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tn.tif",sep=""))
  }
  #Temp max
  if(any(varset1=="tx")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_tx.tif",sep="")),molde)
    if(cropway=="buffer"){
      extent(bio)<-moldextent
      bio<-mask(bio,molde)
    }
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tn.tif",sep=""))
  }
  rm(molde)
}

#######################################################
#Con corte por pa?s
if(croplayer&paiscrop){
  setwd(paste(ruta))
  
  ##Necesario aun sin corte
  if(futresol1=="10m"){
    resol<-"20x20"
  }
  if(futresol1=="5m"){
    resol<-"10x10"
  }
  if(futresol1=="2.5m"){
    resol<-"5x5"
  }
  if(futresol1=="30s"){
    resol<-"1x1"
  }
  
  #creaci?n de molde con capa bio_1 de presente
  molde<-raster(paste(ruta,"/rdatamaps/",pais,"/",resol,"/bio_1.tif",sep=""))
  moldextent<-extent(molde)
  
  #########################################################################
  #########################################################################
  ####transformaci?n de geotiff a .tif y corte all in one 
  #########################################################################
  if(any(varset1=="bi")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_bi.tif",sep="")),molde)
    extent(bio)<-moldextent
    bio<-mask(bio,molde)  
    for(i in 1:19){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_bi.tif",sep=""))
    
  }
  #Precipitation
  if(any(varset1=="pr")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_pr.tif",sep="")),molde)
    extent(bio)<-moldextent
    bio<-mask(bio,molde)
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_pr.tif",sep=""))
    
  }
  #Temp min
  if(any(varset1=="tn")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_tn.tif",sep="")),molde)
    extent(bio)<-moldextent
    bio<-mask(bio,molde)
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tn.tif",sep=""))
    
  }
  #Temp max
  if(any(varset1=="tx")){
    bio<-crop(stack(paste(ruta,"/rdatamapsf/future_tx.tif",sep="")),molde)
    extent(bio)<-moldextent
    bio<-mask(bio,molde)
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tx.tif",sep=""))
    
  }
  rm(molde)
}

#######################################################
#Sin cortar ni por pais ni por puntos
if(!croplayer){
  setwd(paste(ruta))
  ##Necesario aun sin corte
  if(futresol1=="10m"){
    resol<-"20x20"
  }
  if(futresol1=="5m"){
    resol<-"10x10"
  }
  if(futresol1=="2.5m"){
    resol<-"5x5"
  }
  if(futresol1=="30s"){
    resol<-"1x1"
  }
  

  #########################################################################
  #########################################################################
  ####transformaci?n de geotiff a .tif y corte all in one 
  #########################################################################
  
  if(any(varset1=="bi")){
    bio<-stack(paste(ruta,"/rdatamapsf/future_bi.tif",sep=""))
    for(i in 1:19){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_bi.tif",sep=""))
    
  }
  #Precipitation
  if(any(varset1=="pr")){
    bio<-stack(paste(ruta,"/rdatamapsf/future_pr.tif",sep=""))
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_pr.tif",sep=""))
    
  }
  #Temp min
  if(any(varset1=="tn")){
    bio<-stack(paste(ruta,"/rdatamapsf/future_tn.tif",sep=""))
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tn.tif",sep=""))
    
  }
  #Temp max
  if(any(varset1=="tx")){
    bio<-stack(paste(ruta,"/rdatamapsf/future_tx.tif",sep=""))
    for(i in 1:12){
      bio_ok<-subset(bio,i,drop=TRUE)
      writeRaster(bio_ok,filename=paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_",i,".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    rm(bio_ok)
    rm(bio)
    file.remove(paste(ruta,"/rdatamapsf/future_tx.tif",sep=""))
    
  }
}

#######################################
#puntos para rdatapoints ##############
#######################################

#Puntos para corte por molde
if(croplayer&!paiscrop){
  if(!file.exists(paste(ruta,"/rdatapoints/",uname,"/",resol,"/","base",resol,".RData",sep=""))){
    if(varset1[1]=="tx"){
      tmax_12<-raster(paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_12.tif",sep=""))
      bioclimn<-ncell(tmax_12)
      bioclimp<-xyFromCell(tmax_12,c(1:bioclimn))
      bioclime<-extract(tmax_12,bioclimp)
      rm(tmax_12)
    }
    if(varset1[1]=="tn"){
      tmin_12<-raster(paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_12.tif",sep=""))
      bioclimn<-ncell(tmin_12)
      bioclimp<-xyFromCell(tmin_12,c(1:bioclimn))
      bioclime<-extract(tmin_12,bioclimp)
      rm(tmin_12)
    }
    if(varset1[1]=="pr"){
      prec_12<-raster(paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_12.tif",sep=""))
      bioclimn<-ncell(prec_12)
      bioclimp<-xyFromCell(prec_12,c(1:bioclimn))
      bioclime<-extract(prec_12,bioclimp)
      rm(prec_12)
    }
    if(varset1[1]=="bi"){
      bio_19<-raster(paste("rdatamapsf/",uname,"/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_19.tif",sep=""))
      bioclimn<-ncell(bio_19)
      bioclimp<-xyFromCell(bio_19,c(1:bioclimn))
      bioclime<-extract(bio_19,bioclimp)
      rm(bio_19)
    }
    
    bioclim<-cbind(bioclimp,bioclime)
    bioclim<-na.omit(bioclim)
    bioclim<-bioclim[,c(1,2)]
    
    POINTID<-as.vector(1:length(bioclim[,1]))
    
    bioclimp<-data.frame(cbind(POINTID,bioclim[,c(1,2)]))
    colnames(bioclimp)[2]<-"POINT_X"
    colnames(bioclimp)[3]<-"POINT_Y"
    puntos<-bioclimp
    
    setwd(paste(ruta,"/rdatapoints",sep=""))
    dir.create(as.vector(paste(uname)))
    setwd(paste(ruta,"/rdatapoints/",uname,sep=""))
    dir.create(as.vector(paste(resol)))
    save(puntos,file=paste(resol,"/","base",resol,".RData",sep=""))
    
    rm(bioclim)
    rm(bioclimp)
  }
}

#Puntos para corte por pais
if(croplayer&paiscrop){
  if(!file.exists(paste(ruta,"/rdatapoints/",pais,"/",resol,"/","base",resol,".RData",sep=""))){
    if(varset1[1]=="tx"){
      tmax_12<-raster(paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_12.tif",sep=""))
      bioclimn<-ncell(tmax_12)
      bioclimp<-xyFromCell(tmax_12,c(1:bioclimn))
      bioclime<-extract(tmax_12,bioclimp)
      rm(tmax_12)
    }
    if(varset1[1]=="tn"){
      tmin_12<-raster(paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_12.tif",sep=""))
      bioclimn<-ncell(tmin_12)
      bioclimp<-xyFromCell(tmin_12,c(1:bioclimn))
      bioclime<-extract(tmin_12,bioclimp)
      rm(tmin_12)
    }
    if(varset1[1]=="pr"){
      prec_12<-raster(paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_12.tif",sep=""))
      bioclimn<-ncell(prec_12)
      bioclimp<-xyFromCell(prec_12,c(1:bioclimn))
      bioclime<-extract(prec_12,bioclimp)
      rm(prec_12)
    }
    if(varset1[1]=="bi"){
      bio_19<-raster(paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_19.tif",sep=""))
      bioclimn<-ncell(bio_19)
      bioclimp<-xyFromCell(bio_19,c(1:bioclimn))
      bioclime<-extract(bio_19,bioclimp)
      rm(bio_19)
    }
    
    bioclim<-cbind(bioclimp,bioclime)
    bioclim<-na.omit(bioclim)
    bioclim<-bioclim[,c(1,2)]
    
    POINTID<-as.vector(1:length(bioclim[,1]))
    
    bioclimp<-data.frame(cbind(POINTID,bioclim[,c(1,2)]))
    colnames(bioclimp)[2]<-"POINT_X"
    colnames(bioclimp)[3]<-"POINT_Y"
    puntos<-bioclimp
    
    setwd(paste(ruta,"/rdatapoints",sep=""))
    dir.create(as.vector(paste(pais)))
    setwd(paste(ruta,"/rdatapoints/",pais,sep=""))
    dir.create(as.vector(paste(resol)))
    save(puntos,file=paste(resol,"/","base",resol,".RData",sep="")) 
    
    rm(bioclim)
    rm(bioclimp)
  }
}

#Puntos para no corte alguno
if(!croplayer){
  if(!file.exists(paste(ruta,"/rdatapoints/world/",resol,"/","base",resol,".RData",sep=""))){
    if(varset1[1]=="tx"){
      tmax_12<-raster(paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/tmax_12.tif",sep=""))
      bioclimn<-ncell(tmax_12)
      bioclimp<-xyFromCell(tmax_12,c(1:bioclimn))
      bioclime<-extract(tmax_12,bioclimp)
      rm(tmax_12)
    }
    if(varset1[1]=="tn"){
      tmin_12<-raster(paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/tmin_12.tif",sep=""))
      bioclimn<-ncell(tmin_12)
      bioclimp<-xyFromCell(tmin_12,c(1:bioclimn))
      bioclime<-extract(tmin_12,bioclimp)
      rm(tmin_12)
    }
    if(varset1[1]=="pr"){
      prec_12<-raster(paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/prec_12.tif",sep=""))
      bioclimn<-ncell(prec_12)
      bioclimp<-xyFromCell(prec_12,c(1:bioclimn))
      bioclime<-extract(prec_12,bioclimp)
      rm(prec_12)
    }
    if(varset1[1]=="bi"){
      bio_19<-raster(paste("rdatamapsf/world/",gcm,"_",rcp,"_",proy,"/",resol,"/bio_19.tif",sep=""))
      bioclimn<-ncell(bio_19)
      bioclimp<-xyFromCell(bio_19,c(1:bioclimn))
      bioclime<-extract(bio_19,bioclimp)
      rm(bio_19)
    }
    
    bioclim<-cbind(bioclimp,bioclime)
    bioclim<-na.omit(bioclim)
    bioclim<-bioclim[,c(1,2)]
    
    POINTID<-as.vector(1:length(bioclim[,1]))
    
    bioclimp<-data.frame(cbind(POINTID,bioclim[,c(1,2)]))
    colnames(bioclimp)[2]<-"POINT_X"
    colnames(bioclimp)[3]<-"POINT_Y"
    puntos<-bioclimp
    
    setwd(paste(ruta,"/rdatapoints",sep=""))
    dir.create(as.vector("world"))
    setwd(paste(ruta,"/rdatapoints/world",sep=""))
    dir.create(as.vector(paste(resol)))
    save(puntos,file=paste(resol,"/","base",resol,".RData",sep=""))
    
    rm(bioclim)
    rm(bioclimp)
  }
}  

    
    
  
    

