library(sp)
library(raster)
library(maptools)
library(dismo)
library(rgdal)
library(rgeos)


#CUBA nuevo
setwd("D:/RFAA/TIRFAA_CWRdescriptors/TerceraParte/DatosGRULAC/CU")
tablaor<-read.delim("CWRI_Format_Cuba_2022 (Dic).txt")
colnames(tablaor)[15]<-"DECLATITUDE."
colnames(tablaor)[16]<-"DECLONGITUDE."
tablaor<-subset(tablaor,(!is.na(DECLATITUDE.)&!is.na(DECLONGITUDE.)))
puntos<-SpatialPointsDataFrame(tablaor[,c(16,15)],tablaor)
proj4string(puntos)<-" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
writeOGR(puntos,dsn="D:/RFAA/TIRFAA_CWRdescriptors/TerceraParte/DatosGRULAC/AreasProtegidasCuba",layer="Puntos",driver="ESRI Shapefile")


setwd("D:/RFAA/TIRFAA_CWRdescriptors/TerceraParte/DatosGRULAC/AreasProtegidasCuba")
APcu<-readOGR("areasprotegidas.shp")
summary(APcu)
APcu2<- spTransform(APcu, CRS(" +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
summary(APcu2)
writeOGR(APcu2,dsn="D:/RFAA/TIRFAA_CWRdescriptors/TerceraParte/DatosGRULAC/AreasProtegidasCuba",layer="AreasProtegidasCubaWGS",driver="ESRI Shapefile")

WDPA<-over(puntos,APcu2)
WDPA<-cbind(tablaor,WDPA)

#Exportar la extracción
write.table(WDPA, file="D:/RFAA/TIRFAA_CWRdescriptors/TerceraParte/DatosGRULAC/CU/ExtraccionAP-CU.xls", sep = "\t", row.names = FALSE, qmethod = "double")
#
