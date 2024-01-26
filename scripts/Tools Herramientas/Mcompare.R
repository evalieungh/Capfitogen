######################################################################
# Script  de la herramienta Mcompare - Mcompare Tool script 
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

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LINEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRARA DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
##########################################################################################################
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write("______Herramienta/Tool Mcompare________", file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Mcompare.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("rutapresent:", rutapresent,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("modelpresent:", modelpresent,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("binarizedp:", binarizedp,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("binarthresp:", binarthresp,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("rutaigual:", rutaigual,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("rutafuture:", rutafuture,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("modelfuture:", modelfuture,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("binarizedf:", binarizedf,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("binarthresf:", binarthresf,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.Mcompare.txt", append=TRUE)

setwd(paste(ruta))
#Carga paquetes
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
library(rgeos)
library(rgdal)

#Intro modelo presente
rasterp<-raster(paste(rutapresent,"/",modelpresent,sep=""))

#Intro modelo futuro
if(rutaigual){
  rasterf<-raster(paste(rutapresent,"/",modelfuture,sep=""))
}
if(!rutaigual){
  rasterf<-raster(paste(rutafuture,"/",modelfuture,sep=""))
}
#Prueba de compatibilidad
if(rasterp@extent!=rasterf@extent|rasterp@ncols!=rasterf@ncols|rasterp@nrows!=rasterf@nrows){
  stop("Your present and future models raster have not the same extent and number of columns and/or rows. Please be sure you are introducing comparable models rasters")
}
#arreglo de extensiones cuando la diferencia se encuentra a partir del cuarto decimal (30 sec)
#primero absolutos
xminp<-rasterp@extent@xmin
xmaxp<-rasterp@extent@xmax
yminp<-rasterp@extent@ymin
ymaxp<-rasterp@extent@ymax
xminf<-rasterf@extent@xmin
xmaxf<-rasterf@extent@xmax
yminf<-rasterf@extent@ymin
ymaxf<-rasterf@extent@ymax
if(xminp<0){
  xminp<-xminp*-1
}
if(xmaxp<0){
  xmaxp<-xmaxp*-1
}
if(yminp<0){
  yminp<-yminp*-1
}
if(ymaxp<0){
  ymaxp<-ymaxp*-1
}
if(xminf<0){
  xminf<-xminf*-1
}
if(xmaxf<0){
  xmaxf<-xmaxf*-1
}
if(yminf<0){
  yminf<-yminf*-1
}
if(ymaxf<0){
  ymaxf<-ymaxf*-1
}
xmaxc<-xmaxf-xmaxp
xminc<-xminf-xminp
ymaxc<-ymaxf-ymaxp
yminc<-yminf-yminp
if(xmaxc<0){
  xmaxc<-xmaxc*-1
}
if(xminc<0){
  xminc<-xminc*-1
}
if(ymaxc<0){
  ymaxc<-ymaxc*-1
}
if(yminc<0){
  yminc<-yminc*-1
}
#asignaci?n de extent en caso de peque??simas diferencias
if(xmaxc<0.0001&xminc<0.0001&ymaxc<0.0001&yminc<0.0001){
  moldextent<-extent(rasterp)
  extent(rasterf)<-moldextent
}
#rechazo si las diferencias sobrepasan el umbral 0.0001
if(xmaxc>0.0001|xminc>0.0001|ymaxc>0.0001|yminc>0.0001){
  stop("Your present and future models raster have not the same extent and number of columns and/or rows. Please be sure you are introducing comparable models rasters")
}
#ahora si, 
if(rasterp@extent==rasterf@extent&rasterp@ncols==rasterf@ncols&rasterp@nrows==rasterf@nrows){
  #check si los rasters son binarios
  if(binarizedp){
    if(rasterp@data@max!=1|rasterp@data@min!=0){
      stop("your present model raster is not a binary map (0 for absence, 1 for presence). Please change the parameters, introducing a valid model raster")
    }
  }
  if(binarizedf){
    if(rasterf@data@max!=1|rasterf@data@min!=0){
      stop("your present model raster is not a binary map (0 for absence, 1 for presence). Please change the parameters, introducing a valid model raster")
    }
  }
  #si los rasters no son binarios, binarizarlos
  if(!binarizedp){
    reclassp<-c(0,binarthresp,0, binarthresp,1000,1)
    reclassp<-matrix(reclassp,ncol=3,byrow=TRUE)
    rasterp<-reclassify(rasterp,reclassp)
  }
  if(!binarizedf){
    reclassf<-c(0,binarthresf,0, binarthresf,1000,1)
    reclassf<-matrix(reclassf,ncol=3,byrow=TRUE)
    rasterf<-reclassify(rasterf,reclassf)
  }
  #Continua
  recmatrix<-matrix(c(1,0,2,0),nrow=2,ncol=2)
  rasterp2<-reclassify(rasterp,recmatrix)
  recmatrix2<-matrix(c(2,1,-1,0,1,3,4,2),nrow=4,ncol=2)
  rasterc<-rasterp2-rasterf
  rasterc<-reclassify(rasterc,recmatrix2)
  stats1<-as.data.frame(table(rasterc@data@values))
  colnames(stats1)[1]<-"Code_Codigo"
  #Tabla comparativa
  Code_Codigo<-c(1,2,3,4)
  Situations<-c("High impact","Outside realized niche","Low impact","New suitable")
  Situaciones<-c("Reducci?n distribuci?n/Alto impacto","No presente-no futuro/Fuera del nicho realizado","Mantenimiento distribuci?n/Bajo impacto","Aumento distribuci?n/Nueva disponibilidad")
  TablaCode<-data.frame(Code_Codigo,Situations,Situaciones)
  colnames(TablaCode)[1]<-"Code_Codigo"
  stats1<-merge(TablaCode,stats1,by="Code_Codigo",all.y=TRUE)
  
  setwd(paste(resultados))
  write.table(stats1,file="Comparison_stats.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(stats1,file="Comparison_stats.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  writeRaster(rasterc,filename="ComparisonMap.grd",overwrite=T,datatype='FLT4S')
  writeRaster(rasterc,filename="ComparisonMap.tif",overwrite=T,datatype='FLT4S')
  
  #Parte de los puntos
  ###########IntroDatos y Capas###############
  #Intro data y limpieza
  setwd(paste(ruta))
  pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
  pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
  pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
  #Eliminaci?n entradas bajo umbral geoqual
  if(geoqual){
    pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
  }
  
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
  #
  puntos<-pasaporte[,c("DECLONGITUDE","DECLATITUDE")]
  puntos<-SpatialPointsDataFrame(puntos,pasaporte)
  puntos<-remove.duplicates(puntos,zero=distdup1)
  Code.Impact<-extract(rasterc,puntos)
  puntos<-data.frame(puntos@data,Code.Impact)
  stats2<-data.frame(table(puntos$Code.Impact))
  colnames(stats2)[1]<-"Code_Codigo"
  stats2<-merge(TablaCode,stats2,by="Code_Codigo",all.y=TRUE)
  setwd(paste(resultados))
  write.table(stats2,file="PresenceData_Classification.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(stats2,file="PresenceData_Classification.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  
  puntos<-SpatialPointsDataFrame(puntos[,c("DECLONGITUDE","DECLATITUDE")],puntos)
  
  writeOGR(puntos,dsn=paste(resultados),layer="Current_PresenceData_Classified",driver="ESRI Shapefile")
}

