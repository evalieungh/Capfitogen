#####################################################################
# Script  de la herramienta Representa - Representa tool script 
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
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.Representa.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Representa.txt", append=TRUE)
write("______Herramienta/Tool Representa________", file="Parametros.Parameters.Representa.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Representa.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("internet:", internet,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("fext:", fext,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("fuentex:", fuentex,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("geoqualfe:", geoqualfe,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("totalqualfe:", totalqualfe,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("duplibg:", duplibg,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("gbifFE:", gbifFE,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("genero:", genero,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("especie:", especie,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("statelc:", statelc,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.Representa.txt", append=TRUE)



##Elemento introducido por el usuario: ruta (ext)
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO Representa________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

##########################################################


write("1.Terminado proceso de fijaci?n de ruta de la herramienta", file="Error/process_info.txt", append=TRUE)
#Uso primera vez (requiere instalar los paquetes)
##Elemento introducido por el usuario: primvez . Nota: Tener en cuenta que si en el mismo PC ya se ha instalado ELC mapas, no hace falta reinstalar paquetes
#if(internet){
 # if(primvez){
  #  install.packages(c("sp","raster","maptools","rgdal","dismo"),repos='http://cran.us.r-project.org',dep="Depends")
  #}
#}
#if(!internet){
 # if(primvez){
  #  install.packages(c("Packages/sp_1.0-5.zip","Packages/raster_2.0-41.zip","Packages/maptools_0.8-22.zip","Packages/rgdal_0.8-5.zip","Packages/dismo_0.7-23.zip"),repos = NULL)
  #}
#}
write("2.Terminado proceso de instalaci?n de paquetes", file="Error/process_info.txt", append=TRUE)

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

write("3.Terminado proceso de carga de paquetes", file="Error/process_info.txt", append=TRUE)

#########################
##### Inicio#######
#########################
#introducci?n del mapa elc
mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
write("4.Terminado carga de mapa ELC formato paquete raster", file="Error/process_info.txt", append=TRUE)

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
write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartilesMapaELC_QuartileClassificationELCmap.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartilesMapaELC_QuartileClassificationELCmap.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
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
write("5.Terminado generacion de tabla frecuencias mapa ELC", file="Error/process_info.txt", append=TRUE)

#############################################################################
####Si hay datos fuentes externas
if (fext){
  write("6.Iniciando proceso detecci?n representatividad con datos de evaluaci?n GEOQUAL y Fuentes Externas", file="Error/process_info.txt", append=TRUE)
  if (geoqual){
    pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
    pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
    pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
    puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
    #Eliminando duplicados ecogeogr?ficos
    if (mean(pasaporte$DECLATITUDE)<23){
      distdup1<-distdup*0.00833
    }
    if (mean(pasaporte$DECLATITUDE)>23&mean(pasaporte$DECLATITUDE)<45){
      distdup1<-distdup*0.00975
    }
    if (mean(pasaporte$DECLATITUDE)>45&mean(pasaporte$DECLATITUDE)<67){
      distdup1<-distdup*0.0127
    }
    if (mean(pasaporte$DECLATITUDE)>67){
      distdup1<-distdup*0.02299
    }
    puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
    pasaporte<-puntosBG@data
    write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
    BGcat<-extract(mapaelc,puntosBG)
    write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    pasaporte<-data.frame(pasaporte,BGcat)
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
    write("6.4.Terminado aplicaci?n filtro de calidad TOTALQUAL100", file="Error/process_info.txt", append=TRUE)
  }
  if (!geoqual){
    pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
    pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
    pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
    puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
    #Eliminando duplicados ecogeogr?ficos
    if (mean(pasaporte$DECLATITUDE)<23){
      distdup1<-distdup*0.00833
    }
    if (mean(pasaporte$DECLATITUDE)>23&mean(pasaporte$DECLATITUDE)<45){
      distdup1<-distdup*0.00975
    }
    if (mean(pasaporte$DECLATITUDE)>45&mean(pasaporte$DECLATITUDE)<67){
      distdup1<-distdup*0.0127
    }
    if (mean(pasaporte$DECLATITUDE)>67){
      distdup1<-distdup*0.02299
    }
    puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
    pasaporte<-puntosBG@data
    write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
    BGcat<-extract(mapaelc,puntosBG)
    pasaporte<-data.frame(pasaporte,BGcat)
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
  }
  #introducci?n puntos fuentes externa
  if (geoqualfe){
    write("6.4-5 iniciando carga y extracci?n de datos externos", file="Error/process_info.txt", append=TRUE)
    fuentext<-read.delim(paste("Pasaporte/",fuentex,sep=""))
    if(!duplibg){
      fuentext<-subset(fuentext,TYPESOURCE!=40)
    }
    if(nrow(fuentext)==0){
      write("ATENCION!!, error al eliminarse todos los registros FE al considerar datos de otros bancos como no faltantes", file="Error/process_info.txt", append=TRUE)
    }
    fuentext<-subset(fuentext,!is.na(DECLATITUDE))
    fuentext<-subset(fuentext,!is.na(DECLONGITUDE))
    puntosFE<-SpatialPointsDataFrame(fuentext[,c("DECLONGITUDE","DECLATITUDE")],fuentext,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.6 Terminado generacion mapa de puntos FE con coordenadas", file="Error/process_info.txt", append=TRUE)
    if (mean(fuentext$DECLATITUDE)<23){
      distdup2<-distdup*0.00833
    }
    if (mean(fuentext$DECLATITUDE)>23&mean(fuentext$DECLATITUDE)<45){
      distdup2<-distdup*0.00975
    }
    if (mean(fuentext$DECLATITUDE)>45&mean(fuentext$DECLATITUDE)<67){
      distdup2<-distdup*0.0127
    }
    if (mean(fuentext$DECLATITUDE)>67){
      distdup2<-distdup*0.02299
    }
    puntosFE<-remove.duplicates(puntosFE,zero=distdup2)
    fuentext<-puntosFE@data
    write("6.7 Terminado remocion de duplicados espaciales del mapa de puntos FE", file="Error/process_info.txt", append=TRUE)
    FEcat<-extract(mapaelc,puntosFE)
    write("6.8.Terminado extracci?n para puntos FE de categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    fuentext<-data.frame(fuentext,FEcat)
    fuentext<-subset(fuentext,TOTALQUAL100>=totalqualfe)
    write("6.9.Terminado aplicaci?n filtro de calidad a puntos FE de TOTALQUAL100", file="Error/process_info.txt", append=TRUE)
  }
  if (!geoqualfe){
    write("6.4-5 iniciando carga y extracci?n de datos externos", file="Error/process_info.txt", append=TRUE)
    fuentext<-read.delim(paste("Pasaporte/",fuentex,sep=""))
    if(!duplibg){
      fuentext<-subset(fuentext,TYPESOURCE!=40)
    }
    if(nrow(fuentext)==0){
      write("ATENCION!!, error al eliminarse todos los registros FE al considerar datos de otros bancos como no faltantes", file="Error/process_info.txt", append=TRUE)
      stop("there are no external sources occurrences to run Representa, since all the external data has been deleted (check your duplibg parameter)")
    }
    fuentext<-subset(fuentext,!is.na(DECLATITUDE))
    fuentext<-subset(fuentext,!is.na(DECLONGITUDE))
    puntosFE<-SpatialPointsDataFrame(fuentext[,c("DECLONGITUDE","DECLATITUDE")],fuentext,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.6 Terminado generacion mapa de puntos FE con coordenadas", file="Error/process_info.txt", append=TRUE)
    if (mean(fuentext$DECLATITUDE)<23){
      distdup2<-distdup*0.00833
    }
    if (mean(fuentext$DECLATITUDE)>23&mean(fuentext$DECLATITUDE)<45){
      distdup2<-distdup*0.00975
    }
    if (mean(fuentext$DECLATITUDE)>45&mean(fuentext$DECLATITUDE)<67){
      distdup2<-distdup*0.0127
    }
    if (mean(fuentext$DECLATITUDE)>67){
      distdup2<-distdup*0.02299
    }
    puntosFE<-remove.duplicates(puntosFE,zero=distdup2)
    fuentext<-puntosFE@data
    write("6.7 Terminado remocion de duplicados espaciales del mapa de puntos FE", file="Error/process_info.txt", append=TRUE)
    FEcat<-extract(mapaelc,puntosFE)
    fuentext<-data.frame(fuentext,FEcat)
    write("6.8.Terminado extracci?n para puntos FE de categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
  }
  #Introducci?n tabla de categor?as total del ELCmapa
  statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
  statelc<-as.data.frame(statelc$ELC_CAT)
  colnames(statelc)[1]<-"ELC_CAT"
  #Tablas de frecuencias desde pasaporte/FE
  BGfrec<-as.data.frame(table(pasaporte[,"BGcat"]))
  colnames(BGfrec)[1]<-"ELC_CAT"
  colnames(BGfrec)[2]<-"BGfrec"
  FEfrec<-as.data.frame(table(fuentext[,"FEcat"]))
  colnames(FEfrec)[1]<-"ELC_CAT"
  colnames(FEfrec)[2]<-"FEfrec"
  statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
  statelc<-merge(statelc,FEfrec,by="ELC_CAT",all.x=TRUE)
  for (i in 1:length(statelc$BGfrec)){
    if (is.na(statelc$BGfrec[i])){
      statelc$BGfrec[i]<-0
    }
    if (is.na(statelc$FEfrec[i])){
      statelc$FEfrec[i]<-0
    }
  }
  FrecTotal<-statelc$BGfrec+statelc$FEfrec
  Dif_BG_FE<-statelc$FEfrec/(statelc$FEfrec+statelc$BGfrec)
  statelc<-cbind(statelc,Dif_BG_FE,FrecTotal)
  FrecTotal<-subset(statelc,FrecTotal>0)
  cuartil25<-quantile(FrecTotal$FrecTotal,probs=0.25,type=3)
  cuartil50<-quantile(FrecTotal$FrecTotal,probs=0.5,type=3)
  cuartil75<-quantile(FrecTotal$FrecTotal,probs=0.75,type=3)
  tablaclas<-data.frame(nrow=1,ncol=3)
  tablaclas[1,1]<-cuartil25
  colnames(tablaclas)[1]<-"25%"
  tablaclas[1,2]<-cuartil50
  colnames(tablaclas)[2]<-"50%"
  tablaclas[1,3]<-cuartil75
  colnames(tablaclas)[3]<-"75%"
  write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartilesEspecie_QuartileClassificationSpecies.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartilesEspecie_QuartileClassificationSpecies.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("7.Terminado generaci?n/exportaci?n tabla de clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
  clasificacionSp<-vector(length=length(statelc$FrecTotal))
  PorcentajeBG<-vector(length=length(statelc$BGfrec))
  sumaBG<-sum(statelc$BGfrec)
  PorcentajeFE<-vector(length=length(statelc$FEfrec))
  sumaFE<-sum(statelc$FEfrec)
  PorcentajeTOTAL<-vector(length=length(statelc$FrecTotal))
  sumaTOT<-sum(statelc$FrecTotal)
  for(i in 1:length(statelc$FrecTotal)){
    clasificacionSp[i]<-ifelse(statelc$FrecTotal[i]==0,"nula/null",
                               ifelse(statelc$FrecTotal[i]>0&statelc$FrecTotal[i]<=cuartil25,"baja/low",
                                      ifelse(statelc$FrecTotal[i]>cuartil25&statelc$FrecTotal[i]<=cuartil50,"media baja/mid-low",
                                             ifelse(statelc$FrecTotal[i]>cuartil50&statelc$FrecTotal[i]<=cuartil75,"media alta/mid-high","alta/high"))))
    PorcentajeBG[i]<-(statelc$BGfrec[i]*100)/sumaBG
    PorcentajeFE[i]<-(statelc$FEfrec[i]*100)/sumaFE
    PorcentajeTOTAL[i]<-(statelc$FrecTotal[i]*100)/sumaTOT
  }
  write("8.Terminado generaci?n porcentaje de cada categor?a ELC", file="Error/process_info.txt", append=TRUE)
  statelc<-cbind(statelc,PorcentajeBG,PorcentajeFE,PorcentajeTOTAL,clasificacionSp)
  statelc<-merge(statelc,elc,by="ELC_CAT")
  Tipo_faltante<-vector(length=length(statelc[,1]))
  for (i in 1:length(statelc[,1])){
    Tipo_faltante[i]<-ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),1,
                             ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),2,
                                    ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),3,
                                           ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),4,
                                                  ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),5,
                                                         ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),6,
                                                                ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),7,
                                                                       ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),8,
                                                                              ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),9,
                                                                                     ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),10,
                                                                                            ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),11,
                                                                                                   ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),12,
                                                                                                          13))))))))))))
  }
  write("9.Terminado generaci?n de tipos de faltantes", file="Error/process_info.txt", append=TRUE)
  statelc<-cbind(statelc,Tipo_faltante)
  tochi<-subset(statelc,FEfrec!=0)
  tochi1<-chisq.test(tochi$BGfrec,p=tochi$FEfrec/sum(tochi$FEfrec),simulate.p.value=TRUE,B=10000)
  tochi2<-chisq.test(statelc$BGfrec,p=statelc$Frec_celdas/sum(statelc$Frec_celdas),simulate.p.value=TRUE,B=10000)
  write("10.Terminado comparaci?n X2 entre frecuencias", file="Error/process_info.txt", append=TRUE)
  tochi<-matrix(nrow=2, ncol=4)
  tochi[1,1]<-"Distribuci?n BG vs FE"
  tochi[2,1]<-"Distribuci?n BG vs Mapa ELC"
  tochi[1,2]<-tochi1$method
  tochi[2,2]<-tochi2$method
  tochi[1,3]<-tochi1$statistic
  tochi[1,4]<-tochi1$p.value
  tochi[2,3]<-tochi2$statistic
  tochi[2,4]<-tochi2$p.value
  tochi<-as.data.frame(tochi)
  colnames(tochi)[1]<-"Comparacion"
  colnames(tochi)[2]<-"Metodo"
  colnames(tochi)[3]<-"estadistico"
  colnames(tochi)[4]<-"p value"
  write("11.Terminado generaci?n tabla de comparaciones X2", file="Error/process_info.txt", append=TRUE)
  FE_BG_dif<-vector(length=length(statelc[,1]))
  FE_BG_dif<-cbind(statelc$ELC_CAT,FE_BG_dif)
  for(i in 1:length(FE_BG_dif[,1])){
    FE_BG_dif[i,2]<-ifelse(statelc[i,4]>=0,statelc[i,4],0)
    FE_BG_dif[i,2]<-ifelse(is.na(FE_BG_dif[i,2]),0,FE_BG_dif[i,2])
  }
  colnames(FE_BG_dif)[1]<-"ELC_CAT"
  puntosfalt<-data.frame(FE_BG_dif,statelc$clasificacionSp,statelc$ClasificacionMapaELC,statelc$Tipo_faltante)
  colnames(puntosfalt)[3]<-"Class_Sp"
  colnames(puntosfalt)[4]<-"Class_ELC"
  colnames(puntosfalt)[5]<-"Tipo_falt/Gap_type"
  FE_falt<-merge(fuentext,puntosfalt,by.x="FEcat",by.y="ELC_CAT",all.x=TRUE)
  FE_falt<-FE_falt[,c(2:(length(FE_falt[1,])-4),1,(length(FE_falt[1,])-3):length(FE_falt[1,]))]
  fefaltant<-SpatialPointsDataFrame(FE_falt[,c(12,11)],FE_falt)
  statelc2<-statelc[,c(1,13)]
  Class_Sp<-vector(length=length(statelc2[,1]))
  Class_ELC<-vector(length=length(statelc2[,1]))
  for(i in 1:length(statelc2[,1])){
    Class_Sp[i]<-ifelse(statelc$clasificacionSp[i]=="nula",0,
                        ifelse(statelc$clasificacionSp[i]=="baja/low",1,
                               ifelse(statelc$clasificacionSp[i]=="media baja/mid-low",2,
                                      ifelse(statelc$clasificacionSp[i]=="media alta/mid-high",3,4))))
    Class_ELC[i]<-ifelse(statelc$ClasificacionMapaELC[i]=="baja/low",1,
                         ifelse(statelc$ClasificacionMapaELC[i]=="media baja/mid-low",2,
                                ifelse(statelc$ClasificacionMapaELC[i]=="media alta/mid-high",3,4)))
  }
  write("12.Terminado generaci?n clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
  statelc2<-cbind(statelc2,Class_Sp,Class_ELC)
  liminf<-statelc2$ELC_CAT-0.5
  limsup<-statelc2$ELC_CAT+0.5
  reclass1<-cbind(liminf,limsup,statelc2$Tipo_faltante)
  reclass2<-cbind(liminf,limsup,statelc2$Class_Sp)
  reclass3<-cbind(liminf,limsup,statelc2$Class_ELC)
  Tipo_faltante<-reclassify(mapaelc,reclass1)
  Class_Sp<-reclassify(mapaelc,reclass2)
  Class_ELC<-reclassify(mapaelc,reclass3)
  write("13.Terminado generaci?n mapas de tipo faltante, clasificaci?n de frecuencias de la Especie y del mapa ELC", file="Error/process_info.txt", append=TRUE)
  writeRaster(Tipo_faltante,filename=paste(resultados,"/mapa_Tipo_faltante.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Tipo_faltante,filename=paste(resultados,"/mapa_Tipo_faltante.tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.tif",sep=""),overwrite=T,datatype='FLT4S')
  write("14.Terminado exportaci?n mapas tipo faltante y clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
  writeOGR(fefaltant,dsn=paste(resultados),layer="Shapefile_FE_class",driver="ESRI Shapefile")
  statfin<-statelc[,c(1,4)]
  colnames(statfin)[1]<-"BGcat"
  colnames(statfin)[2]<-"CLASS_ELC"
  pasaporte<-merge(pasaporte,statfin,by="BGcat")
  shapefin<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  writeOGR(shapefin,dsn=paste(resultados),layer="Shapefile_Puntos_BG",driver="ESRI Shapefile")
  write("15.Terminado exportaci?n de mapas de puntos BG y FE", file="Error/process_info.txt", append=TRUE)
  write.table(FE_falt,file=paste(resultados,"/Tabla_Fuentes_Externas_clasificadas_ExternalSourcesClassified.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(FE_falt,file=paste(resultados,"/Tabla_Fuentes_Externas_clasificadas_ExternalSourcesClassified.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  colnames(statelc)[2]<-"BGfrec/GBfreq"
  colnames(statelc)[3]<-"FEfrec/ESfreq"
  colnames(statelc)[4]<-"Dif_BG_FE/Diff_GB_ES"
  colnames(statelc)[5]<-"FrecTotal/TotalFreq"
  colnames(statelc)[6]<-"PorcentajeBG/GBpercentage"
  colnames(statelc)[7]<-"PorcentajeFE/ESpercentage"
  colnames(statelc)[8]<-"PorcentajeTOTAL_Sp/TOTAL_Sp_percentage"
  colnames(statelc)[9]<-"Clasificacion_cuartil_Sp/Sp_quartile_classification"
  colnames(statelc)[10]<-"FrecTotalceldas/TotalCellsFreq"
  colnames(statelc)[11]<-"Porcentaje_MapaELC/ELCmap_percentage"
  colnames(statelc)[12]<-"ELCmapa_clases-cuartil/Quartile_classes_ELCmap"
  colnames(statelc)[13]<-"Tipo_faltante/Gap_type"
  write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  colnames(tochi)[1]<-"Compraracion/Comparison"
  colnames(tochi)[2]<-"Metodo/Method"
  colnames(tochi)[3]<-"Estadistico/Chi Value"
  write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("16.Terminado exportaci?n tabla de frecuencias y clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
}

#########################################################################
####Si no hay datos faltantes FE
if (!fext&!gbifFE){
  if (geoqual){
    write("6.Iniciando proceso detecci?n representatividad con s?lo datos BG y de evaluaci?n GEOQUAL", file="Error/process_info.txt", append=TRUE)
    pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
    pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
    pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
    puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
    #Eliminando duplicados ecogeogr?ficos
    if (mean(pasaporte$DECLONGITUDE)<23){
      distdup1<-distdup*0.00833
    }
    if (mean(pasaporte$DECLONGITUDE)>23&mean(pasaporte$DECLONGITUDE)<45){
      distdup1<-distdup*0.00975
    }
    if (mean(pasaporte$DECLONGITUDE)>45&mean(pasaporte$DECLONGITUDE)<67){
      distdup1<-distdup*0.0127
    }
    if (mean(pasaporte$DECLONGITUDE)>67){
      distdup1<-distdup*0.02299
    }
    puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
    pasaporte<-puntosBG@data
    write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
    BGcat<-extract(mapaelc,puntosBG)
    write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    pasaporte<-data.frame(pasaporte,BGcat)
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
    write("6.4.Terminado aplicaci?n filtro de calidad TOTALQUAL100", file="Error/process_info.txt", append=TRUE)
  }
  if (!geoqual){
    write("6.Iniciando proceso detecci?n representatividad con s?lo datos BG y sin evaluaci?n GEOQUAL", file="Error/process_info.txt", append=TRUE)
    pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
    pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
    pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
    puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
    #Eliminando duplicados ecogeogr?ficos
    if (mean(pasaporte$DECLONGITUDE)<23){
      distdup1<-distdup*0.00833
    }
    if (mean(pasaporte$DECLONGITUDE)>23&mean(pasaporte$DECLONGITUDE)<45){
      distdup1<-distdup*0.00975
    }
    if (mean(pasaporte$DECLONGITUDE)>45&mean(pasaporte$DECLONGITUDE)<67){
      distdup1<-distdup*0.0127
    }
    if (mean(pasaporte$DECLONGITUDE)>67){
      distdup1<-distdup*0.02299
    }
    puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
    pasaporte<-puntosBG@data
    write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
    BGcat<-extract(mapaelc,puntosBG)
    pasaporte<-data.frame(pasaporte,BGcat)
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte,file=paste(resultados,"/Genbank_ELC.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
  }
  #Introducci?n tabla de categor?as total del ELCmapa
  statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
  statelc<-as.data.frame(statelc[,"ELC_CAT"])
  colnames(statelc)[1]<-"ELC_CAT"
  #Tablas de frecuencias desde pasaporte
  BGfrec<-as.data.frame(table(pasaporte[,"BGcat"]))
  colnames(BGfrec)[1]<-"ELC_CAT"
  colnames(BGfrec)[2]<-"BGfrec"
  statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
  for (i in 1:length(statelc$BGfrec)){
    if (is.na(statelc$BGfrec[i])){
      statelc$BGfrec[i]<-0
    }
  }
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
  write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartiles_QuartileClassification.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartiles_QuartileClassification.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("7.Terminado generaci?n/exportaci?n tabla de clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
  clasificacionBG<-vector(length=length(statelc$BGfrec))
  PorcentajeBG<-vector(length=length(statelc$BGfrec))
  sumaBG<-sum(statelc$BGfrec)
  for(i in 1:length(statelc$BGfrec)){
    clasificacionBG[i]<-ifelse(statelc$BGfrec[i]==0,"nula",
                               ifelse(statelc$BGfrec[i]>0&statelc$BGfrec[i]<=cuartil25,"baja/low",
                                      ifelse(statelc$BGfrec[i]>cuartil25&statelc$BGfrec[i]<=cuartil50,"media baja/mid-low",
                                             ifelse(statelc$BGfrec[i]>cuartil50&statelc$BGfrec[i]<=cuartil75,"media alta/mid-high","alta/high"))))
    PorcentajeBG[i]<-(statelc$BGfrec[i]*100)/sumaBG
  }
  statelc<-cbind(statelc,PorcentajeBG,clasificacionBG)
  statelc<-merge(statelc,elc,by="ELC_CAT")
  write("8.Terminado generaci?n porcentaje de cada categor?a ELC", file="Error/process_info.txt", append=TRUE)
  tochi2<-chisq.test(statelc$BGfrec,p=statelc$Frec_celdas/sum(statelc$Frec_celdas),simulate.p.value=TRUE,B=10000)
  write("9.Terminado comparaci?n X2 entre frecuencias Bg y ELCmapas", file="Error/process_info.txt", append=TRUE)
  tochi<-matrix(nrow=1, ncol=4)
  tochi[1,1]<-"Distribuci?n BG vs Mapa ELC"
  tochi[1,2]<-tochi2$method
  tochi[1,3]<-tochi2$statistic
  tochi[1,4]<-tochi2$p.value
  tochi<-as.data.frame(tochi)
  colnames(tochi)[1]<-"Comparacion"
  colnames(tochi)[2]<-"Metodo"
  colnames(tochi)[3]<-"estadistico"
  colnames(tochi)[4]<-"p value"
  Class_BG<-vector(length=length(statelc[,1]))
  Class_ELC<-vector(length=length(statelc[,1]))
  for(i in 1:length(statelc[,1])){
    Class_BG[i]<-ifelse(statelc$clasificacionBG[i]=="nula",0,
                        ifelse(statelc$clasificacionBG[i]=="baja/low",1,
                               ifelse(statelc$clasificacionBG[i]=="media baja/mid-low",2,
                                      ifelse(statelc$clasificacionBG[i]=="media alta/mid-high",3,4))))
    Class_ELC[i]<-ifelse(statelc$ClasificacionMapaELC[i]=="baja/low",1,
                         ifelse(statelc$ClasificacionMapaELC[i]=="media baja/mid-low",2,
                                ifelse(statelc$ClasificacionMapaELC[i]=="media alta/mid-high",3,4)))
  }
  write("10.Terminado generaci?n clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
  statelc2<-cbind(statelc,Class_BG,Class_ELC)
  liminf<-statelc2$ELC_CAT-0.5
  limsup<-statelc2$ELC_CAT+0.5
  reclass2<-cbind(liminf,limsup,statelc2$Class_BG)
  reclass3<-cbind(liminf,limsup,statelc2$Class_ELC)
  Class_Sp<-reclassify(mapaelc,reclass2)
  Class_ELC<-reclassify(mapaelc,reclass3)
  write("11.Terminado generaci?n mapas de clasificaci?n de frecuencias de la Especie y del mapa ELC", file="Error/process_info.txt", append=TRUE)
  writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.tif",sep=""),overwrite=T,datatype='FLT4S')
  write("12.Terminado exportaci?n mapas clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
  statfin<-statelc[,c(1,4)]
  colnames(statfin)[1]<-"BGcat"
  colnames(statfin)[2]<-"CLASS_ELC"
  pasaporte<-merge(pasaporte,statfin,by="BGcat")
  shapefin<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
  writeOGR(shapefin,dsn=paste(resultados),layer="Shapefile_Puntos_BG",driver="ESRI Shapefile")
  write("13.Terminado exportaci?n de mapas de puntos BG", file="Error/process_info.txt", append=TRUE)
  colnames(statelc)[2]<-"BGfrec/GBfreq"
  colnames(statelc)[3]<-"PorcentajeBG/GBpercentage"
  colnames(statelc)[4]<-"Clasificacion_cuartil_BG/GB_quartile_classification"
  colnames(statelc)[5]<-"FrecTotalceldas/TotalCellsFreq"
  colnames(statelc)[6]<-"Porcentaje_MapaELC/ELCmap_percentage"
  colnames(statelc)[7]<-"ELCmapa_clases-cuartil/Quartile_classes_ELCmap"
  write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  colnames(tochi)[1]<-"Compraracion/Comparison"
  colnames(tochi)[2]<-"Metodo/Method"
  colnames(tochi)[3]<-"Estadistico/Chi Value"
  write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("14.Terminado exportaci?n tabla de frecuencias y clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
}
####Si los datos faltantes provienen de una descarga de GBIF activando dismo
if(internet){
  if(!fext&gbifFE){
    write("6.Iniciando proceso detecci?n representatividad con datos de evaluaci?n GEOQUAL y Fuentes Externas", file="Error/process_info.txt", append=TRUE)
    if (geoqual){
      pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
      pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
      pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
      puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
      write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
      #Eliminando duplicados ecogeogr?ficos
      if (mean(pasaporte$DECLONGITUDE)<23){
        distdup1<-distdup*0.00833
      }
      if (mean(pasaporte$DECLONGITUDE)>23&mean(pasaporte$DECLONGITUDE)<45){
        distdup1<-distdup*0.00975
      }
      if (mean(pasaporte$DECLONGITUDE)>45&mean(pasaporte$DECLONGITUDE)<67){
        distdup1<-distdup*0.0127
      }
      if (mean(pasaporte$DECLONGITUDE)>67){
        distdup1<-distdup*0.02299
      }
      puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
      pasaporte<-puntosBG@data
      write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
      BGcat<-extract(mapaelc,puntosBG)
      write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
      pasaporte<-data.frame(pasaporte,BGcat)
      pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
      write("6.4.Terminado aplicaci?n filtro de calidad TOTALQUAL100", file="Error/process_info.txt", append=TRUE)
    }
    if (!geoqual){
      pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
      pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
      pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
      puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
      write("6.1 Terminado generacion mapa de puntos BG (pasaporte) con coordenadas", file="Error/process_info.txt", append=TRUE)
      #Eliminando duplicados ecogeogr?ficos
      if (mean(pasaporte$DECLONGITUDE)<23){
        distdup1<-distdup*0.00833
      }
      if (mean(pasaporte$DECLONGITUDE)>23&mean(pasaporte$DECLONGITUDE)<45){
        distdup1<-distdup*0.00975
      }
      if (mean(pasaporte$DECLONGITUDE)>45&mean(pasaporte$DECLONGITUDE)<67){
        distdup1<-distdup*0.0127
      }
      if (mean(pasaporte$DECLONGITUDE)>67){
        distdup1<-distdup*0.02299
      }
      puntosBG<-remove.duplicates(puntosBG,zero=distdup1)
      pasaporte<-puntosBG@data
      write("6.2 Terminado remocion de duplicados espaciales del mapa de puntos BG", file="Error/process_info.txt", append=TRUE)
      BGcat<-extract(mapaelc,puntosBG)
      pasaporte<-data.frame(pasaporte,BGcat)
      write("6.3.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    }
    #introducci?n puntos fuentes externa
    write("6.4-5 iniciando descarga GBIF y extracci?n de datos externos", file="Error/process_info.txt", append=TRUE)
    library(dismo)
    library(jsonlite)
    fuentext<- gbif(paste(genero),paste(especie), ext=extent(mapaelc),geo = TRUE)
    fuentext<-subset(fuentext,!is.na(lat))
    fuentext<-subset(fuentext,!is.na(lon))
    if(nrow(fuentext)==0){
      write("ATENCION!!, error al no descargarse registros desde GBIF", file="Error/process_info.txt", append=TRUE)
    }
    puntosFE<-SpatialPointsDataFrame(fuentext[,c("lon","lat")],fuentext,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    write("6.6 Terminado generacion mapa de puntos FE con coordenadas", file="Error/process_info.txt", append=TRUE)
    if (mean(fuentext$lon)<23){
      distdup2<-distdup*0.00833
    }
    if (mean(fuentext$lon)>23&mean(fuentext$lon)<45){
      distdup2<-distdup*0.00975
    }
    if (mean(fuentext$lon)>45&mean(fuentext$lon)<67){
      distdup2<-distdup*0.0127
    }
    if (mean(fuentext$lon)>67){
      distdup2<-distdup*0.02299
    }
    puntosFE<-remove.duplicates(puntosFE,zero=distdup2)
    fuentext<-puntosFE@data
    write.table(fuentext,file=paste(resultados,"/TablaFuentesExternasGBIF.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(fuentext,file=paste(resultados,"/TablaFuentesExternasGBIF.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write("6.7 Terminado remocion de duplicados espaciales del mapa de puntos FE", file="Error/process_info.txt", append=TRUE)
    FEcat<-extract(mapaelc,puntosFE)
    write("6.8.Terminado extracci?n para puntos FE de categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    fuentext<-data.frame(fuentext,FEcat)
    #
    #Introducci?n tabla de categor?as total del ELCmapa
    statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
    statelc<-as.data.frame(statelc[,"ELC_CAT"])
    colnames(statelc)[1]<-"ELC_CAT"
    #Tablas de frecuencias desde pasaporte/FE
    BGfrec<-as.data.frame(table(pasaporte[,"BGcat"]))
    colnames(BGfrec)[1]<-"ELC_CAT"
    colnames(BGfrec)[2]<-"BGfrec"
    FEfrec<-as.data.frame(table(fuentext[,"FEcat"]))
    colnames(FEfrec)[1]<-"ELC_CAT"
    colnames(FEfrec)[2]<-"FEfrec"
    statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
    statelc<-merge(statelc,FEfrec,by="ELC_CAT",all.x=TRUE)
    for (i in 1:length(statelc$BGfrec)){
      if (is.na(statelc$BGfrec[i])){
        statelc$BGfrec[i]<-0
      }
      if (is.na(statelc$FEfrec[i])){
        statelc$FEfrec[i]<-0
      }
    }
    FrecTotal<-statelc$BGfrec+statelc$FEfrec
    Dif_BG_FE<-statelc$FEfrec/(statelc$FEfrec+statelc$BGfrec)
    statelc<-cbind(statelc,Dif_BG_FE,FrecTotal)
    FrecTotal<-subset(statelc,FrecTotal>0)
    cuartil25<-quantile(FrecTotal$FrecTotal,probs=0.25,type=3)
    cuartil50<-quantile(FrecTotal$FrecTotal,probs=0.5,type=3)
    cuartil75<-quantile(FrecTotal$FrecTotal,probs=0.75,type=3)
    tablaclas<-data.frame(nrow=1,ncol=3)
    tablaclas[1,1]<-cuartil25
    colnames(tablaclas)[1]<-"25%"
    tablaclas[1,2]<-cuartil50
    colnames(tablaclas)[2]<-"50%"
    tablaclas[1,3]<-cuartil75
    colnames(tablaclas)[3]<-"75%"
    write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartiles_QuartileClassification.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablaclas,file=paste(resultados,"/TablaClasificacionCuartiles_QuartileClassification.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write("7.Terminado generaci?n/exportaci?n tabla de clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
    clasificacionSp<-vector(length=length(statelc$FrecTotal))
    PorcentajeBG<-vector(length=length(statelc$BGfrec))
    sumaBG<-sum(statelc$BGfrec)
    PorcentajeFE<-vector(length=length(statelc$FEfrec))
    sumaFE<-sum(statelc$FEfrec)
    PorcentajeTOTAL<-vector(length=length(statelc$FrecTotal))
    sumaTOT<-sum(statelc$FrecTotal)
    for(i in 1:length(statelc$FrecTotal)){
      clasificacionSp[i]<-ifelse(statelc$FrecTotal[i]==0,"nula",
                                 ifelse(statelc$FrecTotal[i]>0&statelc$FrecTotal[i]<=cuartil25,"baja/low",
                                        ifelse(statelc$FrecTotal[i]>cuartil25&statelc$FrecTotal[i]<=cuartil50,"media baja/mid-low",
                                               ifelse(statelc$FrecTotal[i]>cuartil50&statelc$FrecTotal[i]<=cuartil75,"media alta/mid-high","alta/high"))))
      PorcentajeBG[i]<-(statelc$BGfrec[i]*100)/sumaBG
      PorcentajeFE[i]<-(statelc$FEfrec[i]*100)/sumaFE
      PorcentajeTOTAL[i]<-(statelc$FrecTotal[i]*100)/sumaTOT
    }
    write("8.Terminado generaci?n porcentaje de cada categor?a ELC", file="Error/process_info.txt", append=TRUE)
    statelc<-cbind(statelc,PorcentajeBG,PorcentajeFE,PorcentajeTOTAL,clasificacionSp)
    statelc<-merge(statelc,elc,by="ELC_CAT")
    Tipo_faltante<-vector(length=length(statelc[,1]))
    for (i in 1:length(statelc[,1])){
      Tipo_faltante[i]<-ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),1,
                               ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),2,
                                      ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),3,
                                             ifelse(statelc$Dif_BG_FE[i]==1&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),4,
                                                    ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),5,
                                                           ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),6,
                                                                  ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),7,
                                                                         ifelse((statelc$Dif_BG_FE[i]<1&statelc$Dif_BG_FE[i]>=0.5)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),8,
                                                                                ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),9,
                                                                                       ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="baja/low"|statelc$clasificacionSp[i]=="media baja/mid-low")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),10,
                                                                                              ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="baja/low"|statelc$ClasificacionMapaELC[i]=="media baja/mid-low"),11,
                                                                                                     ifelse((statelc$Dif_BG_FE[i]<0.5&statelc$Dif_BG_FE[i]>0)&(statelc$clasificacionSp[i]=="alta/high"|statelc$clasificacionSp[i]=="media alta/mid-high")&(statelc$ClasificacionMapaELC[i]=="alta/high"|statelc$ClasificacionMapaELC[i]=="media alta/mid-high"),12,
                                                                                                            13))))))))))))
    }
    write("9.Terminado generaci?n de tipos de faltantes", file="Error/process_info.txt", append=TRUE)
    statelc<-cbind(statelc,Tipo_faltante)
    tochi<-subset(statelc,FEfrec!=0)
    tochi1<-chisq.test(tochi$BGfrec,p=tochi$FEfrec/sum(tochi$FEfrec),simulate.p.value=TRUE,B=10000)
    tochi2<-chisq.test(statelc$BGfrec,p=statelc$Frec_celdas/sum(statelc$Frec_celdas),simulate.p.value=TRUE,B=10000)
    write("10.Terminado comparaci?n X2 entre frecuencias", file="Error/process_info.txt", append=TRUE)
    tochi<-matrix(nrow=2, ncol=4)
    tochi[1,1]<-"Distribuci?n BG vs FE"
    tochi[2,1]<-"Distribuci?n BG vs Mapa ELC"
    tochi[1,2]<-tochi1$method
    tochi[2,2]<-tochi2$method
    tochi[1,3]<-tochi1$statistic
    tochi[1,4]<-tochi1$p.value
    tochi[2,3]<-tochi2$statistic
    tochi[2,4]<-tochi2$p.value
    tochi<-as.data.frame(tochi)
    colnames(tochi)[1]<-"Comparacion"
    colnames(tochi)[2]<-"Metodo"
    colnames(tochi)[3]<-"estadistico"
    colnames(tochi)[4]<-"p value"
    write("11.Terminado generaci?n tabla de comparaciones X2", file="Error/process_info.txt", append=TRUE)
    FE_BG_dif<-vector(length=length(statelc[,1]))
    FE_BG_dif<-cbind(statelc$ELC_CAT,FE_BG_dif)
    for(i in 1:length(FE_BG_dif[,1])){
      FE_BG_dif[i,2]<-ifelse(statelc[i,4]>=0,statelc[i,4],0)
      FE_BG_dif[i,2]<-ifelse(is.na(FE_BG_dif[i,2]),0,FE_BG_dif[i,2])
    }
    colnames(FE_BG_dif)[1]<-"ELC_CAT"
    puntosfalt<-data.frame(FE_BG_dif,statelc$clasificacionSp,statelc$ClasificacionMapaELC,statelc$Tipo_faltante)
    colnames(puntosfalt)[3]<-"Class_Sp"
    colnames(puntosfalt)[4]<-"Class_ELC"
    colnames(puntosfalt)[5]<-"Tipo_falt/Gap_type"
    FE_falt<-merge(fuentext,puntosfalt,by.x="FEcat",by.y="ELC_CAT",all.x=TRUE)
    FE_falt<-FE_falt[,c(2:(length(FE_falt[1,])-4),1,(length(FE_falt[1,])-3):length(FE_falt[1,]))]
    fefaltant<-SpatialPointsDataFrame(FE_falt[,c("lon","lat")],FE_falt)
    statelc2<-statelc[,c(1,13)]
    Class_Sp<-vector(length=length(statelc2[,1]))
    Class_ELC<-vector(length=length(statelc2[,1]))
    for(i in 1:length(statelc2[,1])){
      Class_Sp[i]<-ifelse(statelc$clasificacionSp[i]=="nula",0,
                          ifelse(statelc$clasificacionSp[i]=="baja/low",1,
                                 ifelse(statelc$clasificacionSp[i]=="media baja/mid-low",2,
                                        ifelse(statelc$clasificacionSp[i]=="media alta/mid-high",3,4))))
      Class_ELC[i]<-ifelse(statelc$ClasificacionMapaELC[i]=="baja/low",1,
                           ifelse(statelc$ClasificacionMapaELC[i]=="media baja/mid-low",2,
                                  ifelse(statelc$ClasificacionMapaELC[i]=="media alta/mid-high",3,4)))
    }
    write("12.Terminado generaci?n clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)
    statelc2<-cbind(statelc2,Class_Sp,Class_ELC)
    liminf<-statelc2$ELC_CAT-0.5
    limsup<-statelc2$ELC_CAT+0.5
    reclass1<-cbind(liminf,limsup,statelc2$Tipo_faltante)
    reclass2<-cbind(liminf,limsup,statelc2$Class_Sp)
    reclass3<-cbind(liminf,limsup,statelc2$Class_ELC)
    Tipo_faltante<-reclassify(mapaelc,reclass1)
    Class_Sp<-reclassify(mapaelc,reclass2)
    Class_ELC<-reclassify(mapaelc,reclass3)
    write("13.Terminado generaci?n mapas de tipo faltante, clasificaci?n de frecuencias de la Especie y del mapa ELC", file="Error/process_info.txt", append=TRUE)
    writeRaster(Tipo_faltante,filename=paste(resultados,"/mapa_Tipo_faltante.grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(Tipo_faltante,filename=paste(resultados,"/mapa_Tipo_faltante.tif",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(Class_Sp,filename=paste(resultados,"/mapa_Class_Sp.tif",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(Class_ELC,filename=paste(resultados,"/mapa_Class_ELC.tif",sep=""),overwrite=T,datatype='FLT4S')
    write("14.Terminado exportaci?n mapas tipo faltante y clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
    writeOGR(fefaltant,dsn=paste(resultados),layer="Shapefile_FE_class",driver="ESRI Shapefile")
    statfin<-statelc[,c(1,4)]
    colnames(statfin)[1]<-"BGcat"
    colnames(statfin)[2]<-"CLASS_ELC"
    pasaporte<-merge(pasaporte,statfin,by="BGcat")
    shapefin<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    writeOGR(shapefin,dsn=paste(resultados),layer="Shapefile_Puntos_BG",driver="ESRI Shapefile")
    write("15.Terminado exportaci?n de mapas de puntos BG y FE", file="Error/process_info.txt", append=TRUE)
    write.table(FE_falt,file=paste(resultados,"/Tabla_Fuentes_Externas_clasificadas_ExternalSourcesClassified.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(FE_falt,file=paste(resultados,"/Tabla_Fuentes_Externas_clasificadas_ExternalSourcesClassified.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    colnames(statelc)[2]<-"BGfrec/GBfreq"
    colnames(statelc)[3]<-"FEfrec/ESfreq"
    colnames(statelc)[4]<-"Dif_BG_FE/Diff_GB_ES"
    colnames(statelc)[5]<-"FrecTotal/TotalFreq"
    colnames(statelc)[6]<-"PorcentajeBG/GBpercentage"
    colnames(statelc)[7]<-"PorcentajeFE/ESpercentage"
    colnames(statelc)[8]<-"PorcentajeTOTAL_Sp/TOTAL_Sp_percentage"
    colnames(statelc)[9]<-"Clasificacion_cuartil_Sp/Sp_quartile_classification"
    colnames(statelc)[10]<-"FrecTotalceldas/TotalCellsFreq"
    colnames(statelc)[11]<-"Porcentaje_MapaELC/ELCmap_percentage"
    colnames(statelc)[12]<-"ELCmapa_clases-cuartil/Quartile_classes_ELCmap"
    colnames(statelc)[13]<-"Tipo_faltante/Gap_type"
    write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(statelc,file=paste(resultados,"/Tabla_Resultados_Representatividad_RepresentativenessResults.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    colnames(tochi)[1]<-"Compraracion/Comparison"
    colnames(tochi)[2]<-"Metodo/Method"
    colnames(tochi)[3]<-"Estadistico/Chi Value"
    write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tochi,file=paste(resultados,"/Tabla_Resultados_X2_Results.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write("16.Terminado exportaci?n tabla de frecuencias y clasificaci?n de frecuencias", file="Error/process_info.txt", append=TRUE)
  }
}
