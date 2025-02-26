#####################################################################
# Script  de la herramienta Complementa - Complementa Tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2024
#####################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LINEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRARA DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
##########################################################################################################
##Par?metros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Complementa.txt", append=TRUE)
write("______Herramienta/Tool Complementa________", file="Parametros.Parameters.Complementa.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Complementa.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("gaptype:", gaptype,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("gaptresh:", gaptresh,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("gapna:", gapna,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("duplicat:", duplicat,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("celdas:", celdas,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("nceldas:", nceldas,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("areas:", areas,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("WDPA:", WDPA,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("propio:", propio,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("nombre:", nombre,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("campo:", campo,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("nareas:", nareas,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("coveran:", coveran,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("niveltax:", niveltax,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("datanatax:", datanatax,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("mapaelcf:", mapaelcf,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("datanaelc:", datanaelc,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("data0elc:", data0elc,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.Complementa.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

##Elemento introducido por el usuario: ruta (ext)
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))

#Paquetes a cargar
#Check e instalación si a lugar
packages2<-vector()
if(system.file(package="sp")==""){
  packages2<-append(packages2,"sp")
}
if(system.file(package="raster")==""){
  packages2<-append(packages2,"raster")
}
if(system.file(package="sf")==""){
  packages2<-append(packages2,"sf")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}
#Carga de paquetes
library(sp)
library(raster)
library(sf)

pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))

#transformaci?n pais uppercase to lowercase
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

#Trifurcaci?n (sin coordenadas, con coordenadas sexagesimales, con coordenadas decimales)
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
####################
#Filtros
#Por GEOQUAL
if(geoqual){
  puntosorig<-subset(puntosorig,TOTALQUAL100>=totalqual)
}
#Por tipo de gap (de Representa)
if(gaptype){
  if(gapna=="include"){
    puntosorigA<-subset(puntosorig,GAPTYPE<gaptresh)
    puntosorigB<-subset(puntosorig,is.na(GAPTYPE))
    puntosorig<-rbind(puntosorigA,puntosorigB)
  }
  if(gapna=="exclude"){
    puntosorig<-subset(puntosorig,GAPTYPE<gaptresh)
  }
}

##Extracci?n de categor?a ELC si fuera necesaria
if(mapaelcf){
  namespas<-colnames(puntosorig)
  if(any(namespas=="BG_ELC")){
    if(any(is.na(unique(puntosorig$BG_ELC)))){
      mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
      puntosBG<-SpatialPoints(puntosorig[,c("DECLONGITUDE","DECLATITUDE")],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
      BGcat<-terra::extract(mapaelc,puntosBG)
      puntosorig$BG_ELC<-BGcat
    }
    ####Si no hay NA's en la columna BG_ELC, va a trabajar con los valores de esa columna
  }
  if(!any(namespas=="BG_ELC")){
    mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
    puntosBG<-SpatialPoints(puntosorig[,c("DECLONGITUDE","DECLATITUDE")],proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    BG_ELC<-terra::extract(mapaelc,puntosBG)
    puntosorig<-cbind(puntosorig,BG_ELC)
  }
}
#Simplificaci?n de tabla

if(geoqual&gaptype){
  puntosorig<-data.frame(puntosorig$ACCENUMB,puntosorig$GENUS,puntosorig$SPECIES,puntosorig$SUBTAXA,puntosorig$DECLATITUDE,puntosorig$DECLONGITUDE,puntosorig$TOTALQUAL100,puntosorig$BG_ELC,puntosorig$GAPTYPE)
  colnames(puntosorig)[1]<-"ACCENUMB"
  colnames(puntosorig)[2]<-"GENUS"
  colnames(puntosorig)[3]<-"SPECIES"
  colnames(puntosorig)[4]<-"SUBTAXA"
  colnames(puntosorig)[5]<-"DECLATITUDE"
  colnames(puntosorig)[6]<-"DECLONGITUDE"
  colnames(puntosorig)[7]<-"TOTALQUAL100"
  colnames(puntosorig)[8]<-"BG_ELC"
  colnames(puntosorig)[9]<-"GAPTYPE"
}
if(geoqual&!gaptype){
  puntosorig<-data.frame(puntosorig$ACCENUMB,puntosorig$GENUS,puntosorig$SPECIES,puntosorig$SUBTAXA,puntosorig$DECLATITUDE,puntosorig$DECLONGITUDE,puntosorig$TOTALQUAL100,puntosorig$BG_ELC)
  colnames(puntosorig)[1]<-"ACCENUMB"
  colnames(puntosorig)[2]<-"GENUS"
  colnames(puntosorig)[3]<-"SPECIES"
  colnames(puntosorig)[4]<-"SUBTAXA"
  colnames(puntosorig)[5]<-"DECLATITUDE"
  colnames(puntosorig)[6]<-"DECLONGITUDE"
  colnames(puntosorig)[7]<-"TOTALQUAL100"
  colnames(puntosorig)[8]<-"BG_ELC"
}
if(!geoqual&gaptype){
  puntosorig<-data.frame(puntosorig$ACCENUMB,puntosorig$GENUS,puntosorig$SPECIES,puntosorig$SUBTAXA,puntosorig$DECLATITUDE,puntosorig$DECLONGITUDE,puntosorig$BG_ELC,puntosorig$GAPTYPE)
  colnames(puntosorig)[1]<-"ACCENUMB"
  colnames(puntosorig)[2]<-"GENUS"
  colnames(puntosorig)[3]<-"SPECIES"
  colnames(puntosorig)[4]<-"SUBTAXA"
  colnames(puntosorig)[5]<-"DECLATITUDE"
  colnames(puntosorig)[6]<-"DECLONGITUDE"
  colnames(puntosorig)[7]<-"BG_ELC"
  colnames(puntosorig)[8]<-"GAPTYPE"
}
if(!geoqual&!gaptype){
  puntosorig<-data.frame(puntosorig$ACCENUMB,puntosorig$GENUS,puntosorig$SPECIES,puntosorig$SUBTAXA,puntosorig$DECLATITUDE,puntosorig$DECLONGITUDE,puntosorig$BG_ELC)
  colnames(puntosorig)[1]<-"ACCENUMB"
  colnames(puntosorig)[2]<-"GENUS"
  colnames(puntosorig)[3]<-"SPECIES"
  colnames(puntosorig)[4]<-"SUBTAXA"
  colnames(puntosorig)[5]<-"DECLATITUDE"
  colnames(puntosorig)[6]<-"DECLONGITUDE"
  colnames(puntosorig)[7]<-"BG_ELC"
}
#Concatenaci?n y exclusi?n o no de valores taxon?micos/ecogeogr?ficos NA
if(niveltax=="genus"){
  CHAIN<-vector(mode = "character", length = length(puntosorig[,1]))
  if(datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$BG_ELC[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i])
      }
      puntosorig<-cbind(puntosorig,CHAIN)
    } 
  }
  if(!datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$BG_ELC[i],sep="_") 
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i]) 
      }
      puntosorig<-cbind(puntosorig,CHAIN)
    }
    puntosorig<-subset(puntosorig, !is.na(GENUS))
  }
}

if(niveltax=="species"){
  CHAIN<-vector(mode = "character", length = length(puntosorig[,1]))
  if(datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$BG_ELC[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
    }
  }
  if(!datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$BG_ELC[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],sep="_")  
      } 
      puntosorig<-cbind(puntosorig,CHAIN)
    }
    puntosorig<-subset(puntosorig, !is.na(SPECIES))
  }
}

if(niveltax=="subtaxa"){
  CHAIN<-vector(mode = "character", length = length(puntosorig[,1]))
  if(datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$SUBTAXA[i],puntosorig$BG_ELC[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$SUBTAXA[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
    }  
  }
  if(!datanatax){
    if(mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$SUBTAXA[i],puntosorig$BG_ELC[i],sep="_") 
      }
      puntosorig<-cbind(puntosorig,CHAIN)
      if(!data0elc){
        puntosorig<-subset(puntosorig, BG_ELC!=0)
      }
      if(!datanaelc){
        puntosorig<-subset(puntosorig,!is.na(BG_ELC))
      }
    }
    if(!mapaelcf){
      for(i in 1:length(puntosorig[,1])){
        CHAIN[i]<-paste(puntosorig$GENUS[i],puntosorig$SPECIES[i],puntosorig$SUBTAXA[i],sep="_")
      }
      puntosorig<-cbind(puntosorig,CHAIN)
    }
    puntosorig<-subset(puntosorig, !is.na(SUBTAXA))
  }
}
#
#Eliminaci?n de duplicados espaciales por taxa o taxa-eu
if(duplicat){
  taxaN<-unique(puntosorig$CHAIN)
  puntosor<-list()
  for (i in 1:length(taxaN)){
    puntosro1<-subset(puntosorig,CHAIN==taxaN[i])
    puntosdistdup<-SpatialPointsDataFrame(puntosro1[,c("DECLONGITUDE","DECLATITUDE")],puntosro1,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    if (mean(puntosro1$DECLATITUDE)<23){
      distdup1<-distdup*0.00833
    }
    if (mean(puntosro1$DECLATITUDE)>23&mean(puntosro1$DECLATITUDE)<45){
      distdup1<-distdup*0.00975
    }
    if (mean(puntosro1$DECLATITUDE)>45&mean(puntosro1$DECLATITUDE)<67){
      distdup1<-distdup*0.0127
    }
    if (mean(puntosro1$DECLATITUDE)>67){
      distdup1<-distdup*0.02299
    }
    puntosdistdup<-remove.duplicates(puntosdistdup,zero=distdup1)
    puntosor[[i]]<-puntosdistdup@data
  }
  rm(taxaN)
  rm(puntosro1)
  rm(puntosdistdup)
  puntosorig<-do.call("rbind",puntosor) 
  rm(puntosor)
}

############################################################
############################################################
#An?lisis por Celda
############################################################
if(celdas){
  #creaci?n directorio para an?lisis de celdas
  setwd(paste(resultados))
  dir.create(as.vector(paste("AnalisisCeldas_CellAnalysis")))
  resultadosCell<-paste(resultados,"/AnalisisCeldas_CellAnalysis",sep="")
  setwd(paste(ruta))
  #Carga de resoluciones
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
  resol<-resol[1,3]
  
  #puntos espaciales sin dataframe
  puntos<-SpatialPoints(puntosorig[,c(6,5)])
  
  #Creaci?n Raster base
  xmin<-min(puntosorig$DECLONGITUDE)-resol
  xmax<-max(puntosorig$DECLONGITUDE)+resol
  ymin<-min(puntosorig$DECLATITUDE)-resol
  ymax<-max(puntosorig$DECLATITUDE)+resol
  extension<-extent(xmin,xmax,ymin,ymax)
  aaa<-raster(extension)
  res(aaa)<-resol
  aaa<-rasterFromCells(aaa, 1:ncell(aaa))
  
  #extraccion cell value
  cellvalue<-terra::extract(aaa,puntos)
  puntosorig<-cbind(puntosorig,cellvalue)
  puntosfuera<-subset(puntosorig,is.na(cellvalue))
  if(nrow(puntosfuera)>0){
    puntosfuera<-SpatialPointsDataFrame(puntosfuera[,c(6,5)],puntosfuera)
    puntosfuera<- st_as_sf(puntosfuera)
    st_write(puntosfuera,dsn=paste(resultadosCell),layer="points_out_grid",driver="ESRI Shapefile")
  }
  puntosorig<-subset(puntosorig,!is.na(cellvalue))
  puntosorigshp<-SpatialPointsDataFrame(puntosorig[,c(6,5)],puntosorig)
  puntosorigshp<- st_as_sf(puntosorigshp)
  st_write(puntosorigshp,dsn=paste(resultadosCell),layer="final_analyzed_points",driver="ESRI Shapefile")
  
  ###Armado de tabla para Rebelo
  #lista de valores de celda mapa molde
  columnas<-unique(puntosorig$cellvalue)
  #lista genus-especies-subsp-elc
  filas<-unique(puntosorig$CHAIN)
  #Armaz?n
  tablafin<-matrix(data=0,nrow=length(filas),ncol=length(columnas))
  colnames(tablafin)<-columnas
  rownames(tablafin)<-filas
  for(i in 1:length(filas)){
    tabla1<-subset(puntosorig,puntosorig$CHAIN==paste(filas[i]))
    tabla1<-unique(tabla1$cellvalue)
    for (j in 1:length(columnas)){
      if(any(tabla1==colnames(tablafin)[j])){
        tablafin[i,j]<-1
      }
    }
  }
  #Se salva la tabla
  tablafin2<-cbind(as.character(filas),tablafin)
  colnames(tablafin2)[1]<-"Genus_Sp_Subtaxa_ELC"
  write.table(tablafin2,paste(resultadosCell,"/Tabla_Table_Base.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  write.table(tablafin2,paste(resultadosCell,"/Tabla_Table_Base.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  ####################
  #Tablas estad?sticas totales (sin eliminar por complementariedad)
  #por celdas
  suma_sum<- data.frame(apply(tablafin, 2, sum))
  suma_sum<-data.frame(rownames(suma_sum),suma_sum)
  colnames(suma_sum)[1]<-"CELL_ID"
  colnames(suma_sum)[2]<-"N_Dif_Taxa_ELC"
  write.table(suma_sum,paste(resultadosCell,"/Datos_por_Celda_Data_by_CELL.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  write.table(suma_sum,paste(resultadosCell,"/Datos_por_Celda_Data_by_CELL.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  #Por Especie
  suma_sum1<- data.frame(apply(tablafin, 1, sum))
  suma_sum1<-data.frame(rownames(suma_sum1),suma_sum1)
  colnames(suma_sum1)[1]<-"Taxon_ID_ELC"
  colnames(suma_sum1)[2]<-"N_Pops_in_CELLS"
  write.table(suma_sum1,paste(resultadosCell,"/Datos_por_Taxa_ELC_Data_by_Taxa_ELC.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  write.table(suma_sum1,paste(resultadosCell,"/Datos_por_Taxa_ELC_Data_by_Taxa_ELC.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
  #########COMPLEMENTARIEDAD############################
  ######################################################
  #Funci?n Rebelo modificada
  nspecies <- nrow(tablafin)
  nsites <- ncol(tablafin)
  res <- matrix(ncol=2, nrow=nsites)
  for (i in 1:nsites) {
    sitesppcount <- colSums(tablafin)
    nsp <- max(sitesppcount)
    if (nsp == 0) {break}
    selsite <- which(sitesppcount == nsp)[1]
    selsite2 <- names(selsite)
    res[i,1] <- selsite2
    res[i,2] <- nsp
    delspp <- as.vector(which(tablafin[,selsite]==1))
    tablafin[delspp,] <- 0
  }
  if(niveltax=="genus"){
    colnames(res) <- c("Celda_Cell", "nGenero_nGenus")
    if(mapaelcf){
      colnames(res) <- c("Celda_Cell", "nGeneroELC_nGenusELC")
    }
  }
  if(niveltax=="species"){
    colnames(res) <- c("Celda_Cell", "nEspecies_nSpecies")
    if(mapaelcf){
      colnames(res) <- c("Celda_Cell", "nEspeciesELC_nSpeciesELC")
    }
  }
  if(niveltax=="subtaxa"){
    colnames(res) <- c("Celda_Cell", "nSubtaxon_nSubtaxa")
    if(mapaelcf){
      colnames(res) <- c("Celda_Cell", "nSubtaxonELC_nSubtaxaELC")
    }
  }
  
  #Si es de celdas
  write.table(res,paste(resultadosCell,"/Tabla_final_Final_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(res,paste(resultadosCell,"/Tabla_final_Final_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  
  #Producci?n mapa resultado
  res<-data.frame(res)
  selected<-subset(res, !is.na(res$Celda_Cell))
  selected1<-vector()
  for(i in 1:nrow(selected)){
    selected1[i]<-as.numeric(paste(selected[i,1]))
  }
  selected2<-vector()
  for(i in 1:nrow(selected)){
    selected2[i]<-as.numeric(paste(selected[i,2]))
  }
  selected<-data.frame(cbind(selected1,selected2))
  colnames(selected)[1]<-"CELL_ID"
  colnames(selected)[2]<-"N_Taxa"
  
  #Transformaci?n raster base a raster resultados
  bbb<-subs(aaa,selected,by=1,which=2,subsWithNA=TRUE)
  writeRaster(bbb,filename=paste(resultadosCell,"/Complementa_map.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(bbb,filename=paste(resultadosCell,"/Complementa_map.tif",sep=""),overwrite=T,datatype='FLT4S')
  
  #An?lisis top-celdas
  N.Considered.Cells<-nceldas
  Total.Complemental.Cells<-length(selected[,1])
  Perc.Considered.Cells<-100*(nceldas/Total.Complemental.Cells)
  Selected_CELL_ID<-paste(res[1:nceldas,1])
  Taxa.Covered.Considered.Cells<-sum(as.numeric(paste(res[1:nceldas,2])))
  Total.Taxa.Included<-length(filas)
  Perc.Taxa.Covered<-100*(Taxa.Covered.Considered.Cells/length(filas))
  ccc<-data.frame(Selected_CELL_ID)
  colnames(ccc)[1]<-"CELL_ID"
  suma_sum<-merge(suma_sum,ccc, by="CELL_ID",all.y=TRUE)
  Total.Pop.Covered<-sum(suma_sum[,2])
  Perc.Pop.Covered<-100*(Total.Pop.Covered/length(puntosorig[,1]))
  Parametros.Parameters<-c("N.Considered.Cells","Total.Complemental.Cells","Perc.Considered.Cells",
                           "Selected_CELL_ID","Taxa.Covered.Considered.Cells","Total.Taxa.Included","Perc.Taxa.Covered","Total.Pop.Covered",
                           "Perc.Pop.Covered")
  Valores.Values<-c(paste(N.Considered.Cells),paste(Total.Complemental.Cells),paste(Perc.Considered.Cells),
                    paste(Selected_CELL_ID,collapse=", "),paste(Taxa.Covered.Considered.Cells),paste(Total.Taxa.Included),
                    paste(Perc.Taxa.Covered),paste(Total.Pop.Covered),
                    paste(Perc.Pop.Covered))
  stat.top.celdas<-data.frame(cbind(Parametros.Parameters,Valores.Values))
  write.table(stat.top.celdas,paste(resultadosCell,"/Tabla_Estadisticas_Stats_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(stat.top.celdas,paste(resultadosCell,"/Tabla_Estadisticas_Stats_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  tabla_especies<-as.data.frame(puntosorigshp)
  cellvector<-data.frame(as.numeric(paste(res[1:nceldas,1])))
  colnames(cellvector)[1]<-"cellvalue"
  sp_corte<-merge(tabla_especies,cellvector,by="cellvalue",all.y=TRUE)
  write.table(sp_corte,paste(resultadosCell,"/Tabla_Pob_en_Top_Celdas_Table_Pop_in_Top_Cells.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(sp_corte,paste(resultadosCell,"/Tabla_Pob_en_Top_Celdas_Table_Pop_in_Top_Cells.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
}

############################################################
############################################################
#An?lisis por Areas de la WDPA
############################################################
if(areas){
    #puntosorig<-puntosorig[,1:10]
    
    #########################################################
    #####Por ?reas de la WDPA###################
  if(WDPA){
    #creaci?n directorio para an?lisis de celdas
    setwd(paste(resultados))
    dir.create(as.vector(paste("AnalisisWDPA_WDPAAnalysis")))
    resultadosWDPA<-paste(resultados,"/AnalisisWDPA_WDPAAnalysis",sep="")
    #Carga de mapa WDPA
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
    setwd(paste(ruta,"/wdpa",sep=""))
    load(paste(pais,".RData",sep=""))
    #Creaci?n de puntos
    puntos<-SpatialPoints(puntosorig[,c(6,5)])
    #extracci?n y conformaci?n tabla
    wdpa<-over(puntos,aaa)
    tablatotal<-cbind(puntosorig,wdpa)
    write.table(tablatotal,paste(resultadosWDPA,"/Tabla_Pob_en_fuera_WDPA_Table_Pop_in_out_WDPA.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablatotal,paste(resultadosWDPA,"/Tabla_Pob_en_fuera_WDPA_Table_Pop_in_out_WDPA.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    if(coveran){
      setwd(paste(resultadosWDPA))
      dir.create(as.vector(paste("CoverageAnalysis")))
      resultadosCOVERAN<-paste(resultados,"/AnalisisWDPA_WDPAAnalysis/CoverageAnalysis",sep="")
      tablain<-subset(tablatotal,!is.na(wdpaid))
      tablaout<-subset(tablatotal,is.na(wdpaid))
      areasWDPA<-data.frame(table(tablain$wdpaid))
      colnames(areasWDPA)[1]<-"wdpaid"
      colnames(areasWDPA)[2]<-"N_Pops"
      N_Diff_Taxa<-vector()
      for(i in 1:length(areasWDPA[,1])){
        ttt<-subset(tablain,wdpaid==areasWDPA[i,1])
        N_Diff_Taxa[i]<-length(unique(ttt$CHAIN))
      }
      areasWDPA<-cbind(areasWDPA,N_Diff_Taxa)
      write.table(areasWDPA,paste(resultadosCOVERAN,"/Tabla_AreasWDPA_Cubriendo_AreasWDPA_Covering_Table.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      write.table(areasWDPA,paste(resultadosCOVERAN,"/Tabla_AreasWDPA_Cubriendo_AreasWDPA_Covering_Table.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      eee<-aaa@data
      eee<-match(areasWDPA$wdpaid,eee$wdpaid)
      ttt<-aaa[eee,]
      areasWDPA<-areasWDPA[,-1]
      rownames(areasWDPA)<-rownames(ttt@data)
      ttt<-spCbind(ttt,areasWDPA)
      ttt<- st_as_sf(ttt)
      st_write(ttt,dsn=paste(resultadosCOVERAN),layer="CoverWDPAmap",driver="ESRI Shapefile")
      taxain<-data.frame(table(tablain$CHAIN))
      colnames(taxain)[1]<-"Taxa"
      colnames(taxain)[2]<-"Pops_Conserved"
      taxatotal<-data.frame(table(tablatotal$CHAIN))
      colnames(taxatotal)[1]<-"Taxa_TaxaELC"
      colnames(taxatotal)[2]<-"Total_N_Pops"
      taxa<-merge(taxatotal,taxain,by.x="Taxa_TaxaELC",by.y="Taxa",all.x=TRUE)
      colnames(taxa)[3]<-"Pops_in_WDPA"
      Perc_Pops_in<-100*(taxa$Pops_in_WDPA/taxa$Total_N_Pops)
      taxa<-cbind(taxa,Perc_Pops_in)
      write.table(taxa,paste(resultadosCOVERAN,"/Tabla_Taxa_Cubiertos_Table_Taxa_Covered.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      write.table(taxa,paste(resultadosCOVERAN,"/Tabla_Taxa_Cubiertos_Table_Taxa_Covered.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      #TablaStats
      Pops_Covered<-sum(areasWDPA$N_Pops)
      Perc_Pops_Covered<-100*(Pops_Covered/nrow(puntosorig))
      ntaxain<-length(unique(tablain$CHAIN))
      ntaxatot<-length(unique(tablatotal$CHAIN))
      Taxa_Covered<-ntaxain
      Perc_Taxa_Covered<-100*(ntaxain/ntaxatot)
      N_WDPA_Cov_Pops<-length(unique(tablain$wdpaid))
      Perc_WDPA_Cov<-100*(N_WDPA_Cov_Pops/nrow(aaa@data))
      Parametros.Parameters<-c("Pops_Covered","Perc_Pops_Covered",
                               "Taxa_Covered","Perc_Taxa_Covered",
                               "N_WDPA_Cov_Pops","Perc_WDPA_Cov")
      Valores.Values<-c(paste(Pops_Covered),paste(Perc_Pops_Covered),
                        paste(Taxa_Covered),paste(Perc_Taxa_Covered),
                        paste(N_WDPA_Cov_Pops),paste(Perc_WDPA_Cov))
      stat.cov.areas<-data.frame(cbind(Parametros.Parameters,Valores.Values))
      write.table(stat.cov.areas,paste(resultadosCOVERAN,"/Tabla_Estadisticas_Cobertura_Stats_Table_Coverage.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(stat.cov.areas,paste(resultadosCOVERAN,"/Tabla_Estadisticas_Cobertura_Stats_Table_Coverage.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    puntosorig<-tablatotal[,1:11]
    puntosorig1<-subset(puntosorig,!is.na(wdpaid))
    
    #Arreglo tabla para complementariedad
    ###Armado de tabla para Rebelo
    #lista de valores de celda mapa molde
    columnas<-unique(puntosorig1$wdpaid)
    #lista genus-especies-subsp-elc
    filas<-unique(puntosorig1$CHAIN)
    #Armaz?n
    tablafin<-matrix(data=0,nrow=length(filas),ncol=length(columnas))
    colnames(tablafin)<-columnas
    rownames(tablafin)<-filas
    for(i in 1:length(filas)){
      tabla1<-subset(puntosorig1,puntosorig1$CHAIN==paste(filas[i]))
      tabla1<-unique(tabla1$wdpaid)
      for (j in 1:length(columnas)){
        if(any(tabla1==colnames(tablafin)[j])){
          tablafin[i,j]<-1
        }
      }
    }
    #Se salva la tabla
    tablafin2<-cbind(as.character(filas),tablafin)
    colnames(tablafin2)[1]<-"Genus_Sp_Subtaxa_ELC"
    write.table(tablafin2,paste(resultadosWDPA,"/Tabla_Table_Base.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
    write.table(tablafin2,paste(resultadosWDPA,"/Tabla_Table_Base.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
    
    #########COMPLEMENTARIEDAD############################
    ######################################################
    #Funci?n Rebelo modificada
    nspecies <- nrow(tablafin)
    nsites <- ncol(tablafin)
    res <- matrix(ncol=2, nrow=nsites)
    for (i in 1:nsites) {
      sitesppcount <- colSums(tablafin)
      nsp <- max(sitesppcount)
      if (nsp == 0) {break}
      selsite <- which(sitesppcount == nsp)[1]
      selsite2 <- names(selsite)
      res[i,1] <- selsite2
      res[i,2] <- nsp
      delspp <- as.vector(which(tablafin[,selsite]==1))
      tablafin[delspp,] <- 0
    }
    if(niveltax=="genus"){
      colnames(res) <- c("wdpaid", "nGenero_nGenus")
      if(mapaelcf){
        colnames(res) <- c("wdpaid", "nGeneroELC_nGenusELC")
      }
    }
    if(niveltax=="species"){
      colnames(res) <- c("wdpaid", "nEspecies_nSpecies")
      if(mapaelcf){
        colnames(res) <- c("wdpaid", "nEspeciesELC_nSpeciesELC")
      }
    }
    if(niveltax=="subtaxa"){
      colnames(res) <- c("wdpaid", "nSubtaxon_nSubtaxa")
      if(mapaelcf){
        colnames(res) <- c("wdpaid", "nSubtaxonELC_nSubtaxaELC")
      }
    }
    
    #Si es de Areas
    write.table(res,paste(resultadosWDPA,"/Tabla_final_Final_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(res,paste(resultadosWDPA,"/Tabla_final_Final_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    
    #Producci?n mapa resultado
    res<-data.frame(res)
    selected<-subset(res, !is.na(res$wdpaid))
    selected1<-vector()
    for(i in 1:nrow(selected)){
      selected1[i]<-as.numeric(paste(selected[i,1]))
    }
    selected2<-vector()
    for(i in 1:nrow(selected)){
      selected2[i]<-as.numeric(paste(selected[i,2]))
    }
    selected<-data.frame(cbind(selected1,selected2))
    colnames(selected)[1]<-"wdpaid"
    colnames(selected)[2]<-"N_Taxa"
    selected2<-aaa$wdpaid
    indice<-match(selected$wdpaid,selected2)
    bbb<-aaa[indice,]
    N_Taxa<-selected$N_Taxa
    bbb<-spCbind(bbb,N_Taxa)
    #exportar mapas y puntos
    puntos<-SpatialPointsDataFrame(tablatotal[,c(6,5)],tablatotal)
    
    puntos<- st_as_sf(puntos)
    st_write(puntos,dsn=paste(resultadosWDPA),layer="final_analyzed_points",driver="ESRI Shapefile")
    aaa<- st_as_sf(aaa)
    st_write(aaa,dsn=paste(resultadosWDPA),layer="TotalWDPAmap",driver="ESRI Shapefile")
    bbb<- st_as_sf(bbb)
    st_write(bbb,dsn=paste(resultadosWDPA),layer="ComplementaryWDPAmap",driver="ESRI Shapefile")
    
    #An?lisis top-?reas
    N.Considered.WDPA<-nareas
    Total.Complemental.WDPA<-length(selected[,1])
    Perc.Considered.WDPA<-100*(nareas/Total.Complemental.WDPA)
    Selected_WDPA_ID<-paste(res[1:nareas,1])
    Taxa.Covered.Considered.WDPA<-sum(as.numeric(paste(res[1:nareas,2])))
    Total.Taxa.Included<-length(filas)
    Perc.Taxa.Covered<-100*(Taxa.Covered.Considered.WDPA/length(filas))
    ccc<-data.frame(Selected_WDPA_ID)
    colnames(ccc)[1]<-"wdpaid"
    suma_sum<-merge(tablatotal,ccc, by="wdpaid",all.y=TRUE)
    Total.Pop.Covered<-length(suma_sum[,1])
    Perc.Pop.Covered<-100*(Total.Pop.Covered/length(tablatotal[,1]))
    Parametros.Parameters<-c("N.Considered.WDPA","Total.Complemental.WDPA","Perc.Considered.WDPA",
                             "Selected_WDPA_ID","Taxa.Covered.Considered.WDPA","Total.Taxa.Included","Perc.Taxa.Covered","Total.Pop.Covered",
                             "Perc.Pop.Covered")
    Valores.Values<-c(paste(N.Considered.WDPA),paste(Total.Complemental.WDPA),paste(Perc.Considered.WDPA),
                      paste(Selected_WDPA_ID,collapse=", "),paste(Taxa.Covered.Considered.WDPA),paste(Total.Taxa.Included),
                      paste(Perc.Taxa.Covered),paste(Total.Pop.Covered),
                      paste(Perc.Pop.Covered))
    stat.top.areas<-data.frame(cbind(Parametros.Parameters,Valores.Values))
    write.table(stat.top.areas,paste(resultadosWDPA,"/Tabla_Estadisticas_Stats_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stat.top.areas,paste(resultadosWDPA,"/Tabla_Estadisticas_Stats_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(suma_sum,paste(resultadosWDPA,"/Tabla_Pob_en_Top_WDPA_Table_Pop_in_Top_WDPA.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(suma_sum,paste(resultadosWDPA,"/Tabla_Pob_en_Top_WDPA_Table_Pop_in_Top_WDPA.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
}

################################################################  
################################################################
#####Por ?reas protegidas propios###############################
if(areas){
  #puntosorig<-puntosorig[,1:10]
  if(propio){
    #Directorio
    setwd(paste(resultados))
    #creaci?n directorio para an?lisis de ?reas propias
    dir.create(as.vector(paste("AnalisisAreasProt_ProtectedAreasAnalysis")))
    resultadosWDPA<-paste(resultados,"/AnalisisAreasProt_ProtectedAreasAnalysis",sep="")
    setwd(paste(ruta))
    #ingreso area protegida
    areasprot<-st_read(paste(ruta,"/wdpa/",nombre,".shp",sep=""))
    areasprot<-as_Spatial(areasprot)
    proj4string(areasprot)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    #Puntos
    puntos<-SpatialPoints(puntosorig[,c(6,5)])
    proj4string(puntos)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
    #extracci?n y conformaci?n tabla
    wdpa<-over(puntos,areasprot)
    tablatotal<-cbind(puntosorig,wdpa)
    write.table(tablatotal,paste(resultadosWDPA,"/Tabla_Pob_en_fuera_AreasProt_Table_Pop_in_out_ProtAreas.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablatotal,paste(resultadosWDPA,"/Tabla_Pob_en_fuera_AreasProt_Table_Pop_in_out_ProtAreas.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    if(coveran){
      setwd(paste(resultadosWDPA))
      dir.create(as.vector(paste("CoverageAnalysis")))
      resultadosCOVERAN<-paste(resultados,"/AnalisisAreasProt_ProtectedAreasAnalysis/CoverageAnalysis",sep="")
      ind1<-match(campo,colnames(tablatotal))
      tablain<-subset(tablatotal,!is.na(tablatotal[,ind1]))
      tablaout<-subset(tablatotal,is.na(tablatotal[,ind1]))
      ind2<-match(campo,colnames(tablain))
      areasWDPA<-data.frame(table(tablain[,ind2]))
      colnames(areasWDPA)[1]<-campo
      colnames(areasWDPA)[2]<-"N_Pops"
      N_Diff_Taxa<-vector()
      for(i in 1:length(areasWDPA[,1])){
        ttt<-subset(tablain,tablain[,ind2]==areasWDPA[i,1])
        N_Diff_Taxa[i]<-length(unique(ttt$CHAIN))
      }
      areasWDPA<-cbind(areasWDPA,N_Diff_Taxa)
      write.table(areasWDPA,paste(resultadosCOVERAN,"/Tabla_AreasProt_Cubriendo_ProtAreas_Covering_Table.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      write.table(areasWDPA,paste(resultadosCOVERAN,"/Tabla_AreasProt_Cubriendo_ProtAreas_Covering_Table.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      eee<-areasprot@data
      ind3<-match(campo,colnames(eee))
      eee<-match(areasWDPA[,1],eee[,ind3])
      ttt<-areasprot[eee,]
      areasWDPA<-areasWDPA[,-1]
      rownames(areasWDPA)<-rownames(ttt@data)
      ttt<-spCbind(ttt,areasWDPA)
      ttt<- st_as_sf(ttt)
      st_write(ttt,dsn=paste(resultadosCOVERAN),layer="CoverAREASmap",driver="ESRI Shapefile")
      taxain<-data.frame(table(tablain$CHAIN))
      colnames(taxain)[1]<-"Taxa"
      colnames(taxain)[2]<-"Pops_Conserved"
      taxatotal<-data.frame(table(tablatotal$CHAIN))
      colnames(taxatotal)[1]<-"Taxa_TaxaELC"
      colnames(taxatotal)[2]<-"Total_N_Pops"
      taxa<-merge(taxatotal,taxain,by.x="Taxa_TaxaELC",by.y="Taxa",all.x=TRUE)
      colnames(taxa)[3]<-"Pops_in_AREAS"
      Perc_Pops_in<-100*(taxa$Pops_in_AREAS/taxa$Total_N_Pops)
      taxa<-cbind(taxa,Perc_Pops_in)
      write.table(taxa,paste(resultadosCOVERAN,"/Tabla_Taxa_Cubiertos_Table_Taxa_Covered.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      write.table(taxa,paste(resultadosCOVERAN,"/Tabla_Taxa_Cubiertos_Table_Taxa_Covered.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
      #TablaStats
      Pops_Covered<-sum(areasWDPA$N_Pops)
      Perc_Pops_Covered<-100*(Pops_Covered/nrow(puntosorig))
      ntaxain<-length(unique(tablain$CHAIN))
      ntaxatot<-length(unique(tablatotal$CHAIN))
      Taxa_Covered<-ntaxain
      Perc_Taxa_Covered<-100*(ntaxain/ntaxatot)
      N_Areas_Cov_Pops<-length(unique(tablain[,ind2]))
      Perc_Areas_Cov<-100*(N_Areas_Cov_Pops/nrow(areasprot@data))
      Parametros.Parameters<-c("Pops_Covered","Perc_Pops_Covered",
                               "Taxa_Covered","Perc_Taxa_Covered",
                               "N_Areas_Cov_Pops","Perc_Areas_Cov")
      Valores.Values<-c(paste(Pops_Covered),paste(Perc_Pops_Covered),
                        paste(Taxa_Covered),paste(Perc_Taxa_Covered),
                        paste(N_Areas_Cov_Pops),paste(Perc_Areas_Cov))
      stat.cov.areas<-data.frame(cbind(Parametros.Parameters,Valores.Values))
      write.table(stat.cov.areas,paste(resultadosCOVERAN,"/Tabla_Estadisticas_Cobertura_Stats_Table_Coverage.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(stat.cov.areas,paste(resultadosCOVERAN,"/Tabla_Estadisticas_Cobertura_Stats_Table_Coverage.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    campo1<-tablatotal[,campo]
    puntosorig<-cbind(puntosorig,campo1)
    colnames(puntosorig)[ncol(puntosorig)]<-campo
    puntosorig1<-subset(puntosorig,!is.na(puntosorig[,ncol(puntosorig)]))
    
    #Arreglo tabla para complementariedad
    ###Armado de tabla para Rebelo
    #lista de valores de celda mapa molde
    columnas<-unique(puntosorig1[,ncol(puntosorig1)])
    #lista genus-especies-subsp-elc
    filas<-unique(puntosorig1$CHAIN)
    #Armaz?n
    tablafin<-matrix(data=0,nrow=length(filas),ncol=length(columnas))
    colnames(tablafin)<-columnas
    rownames(tablafin)<-filas
    for(i in 1:length(filas)){
      tabla1<-subset(puntosorig1,puntosorig1$CHAIN==paste(filas[i]))
      tabla1<-unique(tabla1[,ncol(tabla1)])
      for (j in 1:length(columnas)){
        if(any(tabla1==colnames(tablafin)[j])){
          tablafin[i,j]<-1
        }
      }
    }
    #Se salva la tabla
    tablafin2<-cbind(as.character(filas),tablafin)
    colnames(tablafin2)[1]<-"Genus_Sp_Subtaxa_ELC"
    write.table(tablafin2,paste(resultadosWDPA,"/Tabla_Table_Base.txt",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
    write.table(tablafin2,paste(resultadosWDPA,"/Tabla_Table_Base.xls",sep=""), sep = "\t", row.names = FALSE, col.names=TRUE, qmethod = "double")
    
    #########COMPLEMENTARIEDAD############################
    ######################################################
    #Funci?n Rebelo modificada
    nspecies <- nrow(tablafin)
    nsites <- ncol(tablafin)
    res <- matrix(ncol=2, nrow=nsites)
    for (i in 1:nsites) {
      sitesppcount <- colSums(tablafin)
      nsp <- max(sitesppcount)
      if (nsp == 0) {break}
      selsite <- which(sitesppcount == nsp)[1]
      selsite2 <- names(selsite)
      res[i,1] <- selsite2
      res[i,2] <- nsp
      delspp <- as.vector(which(tablafin[,selsite]==1))
      tablafin[delspp,] <- 0
    }
    if(niveltax=="genus"){
      colnames(res) <- c("areaID", "nGenero_nGenus")
      if(mapaelcf){
        colnames(res) <- c("areaID", "nGeneroELC_nGenusELC")
      }
    }
    if(niveltax=="species"){
      colnames(res) <- c("areaID", "nEspecies_nSpecies")
      if(mapaelcf){
        colnames(res) <- c("areaID", "nEspeciesELC_nSpeciesELC")
      }
    }
    if(niveltax=="subtaxa"){
      colnames(res) <- c("areaID", "nSubtaxon_nSubtaxa")
      if(mapaelcf){
        colnames(res) <- c("areaID", "nSubtaxonELC_nSubtaxaELC")
      }
    }
    
    #Si es de Areas
    write.table(res,paste(resultadosWDPA,"/Tabla_final_Final_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(res,paste(resultadosWDPA,"/Tabla_final_Final_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    
    #Producci?n mapa resultado
    res<-data.frame(res)
    selected<-subset(res, !is.na(res$areaID))
    colnames(selected)[1]<-"areaID"
    colnames(selected)[2]<-"N_Taxa"
    selected2<-areasprot@data
    selected2<-paste(selected2[,campo])
    indice<-match(selected$areaID,selected2)
    bbb<-areasprot[indice,]
    N_Taxa<-as.numeric(paste(selected$N_Taxa))
    bbb<-spCbind(bbb,N_Taxa)
    #exportar mapas y puntos
    if(!WDPA){
      puntos<-SpatialPointsDataFrame(tablatotal[,c(6,5)],tablatotal)
      puntos<- st_as_sf(puntos)
      st_write(puntos,dsn=paste(resultadosWDPA),layer="final_analyzed_points",driver="ESRI Shapefile")
    }
    bbb<- st_as_sf(bbb)
    st_write(bbb,dsn=paste(resultadosWDPA),layer="ComplementAreas",driver="ESRI Shapefile")
    #An?lisis top-?reas
    N.Considered.Areas<-nareas
    Total.Complemental.Areas<-length(selected[,1])
    Perc.Considered.Areas<-100*(nareas/Total.Complemental.Areas)
    Selected_Areas_ID<-paste(res[1:nareas,1])
    Taxa.Covered.Considered.Areas<-sum(as.numeric(paste(res[1:nareas,2])))
    Total.Taxa.Included<-length(filas)
    Perc.Taxa.Covered<-100*(Taxa.Covered.Considered.Areas/length(filas))
    ccc<-data.frame(Selected_Areas_ID)
    colnames(ccc)[1]<-campo
    suma_sum<-merge(tablatotal,ccc, by=campo,all.y=TRUE)
    Total.Pop.Covered<-length(suma_sum[,1])
    Perc.Pop.Covered<-100*(Total.Pop.Covered/length(tablatotal[,1]))
    Parametros.Parameters<-c("N.Considered.Areas","Total.Complemental.Areas","Perc.Considered.Areas",
                             "Selected_Areas_ID","Taxa.Covered.Considered.Areas","Total.Taxa.Included","Perc.Taxa.Covered","Total.Pop.Covered",
                             "Perc.Pop.Covered")
    Valores.Values<-c(paste(N.Considered.Areas),paste(Total.Complemental.Areas),paste(Perc.Considered.Areas),
                      paste(Selected_Areas_ID,collapse=", "),paste(Taxa.Covered.Considered.Areas),paste(Total.Taxa.Included),
                      paste(Perc.Taxa.Covered),paste(Total.Pop.Covered),
                      paste(Perc.Pop.Covered))
    stat.top.areas<-data.frame(cbind(Parametros.Parameters,Valores.Values))
    write.table(stat.top.areas,paste(resultadosWDPA,"/Tabla_Estadisticas_Stats_Table_Complementa.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(stat.top.areas,paste(resultadosWDPA,"/Tabla_Estadisticas_Stats_Table_Complementa.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(suma_sum,paste(resultadosWDPA,"/Tabla_Pob_en_Top_Areas_Table_Pop_in_Top_Areas.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(suma_sum,paste(resultadosWDPA,"/Tabla_Pob_en_Top_Areas_Table_Pop_in_Top_Areas.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
}