######################################################################
# Script  de la herramienta FIGS_R - FIGS_R Tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2024
######################################################################

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
write(paste(), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write("______Herramienta/Tool FIGS_R________", file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("controlelc:", controlelc,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("statelc:", statelc,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("availab:", availab,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("soloavailab:", soloavailab,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("buffy:", buffy,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("tamp:", tamp,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1v:", variab1v,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1rang:", variab1rang,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1min:", variab1min,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1max:", variab1max,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1cola:", variab1cola,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1vpor:", variab1vpor,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab1vhl:", variab1vhl,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2v:", variab2v,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2rang:", variab2rang,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2min:", variab2min,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2max:", variab2max,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2cola:", variab2cola,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2vpor:", variab2vpor,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab2vhl:", variab2vhl,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3v:", variab3v,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3rang:", variab3rang,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3min:", variab3min,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3max:", variab3max,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3cola:", variab3cola,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3vpor:", variab3vpor,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)
write(paste("variab3vhl:", variab3vhl,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)

write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.FIGS_R.txt", append=TRUE)

##Elemento introducido por el usuario: ruta (ext)
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO R_FIGS________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

##########################################################

write("1.Terminado proceso de fijaci?n de ruta de la herramienta", file="Error/process_info.txt", append=TRUE)

#activar paquetes ya instalados y necesarios
#Check e instalacion si a lugar
packages2<-vector()
if(system.file(package="sp")==""){
  packages2<-append(packages2,"sp")
}
if(system.file(package="raster")==""){
  packages2<-append(packages2,"raster")
}
if(system.file(package="msf")==""){
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
write("2.Terminado proceso de carga de paquetes", file="Error/process_info.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

#########################
##### Inicio#######
#########################
#Intro pa?s y resoluci?n
#Transformaci?n pais uppercase to lowercase
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
#introducci?n del mapa elc
if (controlelc){
  mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
}
#introducci?n datos pasaporte
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
#Eliminaci?n entradas bajo umbral geoqual
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}
#Extracci?n ELC para pasaporte total pasaporte (si a lugar)
if (controlelc){
  puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  BGcat<-extract(mapaelc,puntosBG)
  pasaporte<-data.frame(pasaporte,BGcat)
}
#Correcci?n errores introducci?n parametros en FIGS_R
#correcci?n error cuando usuario pide variable 3 sin 2
if(!variab2){
  variab3<-FALSE
}
if(!variab2){
  variab2rang<-FALSE
  variab2cola<-FALSE
}
if(!variab3){
  variab3rang<-FALSE
  variab3cola<-FALSE
}
if(variab2rang){
  variab2cola<-FALSE
}
if(variab3rang){
  variab3cola<-FALSE
}
if(!availab){
  soloavailab<-FALSE
}
write("3.Terminado proceso de carga de datos y extracci?n de categor?a ELC (en su caso)", file="Error/process_info.txt", append=TRUE)
#####################################################
#Extracci?n variables
if(controlelc){
  tabla<-pasaporte[,c("ACCENUMB","DECLATITUDE","DECLONGITUDE","AVAILAB","BGcat")]
}
if(!controlelc){
  tabla<-pasaporte[,c("ACCENUMB","DECLATITUDE","DECLONGITUDE","AVAILAB")]
}
tabla1<-data.frame(tabla$ACCENUMB)
colnames(tabla1)[1]<-"ACCENUMB"
if(buffy){
  tamp<-tamp*0.008333
}
#carga de lista de variables
#Condicional figvartotal por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("figvartotal.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  figvartotal<-read.delim("figvartotal.txt")
}
rm(abcd)
rm(loadError)

#Elemento introducido por el usuario: variab1v
#Traducci?n de variables desde java a lista de variables
variab1v<-as.data.frame(variab1v)
colnames(variab1v)[1]<-"VARDESCR"
variab1v<-merge(figvartotal,variab1v, by="VARDESCR", all=FALSE)
variab1v<-as.character(variab1v[,3])
name1<-variab1v
#Variable1
variab1v<-raster(paste("rdatamaps/",pais,"/",resol,"/",variab1v,".tif",sep=""))
write("4.Preparaci?n para extracci?n varaibles 1, 2 y 3", file="Error/process_info.txt", append=TRUE)
#Extracci?n de informaci?n de tres variables
#variable1
if(!buffy){
  extract1<-extract(variab1v,tabla[,c("DECLONGITUDE","DECLATITUDE")])
}
if(buffy){
  extract1<-extract(variab1v,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
}
extract1<-data.frame(tabla[,1],extract1)
colnames(extract1)[1]<-"ACCENUMB"
colnames(extract1)[2]<-paste(name1)
#consolidaci?n tabla 
ecogeot1<-merge(tabla1,extract1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
#Para cuando se usa m?s de una variable (hasta 3)
if(variab2){
  #Elemento introducido por el usuario: variab2v
  #Traducci?n de variables desde java a lista de variables
  variab2v<-as.data.frame(variab2v)
  colnames(variab2v)[1]<-"VARDESCR"
  variab2v<-merge(figvartotal,variab2v, by="VARDESCR", all=FALSE)
  variab2v<-as.character(variab2v[,3])
  name2<-variab2v
  #variable2
  variab2v<-raster(paste("rdatamaps/",pais,"/",resol,"/",variab2v,".tif",sep=""))
  #Extracci?n de informaci?n
  #VARIABLE2
  if(!buffy){
    extract2<-extract(variab2v,tabla[,c("DECLONGITUDE","DECLATITUDE")])
  }
  if(buffy){
    extract2<-extract(variab2v,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
  }
  extract2<-data.frame(tabla[,1],extract2)
  colnames(extract2)[1]<-"ACCENUMB"
  colnames(extract2)[2]<-paste(name2)
  #consolidaci?n tabla variable2
  ecogeot2<-merge(tabla1,extract2,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
if(variab3){
  #Elemento introducido por el usuario: variab3v
  #Traducci?n de variables desde java a lista de variables
  variab3v<-as.data.frame(variab3v)
  colnames(variab3v)[1]<-"VARDESCR"
  variab3v<-merge(figvartotal,variab3v, by="VARDESCR", all=FALSE)
  variab3v<-as.character(variab3v[,3])
  name3<-variab3v
  #armado de stacks
  variab3v<-raster(paste("rdatamaps/",pais,"/",resol,"/",variab3v,".tif",sep=""))
  #Extracci?n de informaci?n
  #VARIABLE3
  if(!buffy){
    extract3<-extract(variab3v,tabla[,c("DECLONGITUDE","DECLATITUDE")])
  }
  if(buffy){
    extract3<-extract(variab3v,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
  }
  extract3<-data.frame(tabla[,1],extract3)
  colnames(extract3)[1]<-"ACCENUMB"
  colnames(extract3)[2]<-paste(name3)
  #consolidaci?n tabla variable3
  ecogeot3<-merge(tabla1,extract3,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
#Tabla final ecogeot
#usando tres variables
if(variab2&variab3){
  ecogeot<-merge(tabla,ecogeot1,by="ACCENUMB",sort=FALSE)
  ecogeot<-merge(ecogeot,ecogeot2,by="ACCENUMB",sort=FALSE)
  ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB",sort=FALSE)
}
#usando dos variables
if(variab2&!variab3){
  ecogeot<-merge(tabla,ecogeot1,by="ACCENUMB",sort=FALSE)
  ecogeot<-merge(ecogeot,ecogeot2,by="ACCENUMB",sort=FALSE)
}
#usando una variable
if(!variab2&!variab3|!variab2&variab3){
  ecogeot<-merge(tabla,ecogeot1,by="ACCENUMB",sort=FALSE)
}
#Exportando tabla ecogeot
write("5.Terminado proceso de extracci?n de variables 1, 2 y 3, inicio filtrado", file="Error/process_info.txt", append=TRUE)
#######################################################
#Filtrado
#######################################################
#Pasaporte sin duplicados espaciales
if (mean(ecogeot$DECLATITUDE)<23&mean(ecogeot$DECLATITUDE> -23)){
  distdup1<-distdup*0.00833
}
if ((mean(ecogeot$DECLATITUDE)>23&mean(ecogeot$DECLATITUDE)<45)|(mean(ecogeot$DECLATITUDE)< -23&mean(ecogeot$DECLATITUDE)> -45)){
  distdup1<-distdup*0.00975
}
if ((mean(ecogeot$DECLATITUDE)>45&mean(ecogeot$DECLATITUDE)<67)|(mean(ecogeot$DECLATITUDE)< -45&mean(ecogeot$DECLATITUDE)> -67)){
  distdup1<-distdup*0.0127
}
if (mean(ecogeot$DECLATITUDE)>67|mean(ecogeot$DECLATITUDE)< -67){
  distdup1<-distdup*0.02299
}
if(availab&!soloavailab){
  ecogeot1<-subset(ecogeot,AVAILAB==1)
  ecogeot2<-subset(ecogeot,AVAILAB!=1|is.na(AVAILAB))
  puntosBG1<-SpatialPointsDataFrame(ecogeot1[,c("DECLONGITUDE","DECLATITUDE")],ecogeot1,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  puntosBG2<-SpatialPointsDataFrame(ecogeot2[,c("DECLONGITUDE","DECLATITUDE")],ecogeot2,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  elimdupli<-as.data.frame(zerodist2(puntosBG1, puntosBG2,zero=distdup1))
  elimdupli<-unique(elimdupli[,2])*-1
  ecogeot2<-ecogeot2[elimdupli,]
  ecogeot2<-rbind(ecogeot1,ecogeot2)
  puntosBG2<-SpatialPointsDataFrame(ecogeot2[,c("DECLONGITUDE","DECLATITUDE")],ecogeot2,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  puntosBG2<-remove.duplicates(puntosBG2,zero=distdup1)
  #reconstrucci?n de los pasaportes
  pasaporte2<-puntosBG2@data
}
if(availab&soloavailab){
  ecogeot1<-subset(ecogeot,AVAILAB==1)
  puntosBG1<-SpatialPointsDataFrame(ecogeot1[,c("DECLONGITUDE","DECLATITUDE")],ecogeot1,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  puntosBG2<-remove.duplicates(puntosBG1,zero=distdup1)
  #reconstrucci?n de los pasaportes
  pasaporte2<-puntosBG2@data
}
if(!availab){
  puntosBG<-SpatialPointsDataFrame(ecogeot[,c("DECLONGITUDE","DECLATITUDE")],ecogeot,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
  #reconstrucci?n de los pasaportes
  pasaporte2<-puntosBG@data
}
write("6.Terminado adecuaci?n pasaporte y pasaporte2 con y sin datos disponibilidad", file="Error/process_info.txt", append=TRUE)
#filtro variable 1
if (controlelc){
  if (variab1rang){
    figs1<-subset(pasaporte2, pasaporte2[6]>variab1min&pasaporte2[6]<variab1max) 
  }
  if (!variab1rang){
    if (variab1cola){
      nfigs<-round(nrow(pasaporte2)*(variab1vpor/100),digits=0)
      if (variab1vhl=="high"){
        i <- order(pasaporte2[6],decreasing=TRUE)
        pasaporte2 <- pasaporte2[i,]
        figs1<-pasaporte2[1:nfigs,]
      }
      if (variab1vhl=="low"){
        i <- order(pasaporte2[6],decreasing=FALSE)
        pasaporte2 <- pasaporte2[i,]
        figs1<-pasaporte2[1:nfigs,]
      }  
    }
  }
  #filtro variable2
  if(variab2){
  if(nrow(figs1)>0){
      if (variab2rang){
        figs2<-subset(figs1, figs1[7]>variab2min&figs1[7]<variab2max)
        figss2<-TRUE
      }
      if (!variab2rang){
        if (variab2cola){
          nfigs<-round(nrow(figs1)*(variab2vpor/100),digits=0)
          if (variab2vhl=="high"){
            i <- order(figs1[7],decreasing=TRUE)
            figs1 <- figs1[i,]
            figs2<-figs1[1:nfigs,]
            figss2<-TRUE
          }
          if (variab2vhl=="low"){
            i <- order(figs1[7],decreasing=FALSE)
            figs1 <- figs1[i,]
            figs2<-figs1[1:nfigs,]
            figss2<-TRUE
          }  
        }
      }
    }
  }
  if(nrow(figs1)==0){
   figss2<-FALSE
   figss3<-FALSE
  }
  #filtro variable3
  if(variab3&variab2){
  if(figss2&nrow(figs2)>0){
        if (variab3rang){
          figs3<-subset(figs2, figs2[8]>variab3min&figs2[8]<variab3max)
          figss3<-TRUE
        }
        if(!variab3rang){
          if (variab3cola){
            nfigs<-round(nrow(figs2)*(variab3vpor/100),digits=0)
            if (variab3vhl=="high"){
              i <- order(figs2[8],decreasing=TRUE)
              figs2 <- figs2[i,]
              figs3<-figs2[1:nfigs,]
              figss3<-TRUE
            }
            if (variab3vhl=="low"){
              i <- order(figs2[8],decreasing=FALSE)
              figs2 <- figs2[i,]
              figs3<-figs2[1:nfigs,]
              figss3<-TRUE
            }
          }
        }
      }
      if ((!variab3&!variab2)|(!variab3&variab2)){
        figss3<-FALSE
      }
  }
  if(variab2){
    if(nrow(figs2)==0){
      figss3<-FALSE
    }
  }
}
if (!controlelc){
  if (variab1rang){
    figs1<-subset(pasaporte2, pasaporte2[5]>variab1min&pasaporte2[5]<variab1max) 
  }
  if (!variab1rang){
    if (variab1cola){
      nfigs<-round(nrow(pasaporte2)*(variab1vpor/100),digits=0)
      if (variab1vhl=="high"){
        i <- order(pasaporte2[5],decreasing=TRUE)
        pasaporte2 <- pasaporte2[i,]
        figs1<-pasaporte2[1:nfigs,]
      }
      if (variab1vhl=="low"){
        i <- order(pasaporte2[5],decreasing=FALSE)
        pasaporte2 <- pasaporte2[i,]
        figs1<-pasaporte2[1:nfigs,]
      }  
    }
  }
  #filtro variable2
  if(variab2){
  if(nrow(figs1)>0){
      if (variab2rang){
        figs2<-subset(figs1, figs1[6]>variab2min&figs1[6]<variab2max)
        figss2<-TRUE
      }
      if (!variab2rang){
        if (variab2cola){
          nfigs<-round(nrow(figs1)*(variab2vpor/100),digits=0)
          if (variab2vhl=="high"){
            i <- order(figs1[6],decreasing=TRUE)
            figs1 <- figs1[i,]
            figs2<-figs1[1:nfigs,]
            figss2<-TRUE
          }
          if (variab2vhl=="low"){
            i <- order(figs1[6],decreasing=FALSE)
            figs1 <- figs1[i,]
            figs2<-figs1[1:nfigs,]
            figss2<-TRUE
          }  
        }
      }
    }
  }
  if(nrow(figs1)==0){
    figss2<-FALSE
    figss3<-FALSE
  }
  #filtro variable3
  if(variab3&variab2){
  if(figss2&nrow(figs2)>0){
      if (variab3rang){
        figs3<-subset(figs2, figs2[7]>variab3min&figs2[7]<variab3max)
        figss3<-TRUE
      }
      if(!variab3rang){
        if (variab3cola){
          nfigs<-round(nrow(figs2)*(variab3vpor/100),digits=0)
          if (variab3vhl=="high"){
            i <- order(figs2[7],decreasing=TRUE)
            figs2 <- figs2[i,]
            figs3<-figs2[1:nfigs,]
            figss3<-TRUE
          }
          if (variab3vhl=="low"){
            i <- order(figs2[7],decreasing=FALSE)
            figs2 <- figs2[i,]
            figs3<-figs2[1:nfigs,]
            figss3<-TRUE
          }
        }
      }
    }
    if ((!variab3&!variab2)|(!variab3&variab2)){
      figss3<-FALSE
    } 
  }
  if(variab2){
    if(nrow(figs2)==0){
      figss3<-FALSE
    }
  }
}
  
#Ensamblaje subcolecci?n figs
if(nrow(figs1)>0){
  write.table(figs1,file=paste(resultados,"/FIGS_regular.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(figs1,file=paste(resultados,"/FIGS_regular.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
}
if(variab2){
if(figss2){
      write.table(figs2,file=paste(resultados,"/FIGS_regular.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(figs2,file=paste(resultados,"/FIGS_regular.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
}
if(variab3){
if(figss3){
      write.table(figs3,file=paste(resultados,"/FIGS_regular.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(figs3,file=paste(resultados,"/FIGS_regular.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
}
if(!variab2){
  figss2<-FALSE
}
if(!variab3){
  figss3<-FALSE
}
write("7.Terminado proceso de filtrado por variables 1, 2 y 3", file="Error/process_info.txt", append=TRUE)
#####################################################
#Productos,Estad?sticas y par?metros de selecci?n
#Pasaporte + info FIGS
SEL_VAR1<-rep(1,nrow(figs1))
figs1.1<-data.frame(figs1[,"ACCENUMB"],SEL_VAR1)
colnames(figs1.1)[1]<-"ACCENUMB"
pasaporte<-merge(pasaporte,figs1.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
if(variab2&figss2){
  SEL_VAR2<-rep(1,nrow(figs2))
  figs2.1<-data.frame(figs2[,"ACCENUMB"],SEL_VAR2)
  colnames(figs2.1)[1]<-"ACCENUMB"
  pasaporte<-merge(pasaporte,figs2.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
if(variab3&figss3){
  SEL_VAR3<-rep(1,nrow(figs3))
  figs3.1<-data.frame(figs3[,"ACCENUMB"],SEL_VAR3)
  colnames(figs3.1)[1]<-"ACCENUMB"
  pasaporte<-merge(pasaporte,figs3.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
write.table(pasaporte,file=paste(resultados,"/Passport_FIGS_R.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(pasaporte,file=paste(resultados,"/Passport_FIGS_R.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
#Tabla estad?sticas
estadist<-merge(ecogeot,figs1.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
if(variab2&figss2){
  estadist<-merge(estadist,figs2.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
if(variab3&figss3){
  estadist<-merge(estadist,figs3.1,by="ACCENUMB",all.x=TRUE,sort=FALSE)
}
N_TOTAL<-nrow(ecogeot)
if(!controlelc){
  mean_total1<-mean(estadist[,5],na.rm =TRUE)
  max_total1<-max(estadist[,5],na.rm =TRUE)
  min_total1<-min(estadist[,5],na.rm =TRUE)
  sd_total1<-sd(estadist[,5],na.rm =TRUE)
  mean_figs1<-subset(estadist,SEL_VAR1==1)
  N_FIGS1<-nrow(mean_figs1)
  Sel_Intensity1<-(N_FIGS1/N_TOTAL)*100
  mean_figs1.1<-mean(mean_figs1[,5],na.rm =TRUE)
  max_figs1<-max(mean_figs1[,5],na.rm =TRUE)
  min_figs1<-min(mean_figs1[,5],na.rm =TRUE)
  sd_figs1<-sd(mean_figs1[,5],na.rm =TRUE)
  dif_sel1<-abs(mean_total1-mean_figs1.1)
  dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
  statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
               "Intensidad de selecci?n final(%)","Media colecci?n total var1",
               "Media colecci?n FIGS var1", "Valor max colecci?n total var1",
               "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
               "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
               "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1","Diferencial var1 (%)")
  statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)","Mean (var1) total collection",
                "Mean (var1) FIGS subset","Max value (var1) total collection","Max value (var1) FIGS subset",
                "Min value (var1) total collection","Min value (var1) FIGS subset","Std deviation (var1) total collection",
                "Std deviation (var1) FIGS subset","Selection differential (var1)","selection differential (var1) in percentage")
  statvalues<-c(N_TOTAL,N_FIGS1,Sel_Intensity1,mean_total1,mean_figs1.1,max_total1,max_figs1,min_total1,min_figs1,sd_total1,sd_figs1,dif_sel1,dif_sel_por1)
  statable<-data.frame(cbind(statnames,statnames2,statvalues))
  colnames(statable)[1]<-"ESTADISTICOS"
  colnames(statable)[2]<-"STATISTICS"
  colnames(statable)[3]<-"VALORES/VALUES"
  if(variab2&figss2){
    mean_total1<-mean(estadist[,5],na.rm =TRUE)
    mean_total2<-mean(estadist[,6],na.rm =TRUE)
    max_total1<-max(estadist[,5],na.rm =TRUE)
    min_total1<-min(estadist[,5],na.rm =TRUE)
    sd_total1<-sd(estadist[,5],na.rm =TRUE)
    max_total2<-max(estadist[,6],na.rm =TRUE)
    min_total2<-min(estadist[,6],na.rm =TRUE)
    sd_total2<-sd(estadist[,6],na.rm =TRUE)
    mean_figs2<-subset(estadist,SEL_VAR2==1)
    N_FIGS2<-nrow(mean_figs2)
    Sel_Intensity2<-(N_FIGS2/N_TOTAL)*100
    mean_figs1<-mean(mean_figs2[,5],na.rm =TRUE)
    max_figs1<-max(mean_figs2[,5],na.rm =TRUE)
    min_figs1<-min(mean_figs2[,5],na.rm =TRUE)
    sd_figs1<-sd(mean_figs2[,5],na.rm =TRUE)
    mean_figs2.2<-mean(mean_figs2[,6],na.rm =TRUE)
    max_figs2<-max(mean_figs2[,6],na.rm =TRUE)
    min_figs2<-min(mean_figs2[,6],na.rm =TRUE)
    sd_figs2<-sd(mean_figs2[,6],na.rm =TRUE)
    dif_sel1<-abs(mean_total1-mean_figs1)
    dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
    dif_sel2<-abs(mean_total2-mean_figs2.2)
    dif_sel_por2<-(dif_sel2*100)/abs(mean_total2)
    statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
                 "Intensidad de selecci?n final(%)","Media colecci?n total var1",
                 "Media colecci?n FIGS var1", "Valor max colecci?n total var1",
                 "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
                 "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
                 "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1",
                 "Diferencial var1 (%)","Media colecci?n total var2",
                 "Media colecci?n FIGS var2","Valor max colecci?n total var2",
                 "Valor max colecci?n FIGS var2","Valor min colecci?n total var2",
                 "Valor min colecci?n FIGS var2","Desv estandar colecci?n total var2",
                 "Desv estandar colecci?n FIGS var2","Diferencial de selecci?n var2",
                 "Diferencial var2 (%)")
    statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)","Mean (var1) total collection",
                  "Mean (var1) FIGS subset","Max value (var1) total collection","Max value (var1) FIGS subset",
                  "Min value (var1) total collection","Min value (var1) FIGS subset","Std deviation (var1) total collection",
                  "Std deviation (var1) FIGS subset","Selection differential (var1)","selection differential (var1) in percentage",
                  "Mean (var2) total collection","Mean (var2) FIGS subset","Max value (var2) total collection",
                  "Max value (var2) FIGS subset","Min value (var2) total collection","Min value (var2) FIGS subset",
                  "Std deviation (var2) total collection","Std deviation (var2) FIGS subset","Selection differential (var2)",
                  "selection differential (var2) in percentage")
    statvalues<-c(N_TOTAL,N_FIGS2,Sel_Intensity2,mean_total1,mean_figs1,
                  max_total1,max_figs1,min_total1,min_figs1,
                  sd_total1,sd_figs1,dif_sel1,
                  dif_sel_por1,mean_total2,mean_figs2.2,
                  max_total2,max_figs2,min_total2,min_figs2,
                  sd_total2,sd_figs2,dif_sel2,
                  dif_sel_por2)
    statable<-data.frame(cbind(statnames,statnames2,statvalues))
    colnames(statable)[1]<-"ESTADISTICOS"
    colnames(statable)[2]<-"STATISTICS"
    colnames(statable)[3]<-"VALORES/VALUES"
  }
  if(variab3&figss3){
    mean_total1<-mean(estadist[,5],na.rm =TRUE)
    mean_total2<-mean(estadist[,6],na.rm =TRUE)
    mean_total3<-mean(estadist[,7],na.rm =TRUE)
    max_total1<-max(estadist[,5],na.rm =TRUE)
    min_total1<-min(estadist[,5],na.rm =TRUE)
    sd_total1<-sd(estadist[,5],na.rm =TRUE)
    max_total2<-max(estadist[,6],na.rm =TRUE)
    min_total2<-min(estadist[,6],na.rm =TRUE)
    sd_total2<-sd(estadist[,6],na.rm =TRUE)
    max_total3<-max(estadist[,7],na.rm =TRUE)
    min_total3<-min(estadist[,7],na.rm =TRUE)
    sd_total3<-sd(estadist[,7],na.rm =TRUE)
    mean_figs3<-subset(estadist,SEL_VAR3==1)
    N_FIGS3<-nrow(mean_figs3)
    Sel_Intensity3<-(N_FIGS3/N_TOTAL)*100
    mean_figs1<-mean(mean_figs3[,5],na.rm =TRUE)
    max_figs1<-max(mean_figs3[,5],na.rm =TRUE)
    min_figs1<-min(mean_figs3[,5],na.rm =TRUE)
    sd_figs1<-sd(mean_figs3[,5],na.rm =TRUE)
    mean_figs2<-mean(mean_figs3[,6],na.rm =TRUE)
    max_figs2<-max(mean_figs3[,6],na.rm =TRUE)
    min_figs2<-min(mean_figs3[,6],na.rm =TRUE)
    sd_figs2<-sd(mean_figs3[,6],na.rm =TRUE)
    mean_figs3.3<-mean(mean_figs3[,7],na.rm =TRUE)
    max_figs3<-max(mean_figs3[,7],na.rm =TRUE)
    min_figs3<-min(mean_figs3[,7],na.rm =TRUE)
    sd_figs3<-sd(mean_figs3[,7],na.rm =TRUE)
    dif_sel1<-abs(mean_total1-mean_figs1)
    dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
    dif_sel2<-abs(mean_total2-mean_figs2)
    dif_sel_por2<-(dif_sel2*100)/abs(mean_total2)
    dif_sel3<-abs(mean_total3-mean_figs3.3)
    dif_sel_por3<-(dif_sel3*100)/abs(mean_total3)
    statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
                 "Intensidad de selecci?n final(%)","Media colecci?n total var1",
                 "Media colecci?n FIGS var1","Valor max colecci?n total var1",
                 "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
                 "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
                 "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1",
                 "Diferencial var1 (%)","Media colecci?n total var2",
                 "Media colecci?n FIGS var2","Valor max colecci?n total var2",
                 "Valor max colecci?n FIGS var2","Valor min colecci?n total var2",
                 "Valor min colecci?n FIGS var2","Desv estandar colecci?n total var2",
                 "Desv estandar colecci?n FIGS var2","Diferencial de selecci?n var2",
                 "Diferencial var2 (%)","Media colecci?n total var3",
                 "Media colecci?n FIGS var3","Valor max colecci?n total var3",
                 "Valor max colecci?n FIGS var3","Valor min colecci?n total var3",
                 "Valor min colecci?n FIGS var3","Desv estandar colecci?n total var3",
                 "Desv estandar colecci?n FIGS var3","Diferencial de selecci?n var3",
                 "Diferencial var3 (%)")
    statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)",
                  "Mean (var1) total collection","Mean (var1) FIGS subset",
                  "Max value (var1) total collection","Max value (var1) FIGS subset",
                  "Min value (var1) total collection","Min value (var1) FIGS subset",
                  "Std deviation (var1) total collection","Std deviation (var1) FIGS subset",
                  "Selection differential (var1)","selection differential (var1) in percentage",
                  "Mean (var2) total collection","Mean (var2) FIGS subset","Max value (var2) total collection",
                  "Max value (var2) FIGS subset","Min value (var2) total collection","Min value (var2) FIGS subset",
                  "Std deviation (var2) total collection","Std deviation (var2) FIGS subset",
                  "Selection differential (var2)","selection differential (var2) in percentage",
                  "Mean (var3) total collection","Mean (var3) FIGS subset","Max value (var3) total collection",
                  "Max value (var3) FIGS subset","Min value (var3) total collection","Min value (var3) FIGS subset",
                  "Std deviation (var3) total collection","Std deviation (var3) FIGS subset",
                  "Selection differential (var3)","selection differential (var3) in percentage")
    statvalues<-c(N_TOTAL,N_FIGS3,Sel_Intensity3,mean_total1,mean_figs1,
                  max_total1,max_figs1,min_total1,min_figs1,
                  sd_total1,sd_figs1,dif_sel1,
                  dif_sel_por1,mean_total2,mean_figs2,
                  max_total2,max_figs2,min_total2,min_figs2,
                  sd_total2,sd_figs2,dif_sel2,
                  dif_sel_por2,mean_total3,mean_figs3.3,
                  max_total3,max_figs3,min_total3,min_figs3,
                  sd_total3,sd_figs3,dif_sel3,
                  dif_sel_por3)
    statable<-data.frame(cbind(statnames,statnames2,statvalues))
    colnames(statable)[1]<-"ESTADISTICAS"
    colnames(statable)[2]<-"STATISTICS"
    colnames(statable)[3]<-"VALORES/VALUES"
  }
}
if(controlelc){
  mean_total1<-mean(estadist[,6],na.rm =TRUE)
  max_total1<-max(estadist[,6],na.rm =TRUE)
  min_total1<-min(estadist[,6],na.rm =TRUE)
  sd_total1<-sd(estadist[,6],na.rm =TRUE)
  mean_figs1<-subset(estadist,SEL_VAR1==1)
  N_FIGS1<-nrow(mean_figs1)
  Sel_Intensity1<-(N_FIGS1/N_TOTAL)*100
  mean_figs1.1<-mean(mean_figs1[,6],na.rm =TRUE)
  max_figs1<-max(mean_figs1[,6],na.rm =TRUE)
  min_figs1<-min(mean_figs1[,6],na.rm =TRUE)
  sd_figs1<-sd(mean_figs1[,6],na.rm =TRUE)
  dif_sel1<-abs(mean_total1-mean_figs1.1)
  dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
  statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
               "Intensidad de selecci?n final(%)","Media colecci?n total var1",
               "Media colecci?n FIGS var1", "Valor max colecci?n total var1",
               "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
               "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
               "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1","Diferencial var1 (%)")
  statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)","Mean (var1) total collection",
                "Mean (var1) FIGS subset","Max value (var1) total collection","Max value (var1) FIGS subset",
                "Min value (var1) total collection","Min value (var1) FIGS subset","Std deviation (var1) total collection",
                "Std deviation (var1) FIGS subset","Selection differential (var1)","selection differential (var1) in percentage")
  statvalues<-c(N_TOTAL,N_FIGS1,Sel_Intensity1,mean_total1,mean_figs1.1,max_total1,max_figs1,min_total1,min_figs1,sd_total1,sd_figs1,dif_sel1,dif_sel_por1)
  statable<-data.frame(cbind(statnames,statnames2,statvalues))
  colnames(statable)[1]<-"ESTADISTICOS"
  colnames(statable)[2]<-"STATISTICS"
  colnames(statable)[3]<-"VALORES/VALUES"
  if(variab2&figss2){
    mean_total1<-mean(estadist[,6],na.rm =TRUE)
    mean_total2<-mean(estadist[,7],na.rm =TRUE)
    max_total1<-max(estadist[,6],na.rm =TRUE)
    min_total1<-min(estadist[,6],na.rm =TRUE)
    sd_total1<-sd(estadist[,6],na.rm =TRUE)
    max_total2<-max(estadist[,7],na.rm =TRUE)
    min_total2<-min(estadist[,7],na.rm =TRUE)
    sd_total2<-sd(estadist[,7],na.rm =TRUE)
    mean_figs2<-subset(estadist,SEL_VAR2==1)
    N_FIGS2<-nrow(mean_figs2)
    Sel_Intensity2<-(N_FIGS2/N_TOTAL)*100
    mean_figs1<-mean(mean_figs2[,6],na.rm =TRUE)
    max_figs1<-max(mean_figs2[,6],na.rm =TRUE)
    min_figs1<-min(mean_figs2[,6],na.rm =TRUE)
    sd_figs1<-sd(mean_figs2[,6],na.rm =TRUE)
    mean_figs2.2<-mean(mean_figs2[,7],na.rm =TRUE)
    max_figs2<-max(mean_figs2[,7],na.rm =TRUE)
    min_figs2<-min(mean_figs2[,7],na.rm =TRUE)
    sd_figs2<-sd(mean_figs2[,7],na.rm =TRUE)
    dif_sel1<-abs(mean_total1-mean_figs1)
    dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
    dif_sel2<-abs(mean_total2-mean_figs2.2)
    dif_sel_por2<-(dif_sel2*100)/abs(mean_total2)
    statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
                 "Intensidad de selecci?n final(%)","Media colecci?n total var1",
                 "Media colecci?n FIGS var1", "Valor max colecci?n total var1",
                 "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
                 "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
                 "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1",
                 "Diferencial var1 (%)","Media colecci?n total var2",
                 "Media colecci?n FIGS var2","Valor max colecci?n total var2",
                 "Valor max colecci?n FIGS var2","Valor min colecci?n total var2",
                 "Valor min colecci?n FIGS var2","Desv estandar colecci?n total var2",
                 "Desv estandar colecci?n FIGS var2","Diferencial de selecci?n var2",
                 "Diferencial var2 (%)")
    statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)","Mean (var1) total collection",
                  "Mean (var1) FIGS subset","Max value (var1) total collection","Max value (var1) FIGS subset",
                  "Min value (var1) total collection","Min value (var1) FIGS subset","Std deviation (var1) total collection",
                  "Std deviation (var1) FIGS subset","Selection differential (var1)","selection differential (var1) in percentage",
                  "Mean (var2) total collection","Mean (var2) FIGS subset","Max value (var2) total collection",
                  "Max value (var2) FIGS subset","Min value (var2) total collection","Min value (var2) FIGS subset",
                  "Std deviation (var2) total collection","Std deviation (var2) FIGS subset","Selection differential (var2)",
                  "selection differential (var2) in percentage")
    statvalues<-c(N_TOTAL,N_FIGS2,Sel_Intensity2,mean_total1,mean_figs1,
                  max_total1,max_figs1,min_total1,min_figs1,
                  sd_total1,sd_figs1,dif_sel1,
                  dif_sel_por1,mean_total2,mean_figs2.2,
                  max_total2,max_figs2,min_total2,min_figs2,
                  sd_total2,sd_figs2,dif_sel2,
                  dif_sel_por2)
    statable<-data.frame(cbind(statnames,statnames2,statvalues))
    colnames(statable)[1]<-"ESTADISTICOS"
    colnames(statable)[2]<-"STATISTICS"
    colnames(statable)[3]<-"VALORES/VALUES"
  }
  if(variab3&figss3){
    mean_total1<-mean(estadist[,6],na.rm =TRUE)
    mean_total2<-mean(estadist[,7],na.rm =TRUE)
    mean_total3<-mean(estadist[,8],na.rm =TRUE)
    max_total1<-max(estadist[,6],na.rm =TRUE)
    min_total1<-min(estadist[,6],na.rm =TRUE)
    sd_total1<-sd(estadist[,6],na.rm =TRUE)
    max_total2<-max(estadist[,7],na.rm =TRUE)
    min_total2<-min(estadist[,7],na.rm =TRUE)
    sd_total2<-sd(estadist[,7],na.rm =TRUE)
    max_total3<-max(estadist[,8],na.rm =TRUE)
    min_total3<-min(estadist[,8],na.rm =TRUE)
    sd_total3<-sd(estadist[,8],na.rm =TRUE)
    mean_figs3<-subset(estadist,SEL_VAR3==1)
    N_FIGS3<-nrow(mean_figs3)
    Sel_Intensity3<-(N_FIGS3/N_TOTAL)*100
    mean_figs1<-mean(mean_figs3[,6],na.rm =TRUE)
    max_figs1<-max(mean_figs3[,6],na.rm =TRUE)
    min_figs1<-min(mean_figs3[,6],na.rm =TRUE)
    sd_figs1<-sd(mean_figs3[,6],na.rm =TRUE)
    mean_figs2<-mean(mean_figs3[,7],na.rm =TRUE)
    max_figs2<-max(mean_figs3[,7],na.rm =TRUE)
    min_figs2<-min(mean_figs3[,7],na.rm =TRUE)
    sd_figs2<-sd(mean_figs3[,7],na.rm =TRUE)
    mean_figs3.3<-mean(mean_figs3[,8],na.rm =TRUE)
    max_figs3<-max(mean_figs3[,8],na.rm =TRUE)
    min_figs3<-min(mean_figs3[,8],na.rm =TRUE)
    sd_figs3<-sd(mean_figs3[,8],na.rm =TRUE)
    dif_sel1<-abs(mean_total1-mean_figs1)
    dif_sel_por1<-(dif_sel1*100)/abs(mean_total1)
    dif_sel2<-abs(mean_total2-mean_figs2)
    dif_sel_por2<-(dif_sel2*100)/abs(mean_total2)
    dif_sel3<-abs(mean_total3-mean_figs3.3)
    dif_sel_por3<-(dif_sel3*100)/abs(mean_total3)
    statnames<-c("Tama?o de colecci?n", "Tama?o subcolecci?n FIGS",
                 "Intensidad de selecci?n final(%)","Media colecci?n total var1",
                 "Media colecci?n FIGS var1","Valor max colecci?n total var1",
                 "Valor max colecci?n FIGS var1","Valor min colecci?n total var1",
                 "Valor min colecci?n FIGS var1","Desv estandar colecci?n total var1",
                 "Desv estandar colecci?n FIGS var1","Diferencial de selecci?n var1",
                 "Diferencial var1 (%)","Media colecci?n total var2",
                 "Media colecci?n FIGS var2","Valor max colecci?n total var2",
                 "Valor max colecci?n FIGS var2","Valor min colecci?n total var2",
                 "Valor min colecci?n FIGS var2","Desv estandar colecci?n total var2",
                 "Desv estandar colecci?n FIGS var2","Diferencial de selecci?n var2",
                 "Diferencial var2 (%)","Media colecci?n total var3",
                 "Media colecci?n FIGS var3","Valor max colecci?n total var3",
                 "Valor max colecci?n FIGS var3","Valor min colecci?n total var3",
                 "Valor min colecci?n FIGS var3","Desv estandar colecci?n total var3",
                 "Desv estandar colecci?n FIGS var3","Diferencial de selecci?n var3",
                 "Diferencial var3 (%)")
    statnames2<-c("Collection size","FIGS subset size","Final selection intensity (%)",
                  "Mean (var1) total collection","Mean (var1) FIGS subset",
                  "Max value (var1) total collection","Max value (var1) FIGS subset",
                  "Min value (var1) total collection","Min value (var1) FIGS subset",
                  "Std deviation (var1) total collection","Std deviation (var1) FIGS subset",
                  "Selection differential (var1)","selection differential (var1) in percentage",
                  "Mean (var2) total collection","Mean (var2) FIGS subset","Max value (var2) total collection",
                  "Max value (var2) FIGS subset","Min value (var2) total collection","Min value (var2) FIGS subset",
                  "Std deviation (var2) total collection","Std deviation (var2) FIGS subset",
                  "Selection differential (var2)","selection differential (var2) in percentage",
                  "Mean (var3) total collection","Mean (var3) FIGS subset","Max value (var3) total collection",
                  "Max value (var3) FIGS subset","Min value (var3) total collection","Min value (var3) FIGS subset",
                  "Std deviation (var3) total collection","Std deviation (var3) FIGS subset",
                  "Selection differential (var3)","selection differential (var3) in percentage")
    statvalues<-c(N_TOTAL,N_FIGS3,Sel_Intensity3,mean_total1,mean_figs1,
                  max_total1,max_figs1,min_total1,min_figs1,
                  sd_total1,sd_figs1,dif_sel1,
                  dif_sel_por1,mean_total2,mean_figs2,
                  max_total2,max_figs2,min_total2,min_figs2,
                  sd_total2,sd_figs2,dif_sel2,
                  dif_sel_por2,mean_total3,mean_figs3.3,
                  max_total3,max_figs3,min_total3,min_figs3,
                  sd_total3,sd_figs3,dif_sel3,
                  dif_sel_por3)
    statable<-data.frame(cbind(statnames,statnames2,statvalues))
    colnames(statable)[1]<-"ESTADISTICAS"
    colnames(statable)[2]<-"STATISTICS"
    colnames(statable)[3]<-"VALORES/VALUES"
  } 
}
write.table(statable,file=paste(resultados,"/FIGS_stat_table.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(statable,file=paste(resultados,"/FIGS_stat_table.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write("8.Terminado obtenci?n tablas de resultados y estadisticas, inicio (si a lugar) con datos ELC", file="Error/process_info.txt", append=TRUE)
##########################################
#datos del mapa ELC
if (controlelc){
  #adecuaci?n tablas
  ecogeot<-ecogeot[,c(1,6:ncol(ecogeot))]
  pasaporte<-merge(pasaporte,ecogeot,by="ACCENUMB",sort=FALSE)
  pasaporte2<-data.frame(pasaporte2[,"ACCENUMB"])
  colnames(pasaporte2)[1]<-"ACCENUMB"
  pasaporte2<-merge(pasaporte,pasaporte2,by="ACCENUMB",sort=FALSE)
  #Introducci?n tabla de categor?as total del ELCmapa
  statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
  statelc<-as.data.frame(statelc[,"ELC_CAT"])
  colnames(statelc)[1]<-"ELC_CAT"
  #Tablas de frecuencias desde pasaporte
  #total
  BGfrec<-as.data.frame(table(pasaporte[,"BGcat"]))
  colnames(BGfrec)[1]<-"ELC_CAT"
  colnames(BGfrec)[2]<-"FREQ_W_DUPL"
  #Sin duplicados
  BGfrec2<-as.data.frame(table(pasaporte2[,"BGcat"]))
  colnames(BGfrec2)[1]<-"ELC_CAT"
  colnames(BGfrec2)[2]<-"FREQ_WO_DUPL"
  BGfrec<-merge(BGfrec,BGfrec2,by="ELC_CAT",all.x=TRUE)
  statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
  Duplicates<-vector(length=nrow(statelc))
  for (i in 1:nrow(statelc)){
    if (is.na(statelc$FREQ_WO_DUPL[i])){
      statelc$FREQ_WO_DUPL[i]<-0
    }
    if (is.na(statelc$FREQ_W_DUPL[i])){
      statelc$FREQ_W_DUPL[i]<-0
    }
    Duplicates[i]<-statelc$FREQ_W_DUPL[i]-statelc$FREQ_WO_DUPL[i]
  }
  statelc<-cbind(statelc,Duplicates)
  #Distribuci?n de disponibles
  N_Availab<-aggregate(pasaporte[,"AVAILAB"],by=list(pasaporte$BGcat),sum, na.rm=TRUE)
  colnames(N_Availab)[1]<-"ELC_CAT"
  colnames(N_Availab)[2]<-"N_Availab"
  statelc<-merge(statelc,N_Availab,by="ELC_CAT",all.x=TRUE)
  N_AvailabWO<-aggregate(pasaporte2[,"AVAILAB"],by=list(pasaporte2$BGcat),sum, na.rm=TRUE)
  colnames(N_AvailabWO)[1]<-"ELC_CAT"
  colnames(N_AvailabWO)[2]<-"N_AvailabWO"
  statelc<-merge(statelc,N_AvailabWO,by="ELC_CAT",all.x=TRUE)
  #####
  figselc1<-subset(pasaporte,SEL_VAR1==1)
  FIGS_var1<-vector(length=nrow(statelc))
  for (i in 1:nrow(statelc)){
    figselc1.1<-subset(figselc1,BGcat==statelc$ELC_CAT[i])
    FIGS_var1[i]<-nrow(figselc1.1)
  }
  statelc<-cbind(statelc,FIGS_var1)
  write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  if(variab2&figss2){
    figselc2<-subset(pasaporte,SEL_VAR2==1)
    FIGS_var2<-vector(length=nrow(statelc))
    for (i in 1:nrow(statelc)){
      figselc2.1<-subset(figselc2,BGcat==statelc$ELC_CAT[i])
      FIGS_var2[i]<-nrow(figselc2.1)
    }
    statelc<-cbind(statelc,FIGS_var2)
    write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
  if(variab3&figss3){
    figselc3<-subset(pasaporte,SEL_VAR3==1)
    FIGS_var3<-vector(length=nrow(statelc))
    for (i in 1:nrow(statelc)){
      figselc3.1<-subset(figselc3,BGcat==statelc$ELC_CAT[i])
      FIGS_var3[i]<-nrow(figselc3.1)
    }
    statelc<-cbind(statelc,FIGS_var3)
    write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
  write("9.Terminado proceso de determinaci?n de entradas FIGS x categor?a ELC", file="Error/process_info.txt", append=TRUE)
  #Proceso para determinar la subcolecci?n FIGS s?lo con porcentajes de selecci?n  
  ok1<-FALSE
  ok2<-FALSE
  ok3<-FALSE
  if(!variab1rang&variab1cola&!variab2&!variab3){
    ok1<-TRUE
  }
  if(!variab1rang&variab1cola&!variab2rang&variab2cola&!variab3){
    ok2<-TRUE
  }
  if(!variab1rang&variab1cola&!variab2rang&variab2cola&!variab3rang&variab3cola){
    ok3<-TRUE
  }
  if(ok1|ok2|ok3){
    newfigs<-list()
    catfigssel<-vector(length=nrow(statelc))
    catfigssel2<-vector(length=nrow(statelc))
    catfigssel3<-vector(length=nrow(statelc))
    if(availab&soloavailab){
      if(geoqual){
        if(variab2&variab3){
          colnames(pasaporte2)[56]<-"var_eco1"
          colnames(pasaporte2)[57]<-"var_eco2"
          colnames(pasaporte2)[58]<-"var_eco3"
        }
        if(variab2&!variab3){
          colnames(pasaporte2)[55]<-"var_eco1"
          colnames(pasaporte2)[56]<-"var_eco2"
        }
        if(!variab2&!variab3){
          colnames(pasaporte2)[54]<-"var_eco1"
        }
      }
      if(!geoqual){
        if(variab2&variab3){
          colnames(pasaporte2)[51]<-"var_eco1"
          colnames(pasaporte2)[52]<-"var_eco2"
          colnames(pasaporte2)[53]<-"var_eco3"
        }
        if(variab2&!variab3){
          colnames(pasaporte2)[50]<-"var_eco1"
          colnames(pasaporte2)[51]<-"var_eco2"
        }
        if(!variab2&!variab3){
          colnames(pasaporte2)[49]<-"var_eco1"
        }
      }
      if(!variab2&!variab3){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte2,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              newfigs[[i]]<-newfigs1
            }
            if (variab1vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              newfigs[[i]]<-newfigs1
            }
          }
        } 
      }
      if(variab2&!variab3&!variab2rang&variab2cola){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte2,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"&variab2vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
          }
        } 
      }
      if(variab2&variab3&!variab2rang&variab2cola&!variab3rang&variab3cola){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte2,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"&variab2vhl=="high"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="high"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
          }
        } 
      }
    }
    if(!availab&!soloavailab){
      if(geoqual){
        if(variab2&variab3){
          colnames(pasaporte)[56]<-"var_eco1"
          colnames(pasaporte)[57]<-"var_eco2"
          colnames(pasaporte)[58]<-"var_eco3"
        }
        if(variab2&!variab3){
          colnames(pasaporte)[55]<-"var_eco1"
          colnames(pasaporte)[56]<-"var_eco2"
        }
        if(!variab2&!variab3){
          colnames(pasaporte)[54]<-"var_eco1"
        }
      }
      if(!geoqual){
        if(variab2&variab3){
          colnames(pasaporte)[51]<-"var_eco1"
          colnames(pasaporte)[52]<-"var_eco2"
          colnames(pasaporte)[53]<-"var_eco3"
        }
        if(variab2&!variab3){
          colnames(pasaporte)[50]<-"var_eco1"
          colnames(pasaporte)[51]<-"var_eco2"
        }
        if(!variab2&!variab3){
          colnames(pasaporte)[49]<-"var_eco1"
        }
      }
      if(!variab2&!variab3){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              newfigs[[i]]<-newfigs1
            }
            if (variab1vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              newfigs[[i]]<-newfigs1
            }
          }
        } 
      }
      if(variab2&!variab3&!variab2rang&variab2cola){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"&variab2vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                newfigs[[i]]<-newfigs2
                catfigssel2[i]<-nrow(newfigs2)
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
          }
        } 
      }
      if(variab2&variab3&!variab2rang&variab2cola&!variab3rang&variab3cola){
        for (i in 1:nrow(statelc)){
          categ<-paste(statelc$ELC_CAT[i])
          figstab1<-subset(pasaporte,BGcat==categ)
          nfigs<-round(nrow(figstab1)*(variab1vpor/100),digits=0)
          if(nrow(figstab1)>0&nfigs>0){
            if (variab1vhl=="high"&variab2vhl=="high"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="high"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"&variab3vhl=="high"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="high"&variab2vhl=="low"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=FALSE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="high"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=FALSE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=FALSE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
            if (variab1vhl=="low"&variab2vhl=="low"&variab3vhl=="low"){
              j <- order(figstab1$var_eco1,decreasing=TRUE)
              figstab1 <- figstab1[j,]
              newfigs1<-figstab1[1:nfigs,]
              catfigssel[i]<-nrow(newfigs1)
              nfigs2<-round(nrow(newfigs1)*(variab2vpor/100),digits=0)
              if(nfigs2>0){
                j <- order(newfigs1$var_eco2,decreasing=TRUE)
                newfigs2 <- newfigs1[j,]
                newfigs2<-newfigs2[1:nfigs2,]
                catfigssel2[i]<-nrow(newfigs2)
                nfigs3<-round(nrow(newfigs2)*(variab2vpor/100),digits=0)
                if(nfigs3>0){
                  j <- order(newfigs2$var_eco3,decreasing=TRUE)
                  newfigs3 <- newfigs2[j,]
                  newfigs3<-newfigs3[1:nfigs3,]
                  newfigs[[i]]<-newfigs3
                  catfigssel3[i]<-nrow(newfigs3)
                }
                if(nfigs3==0){
                  newfigs[[i]]<-newfigs2
                }
              }
              if(nfigs2==0){
                newfigs[[i]]<-newfigs1
              } 
            }
          }
        } 
      }
    }
    if(availab&soloavailab|!availab&!soloavailab){
      newfigs<-do.call("rbind",newfigs)
      write.table(newfigs,file=paste(resultados,"/FIGS_UnderELC.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(newfigs,file=paste(resultados,"/FIGS_UnderELC.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      No_by_var1<-catfigssel
      No_by_var2<-catfigssel2
      No_by_var3<-catfigssel3
      statelc<-cbind(statelc,No_by_var1,No_by_var2,No_by_var3)
      write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(statelc,file=paste(resultados,"/FIGS_freq_ELCmap.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
      write("10.Terminado proceso creaci?n subcoleccionFIGS bajo represent ELC con porcentajes sel", file="Error/process_info.txt", append=TRUE)
    }
  }
}
write("10/11.Terminado proceso FIGS_R", file="Error/process_info.txt", append=TRUE)
 


