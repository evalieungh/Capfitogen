######################################################################
# Script  de la herramienta ELCmapas - ELCmapas Tool script 
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

#1. Creating a report of parameters used

{
  #Parametros/Parameters
  setwd(paste(resultados))
  write(paste(), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write("_________________________________________", file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write("______Herramienta/Tool ELCmapas________", file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write("_________________________________________", file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste(), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  
  write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("pais:", pais,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("bioclimv:", bioclimv,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("geophysv:", geophysv,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("edaphv:", edaphv,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("maxg:", maxg,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("metodo:", metodo,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("iterat:", iterat,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.ELCmapas.txt", append=TRUE)
  
  
  ##Elemento introducido por el usuario: ruta (ruta is a parameter introduced bu the user and it should be the path to main CAPFITOGEN folder in the local PC)
  #Determinar esa ruta como directorio de trabajo
  setwd(paste(ruta))
  write("______NUEVO PROCESO ELCmapas________", file="Error/process_info.txt", append=TRUE)
  write(date(), file="Error/process_info.txt", append=TRUE)
  
  ##########################################################################################################
  #Ampliaci?n m?xima de la capacidad de uso de memoria ram - expanding memory capacity for the analysis but this function is not working anymore in R
  #memory.size(max =TRUE)
}

#2. Installing (in case of absence) and load required packages

{
  #Checking package installation and installing them in case
  #activar paquetes ya instalados y necesarios
  #Check e instalacion si a lugar
  packages2<-vector()
  if(system.file(package="modeltools")==""){
    packages2<-append(packages2,"modeltools")
  }
  if(system.file(package="lattice")==""){
    packages2<-append(packages2,"lattice")
  }
  if(system.file(package="flexmix")==""){
    packages2<-append(packages2,"flexmix")
  }
  if(system.file(package="fpc")==""){
    packages2<-append(packages2,"fpc")
  }
  if(system.file(package="sp")==""){
    packages2<-append(packages2,"sp")
  }
  if(system.file(package="raster")==""){
    packages2<-append(packages2,"raster")
  }
  if(system.file(package="sf")==""){
    packages2<-append(packages2,"sf")
  }
  if(system.file(package="terra")==""){
    packages2<-append(packages2,"terra")
  }
  if(system.file(package="vegan")==""){
    packages2<-append(packages2,"vegan")
  }
  if(system.file(package="mclust")==""){
    packages2<-append(packages2,"mclust")
  }
  if(system.file(package="adegenet")==""){
    packages2<-append(packages2,"adegenet")
  }
  
  #Missing packages to be installed
  #Instalar los que hagan falta
  if(length(packages2)>0){
    install.packages(setdiff(packages2, rownames(installed.packages())))
  }
  #Carga de paquetes
  #Loading packages required for ELCmapas process
  library(modeltools)
  library(lattice)
  library(flexmix)
  library(fpc)
  library(sp)
  library(raster)
  library(sf)
  library(terra)
  #library(ncdf) not needed anymore
  library(vegan)
  library(mclust)
  library(adegenet)
  #writing in Error/process_info.txt file is useful to know where the process failed when the user is running the tools indirectly (when the R script is hided)
  write("1.Terminado proceso de instalaci?n y carga de paquetes", file="Error/process_info.txt", append=TRUE)
  
}

#3. Checking the validity of introduced parameters

{
  #Correcting or adjusting some parameters introduced by uysers according to R script further requirements
  #Correcci?n de un posible 1x1 cuando se seleccione "europe"
  if(pais=="Europe"){
    resol1 <- "Celdas 5x5 km aprox (2.5 arc-min)"
  }
  
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
  
  ##Elemento introducido por el usuario: resol1
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
  
  #carga capa de puntos
  #loading map centroids matrix for the selected region or country
  load(paste("rdatapoints/",pais,"/",resol,"/base",resol,".RData",sep=""))
  if(length(puntos$POINTID)>=1000000){
    puntos$POINTID<-c(1:length(puntos$POINTID))
  }
  #introducing the complete list (table) of available variables
  #Introducci?n tablas de variables disponibles
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
  loadError<-FALSE
  abcd<-try(load("geophys.RData"),silent=TRUE)
  loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
  if(loadError){
    geophys<-read.delim("geophys.txt")
  }
  rm(abcd)
  rm(loadError)
  
  write("2.Terminado proceso de carga de lista de paises y variables", file="Error/process_info.txt", append=TRUE)
  
  ##Introducing the list of variables by component (bioclimatic, edaphic and geophysic ones) selected by the user 
  ##Elemento introducido por el usuario: bioclimv
  bioclim2<-1:length(bioclimv)
  bioclimv<-as.data.frame(cbind(bioclim2,bioclimv))
  colnames(bioclimv)[2]<-"VARDESCR"
  
  bioclimv<-merge(bioclim,bioclimv, by="VARDESCR", all=F)
  bioclimv<-as.character(bioclimv[,3])
  
  ##Elemento introducido por el usuario: geophysv
  geophys2<-1:length(geophysv)
  geophysv<-as.data.frame(cbind(geophys2,geophysv))
  colnames(geophysv)[2]<-"VARDESCR"
  
  geophysv<-merge(geophys,geophysv, by="VARDESCR", all=FALSE,sort=FALSE)
  geophysv<-as.character(geophysv[,3])
  
  ##Elemento introducido por el usuario: edaphv
  edaph2<-1:length(edaphv)
  edaphv<-as.data.frame(cbind(edaph2,edaphv))
  colnames(edaphv)[2]<-"VARDESCR"
  
  edaphv<-merge(edaph,edaphv, by="VARDESCR", all=F)
  edaphv<-as.character(edaphv[,3])
  
  write("3.Terminado proceso de arreglo de tablas finales de variables", file="Error/process_info.txt", append=TRUE)
  
}

#4. Creating stacks of raster layers (introducing selected ecogeographical layers)

{
  #Creating raster layers within r using the list of variables per component and other user's parameters
  #Creating raster stacks to be sure the raster layers are fully compatible and available for extraction
  #carga capas
  #concatenaci?n de todas las variables seleccionadas de todos los componentes
  #produccion de dos stacks
  biocliml<-list()
  for(i in 1:length(bioclimv)){
    biocliml[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",bioclimv[i],".tif",sep=""))
    names(biocliml[[i]])<-paste(bioclimv[i])
  }
  bioclimstack<-do.call("stack",biocliml)
  geophysl<-list()
  for(i in 1:length(geophysv)){
    geophysl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",geophysv[i],".tif",sep=""))
    names(geophysl[[i]])<-paste(geophysv[i])
  }
  geophysstack<-do.call("stack",geophysl)
  edaphl<-list()
  for(i in 1:length(edaphv)){
    edaphl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",edaphv[i],".tif",sep=""))
    names(edaphl[[i]])<-paste(edaphv[i])
  }
  edaphstack<-do.call("stack",edaphl)
  
  write("4.Terminado proceso de carga de capas raster ecogeograficas .grd", file="Error/process_info.txt", append=TRUE)
  
}

#5. Creating matrices of values from each stack (one cell in a map – one value in a matrix)

{
  #extracting information from the raster stacks per component for each centroid
  #creating the input table for further cluster analysis
  #Extracci?n de informaci?n
  #bioclim?tica
  bioclim<-extract(bioclimstack,puntos[,c("POINT_X","POINT_Y")])
  bioclim<-cbind(puntos[,1],bioclim)
  colnames(bioclim)[1]<-"POINTID"
  #geof?sica
  geophys<-extract(geophysstack,puntos[,c("POINT_X","POINT_Y")])
  geophys<-cbind(puntos[,1],geophys)
  colnames(geophys)[1]<-"POINTID"
  
  #Introducing Longitude and/or Latitude of each centroid as a variable for the cluster analysis according to user's parameters 
  ##Aqu? entran los logical latitud y longitud a gusto del usuario
  if(longitud){
    geophys<-cbind(geophys,puntos[,2])
    colnames(geophys)[ncol(geophys)]<-"LONGITUD"
  }
  if(latitud){
    geophys<-cbind(geophys,puntos[,3])
    colnames(geophys)[ncol(geophys)]<-"LATITUD"
  }
  #ed?fica
  edaph<-extract(edaphstack,puntos[,c("POINT_X","POINT_Y")])
  edaph<-cbind(puntos[,1],edaph)
  colnames(edaph)[1]<-"POINTID"
  
  write("5.Terminado proceso de extraccion para puntos/pais desde stacks", file="Error/process_info.txt", append=TRUE)
  
  
  #Se salvan las tablas de datos originales para estadisticas posteriores
  save(bioclim,file="bioclimorg.RData")
  save(geophys,file="geophysorg.RData")
  save(edaph,file="edaphorg.RData")
  
}

# 6. Standardizing (rescaling) the variables (mean zero, sd=1)

{
  #Estandarizaci?n de las variables
  bioclim<-data.frame(bioclim[,1],scale(bioclim[,-1]))
  bioclim<- na.omit(bioclim)
  colnames(bioclim)[1]<-"POINTID"
  geophys<-data.frame(geophys[,1],scale(geophys[,-1]))
  geophys<- na.omit(geophys)
  colnames(geophys)[1]<-"POINTID"
  edaph<-data.frame(edaph[,1],scale(edaph[,-1]))
  edaph<- na.omit(edaph)
  colnames(edaph)[1]<-"POINTID"
  
  write("6.Terminado proceso de estandarizacion de variables ecogeograficas", file="Error/process_info.txt", append=TRUE)
  
  #M?todos de cluster
  ##Aqu? entra la variable "metodo" definida por usuario
  ##aqu? entra la variable "maxg" definida por usuario 
}

#7. Finding the optimal number of clusters for each ecogeographic component (six methods)
#8. Clustering

{
  ############################################################
  #######Methodo de sucesivos K-mens y BIC criterios##########
  if(metodo=="kmeansbic"){
    #Bioclim
    fitb<-find.clusters(bioclim[,-1],stat="BIC",choose.n.clust=FALSE,criterion="goodfit",
                        max.n.clust=maxg,center=TRUE, scale=TRUE,pca.select="percVar",
                        perc.pca=75)
    BIOCLUST<-as.numeric(fitb$grp)
    bioclim<-data.frame(bioclim, BIOCLUST)
    BIOCLUST<-length(unique(BIOCLUST))
    setwd(paste(resultados))
    jpeg(file = "Bioclim_BIC_optimal_N_clusters.jpeg")
    plot(fitb$Kstat,type="o",xlab="number of clusters (K)", ylab="BIC",col="blue",main=paste("Detection based on BIC. Optimal value=",round(fitb$stat,1),sep=""))
    points(BIOCLUST, fitb$Kstat[BIOCLUST], pch="x", cex=2)
    dev.off()
    rm(fitb)
    rm(BIOCLUST)
    #Geophysic
    fitg<-find.clusters(geophys[,-1],stat="BIC",choose.n.clust=FALSE,criterion="goodfit",
                        max.n.clust=maxg,center=TRUE, scale=TRUE,pca.select="percVar",
                        perc.pca=75)
    GEOCLUST<-as.numeric(fitg$grp)
    geophys<-data.frame(geophys, GEOCLUST)
    GEOCLUST<-length(unique(GEOCLUST))
    jpeg(file = "Geophysic_BIC_optimal_N_clusters.jpeg")
    plot(fitg$Kstat,type="o",xlab="number of clusters (K)", ylab="BIC",col="blue",main=paste("Detection based on BIC. Optimal value=",round(fitg$stat,1),sep=""))
    points(GEOCLUST, fitg$Kstat[GEOCLUST], pch="x", cex=2)
    dev.off()
    rm(fitg)
    rm(GEOCLUST)
    #Edaphic
    fite<-find.clusters(edaph[,-1],stat="BIC",choose.n.clust=FALSE,criterion="goodfit",
                        max.n.clust=maxg,center=TRUE, scale=TRUE,pca.select="percVar",
                        perc.pca=75)
    EDACLUST<-as.numeric(fite$grp)
    edaph<-data.frame(edaph, EDACLUST)
    EDACLUST<-length(unique(EDACLUST))
    jpeg(file = "Edaphic_BIC_optimal_N_clusters.jpeg")
    plot(fite$Kstat,type="o",xlab="number of clusters (K)", ylab="BIC",col="blue",main=paste("Detection based on BIC. Optimal value=",round(fite$stat,1),sep=""))
    points(EDACLUST, fite$Kstat[EDACLUST], pch="x", cex=2)
    dev.off()
    rm(fite)
    rm(EDACLUST)
    setwd(paste(ruta))
  }
  
  ############################################################
  #######Partici?n alrededor de medoides, uso de Clara########
  
  #if(metodo=="medoides"){
    if(nrow(bioclim)<=10000){
      fitbioclim<-pamk(bioclim[,-1],krange=2:maxg,criterion="asw",usepam=F)
      bioclim<-cbind(bioclim,fitbioclim$pamobject$clustering)
      colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    }
    if(nrow(bioclim)>10000){
      fitbioclim<-pamk(bioclim[,-1],krange=2:maxg,criterion="multiasw",usepam=F)
      bioclim<-cbind(bioclim,fitbioclim$pamobject$clustering)
      colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    }
    if(nrow(geophys)<=10000){
      fitgeophys<-pamk(geophys[,-1],krange=2:maxg,criterion="asw",usepam=F)
      geophys<-cbind(geophys,fitgeophys$pamobject$clustering)
      colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    }
    if(nrow(geophys)>10000){
      fitgeophys<-pamk(geophys[,-1],krange=2:maxg,criterion="multiasw",usepam=F)
      geophys<-cbind(geophys,fitgeophys$pamobject$clustering)
      colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    }
    if(nrow(edaph)<=10000){
      fitedaph<-pamk(edaph[,-1],krange=2:maxg,criterion="asw",usepam=F)
      edaph<-cbind(edaph,fitedaph$pamobject$clustering)
      colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    }
    if(nrow(edaph)>10000){
      fitedaph<-pamk(edaph[,-1],krange=2:maxg,criterion="multiasw",usepam=F)
      edaph<-cbind(edaph,fitedaph$pamobject$clustering)
      colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    }
    write("7.Terminado proceso de agrupamiento por componente - Medoides", file="Error/process_info.txt", append=TRUE)
  }
  

#9. Combining clusters from each component to obtain ecogeographical categories (bioclimatic, edaphic and geophysical unique conditions)
#10. Creating each component and the combination (ELC) map

{
  ########################################################################
  ##################FIN de CLUSTERIZACION#################################
  #Eliminaci?n variables estandarizadas y adici?n de variables originales#
  bioclim2<-bioclim[,c(1,ncol(bioclim))]
  geophys2<-geophys[,c(1,ncol(geophys))]
  edaph2<-edaph[,c(1,ncol(edaph))]
  rm(bioclim, geophys, edaph)
  load("bioclimorg.RData")
  load("geophysorg.RData")
  load("edaphorg.RData")
  bioclim<-merge(bioclim,bioclim2,by="POINTID")
  geophys<-merge(geophys,geophys2,by="POINTID")
  edaph<-merge(edaph,edaph2,by="POINTID")
  rm(bioclim2,geophys2,edaph2)
  
  write("8.Terminado proceso de reintroduccion de variables originales no estandarizadas", file="Error/process_info.txt", append=TRUE)
  
  
  #Consolidaci?n de tabla ?nica a trav?s de tabla puntos
  tabla<-merge(puntos,bioclim,by="POINTID",all.x=T)
  tabla<-merge(tabla,geophys,by="POINTID",all.x=T)
  tabla<-merge(tabla,edaph,by="POINTID",all.x=T)
  #rm(bioclim,geophys,edaph,puntos)
  mapaelc<-as.data.frame(matrix(nrow = length(tabla[,1]), ncol = 3))
  mapaelc[,1]<-tabla[,1]
  colnames(mapaelc)[1]<-"POINTID"
  colnames(mapaelc)[2]<-"COMBI"
  for (i in 1:length(tabla[,1])) {
    mapaelc[i,2]<-ifelse(is.na(substr(tabla$BIOCLUST[i],1,1))|is.na(substr(tabla$GEOCLUST[i],1,1))|is.na(substr(tabla$EDACLUST[i],1,1)),NA,
                         paste(substr(tabla$BIOCLUST[i],1,1),substr(tabla$GEOCLUST[i],1,1),substr(tabla$EDACLUST[i],1,1),sep=""))
  }
  elc<-subset(mapaelc,!duplicated(COMBI),select=-POINTID)
  elc<-subset(elc,!is.na(COMBI))
  i <- order(elc$COMBI)
  elc<- elc[i,] 
  
  #Asigning numbers to each categorie
  elc[,2]<-1:nrow(elc)
  mapaelc<-mapaelc[,1:2]
  #Asignation
  mapaelc<-merge(mapaelc,elc,by="COMBI")
  colnames(mapaelc)[3]<-"ELC_CAT"
  tabla<-merge(tabla,mapaelc,by="POINTID",all.x=T)
  tabla$ELC_CAT[is.na(tabla$ELC_CAT)]<-0
  tabla$BIOCLUST[is.na(tabla$BIOCLUST)]<-0
  tabla$GEOCLUST[is.na(tabla$GEOCLUST)]<-0
  tabla$EDACLUST[is.na(tabla$EDACLUST)]<-0
  
  #Creating ELC raster map
  mapaelc0<-raster(matrix(nrow=dim(biocliml[[1]])[1],ncol=dim(biocliml[[1]])[2]),template=bioclimstack)
  mapaelc1<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$ELC_CAT)
  mapaelc2<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$BIOCLUST)
  mapaelc3<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$GEOCLUST)
  mapaelc4<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$EDACLUST)
  
  write("9.Terminado proceso de consolidaci?n de tabla unica y generacion mapa ELC", file="Error/process_info.txt", append=TRUE)
  
}

#11. Characterizing each final cluster by the original variables (not rescaled)
#12. Exporting tables and maps in different formats

{
  #mostrar mapa
  #brk<-seq(0,max(tabla$ELC_CAT),by=1)
  #nb<-length(brk)
  ##OBJETO SALIDA1 como figura
  #plot(mapaelc1,breaks=brk,col=rainbow(max(tabla$ELC_CAT)+1),lab.breaks=brk)
  #plot(mapaelc2,breaks=brk,col=rainbow(max(tabla$BIOCLUST)),lab.breaks=brk)
  #plot(mapaelc3,breaks=brk,col=rainbow(max(tabla$GEOCLUST)),lab.breaks=brk)
  #plot(mapaelc4,breaks=brk,col=rainbow(max(tabla$EDACLUST)),lab.breaks=brk)
  
  ##OBJETOS SALIDAS 1 y 2 como archivos a ser guardados
  ##Usuario introduce ruta como "resultados"
  
  crs(mapaelc2)<-"+proj=longlat"
  crs(mapaelc3)<-"+proj=longlat"
  crs(mapaelc4)<-"+proj=longlat"
  
  writeRaster(mapaelc1,filename=paste(resultados,"/mapa_elc_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  crs(mapaelc1)<-"+proj=longlat"
  writeRaster(mapaelc1,filename=paste(resultados,"/mapa_elc_DIVA_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc1,filename=paste(resultados,"/mapa_elc_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  
  writeRaster(mapaelc2,filename=paste(resultados,"/mapa_bioclimatico_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc2,filename=paste(resultados,"/mapa_bioclimatico_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc3,filename=paste(resultados,"/mapa_geofisico_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc3,filename=paste(resultados,"/mapa_geofisico_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc4,filename=paste(resultados,"/mapa_edafico_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
  writeRaster(mapaelc4,filename=paste(resultados,"/mapa_edafico_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
  KML(mapaelc1,file=paste(resultados,"/mapa_elc_",pais,".kml",sep=""),overwrite=T)
  
  write("10.Terminado proceso de exportacion de mapa ELC", file="Error/process_info.txt", append=TRUE)
  
  
  #OBJETO SALIDA 3
  #tablas estad?sticas por componente
  #OBJETO SALIDA 3
  #tablas estad?sticas por componente
  tablabio<-data.frame(table(bioclim$BIOCLUST))
  colnames(tablabio)[1]<-"BIOCLIM_CAT"
  tablabioclim<-aggregate(bioclim[,2:(length(bioclim[1,])-1)],by=list(bioclim$BIOCLUST),mean,na.rm=TRUE)
  colnames(tablabioclim)[1]<-"BIOCLIM_CAT"
  tablabioclim1<-aggregate(bioclim[,2:(length(bioclim[1,])-1)],by=list(bioclim$BIOCLUST),min,na.rm=TRUE)
  colnames(tablabioclim1)[1]<-"BIOCLIM_CAT"
  tablabioclim2<-aggregate(bioclim[,2:(length(bioclim[1,])-1)],by=list(bioclim$BIOCLUST),max,na.rm=TRUE)
  colnames(tablabioclim2)[1]<-"BIOCLIM_CAT"
  tablabioclim3<-aggregate(bioclim[,2:(length(bioclim[1,])-1)],by=list(bioclim$BIOCLUST),sd,na.rm=TRUE)
  colnames(tablabioclim3)[1]<-"BIOCLIM_CAT"
  tablabioclim<-merge(tablabio,tablabioclim, by="BIOCLIM_CAT")
  tablabioclim<-merge(tablabioclim,tablabioclim1, by="BIOCLIM_CAT",suffixes=c(".media",".min"))
  tablabioclim2<-merge(tablabioclim2,tablabioclim3, by="BIOCLIM_CAT",suffixes=c(".max",".sd"))
  tablabioclim<-merge(tablabioclim,tablabioclim2, by="BIOCLIM_CAT")
  write.table(tablabioclim, file = paste(resultados,"/Estadist_BIOCLIM_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablabioclim, file = paste(resultados,"/Estadist_BIOCLIM_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  tablageo<-data.frame(table(geophys$GEOCLUST))
  colnames(tablageo)[1]<-"GEOPHYS_CAT"
  tablageophys<-aggregate(geophys[,2:(length(geophys[1,])-1)],by=list(geophys$GEOCLUST),mean,na.rm=TRUE)
  colnames(tablageophys)[1]<-"GEOPHYS_CAT"
  tablageophys1<-aggregate(geophys[,2:(length(geophys[1,])-1)],by=list(geophys$GEOCLUST),min,na.rm=TRUE)
  colnames(tablageophys1)[1]<-"GEOPHYS_CAT"
  tablageophys2<-aggregate(geophys[,2:(length(geophys[1,])-1)],by=list(geophys$GEOCLUST),max,na.rm=TRUE)
  colnames(tablageophys2)[1]<-"GEOPHYS_CAT"
  tablageophys3<-aggregate(geophys[,2:(length(geophys[1,])-1)],by=list(geophys$GEOCLUST),sd,na.rm=TRUE)
  colnames(tablageophys3)[1]<-"GEOPHYS_CAT"
  tablageophys<-merge(tablageo,tablageophys, by="GEOPHYS_CAT")
  tablageophys<-merge(tablageophys,tablageophys1, by="GEOPHYS_CAT",suffixes=c(".media",".min"))
  tablageophys2<-merge(tablageophys2,tablageophys3, by="GEOPHYS_CAT",suffixes=c(".max",".sd"))
  tablageophys<-merge(tablageophys,tablageophys2, by="GEOPHYS_CAT")
  write.table(tablageophys, file = paste(resultados,"/Estadist_GEOPHYS_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablageophys, file = paste(resultados,"/Estadist_GEOPHYS_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  tablaeda<-data.frame(table(edaph$EDACLUST))
  colnames(tablaeda)[1]<-"EDAPH_CAT"
  tablaedaph<-aggregate(edaph[,2:(length(edaph[1,])-1)],by=list(edaph$EDACLUST),mean,na.rm=TRUE)
  colnames(tablaedaph)[1]<-"EDAPH_CAT"
  tablaedaph1<-aggregate(edaph[,2:(length(edaph[1,])-1)],by=list(edaph$EDACLUST),min,na.rm=TRUE)
  colnames(tablaedaph1)[1]<-"EDAPH_CAT"
  tablaedaph2<-aggregate(edaph[,2:(length(edaph[1,])-1)],by=list(edaph$EDACLUST),max,na.rm=TRUE)
  colnames(tablaedaph2)[1]<-"EDAPH_CAT"
  tablaedaph3<-aggregate(edaph[,2:(length(edaph[1,])-1)],by=list(edaph$EDACLUST),sd,na.rm=TRUE)
  colnames(tablaedaph3)[1]<-"EDAPH_CAT"
  tablaedaph<-merge(tablaeda,tablaedaph, by="EDAPH_CAT")
  tablaedaph<-merge(tablaedaph,tablaedaph1, by="EDAPH_CAT",suffixes=c(".media",".min"))
  tablaedaph2<-merge(tablaedaph2,tablaedaph3, by="EDAPH_CAT",suffixes=c(".max",".sd"))
  tablaedaph<-merge(tablaedaph,tablaedaph2, by="EDAPH_CAT")
  write.table(tablaedaph, file = paste(resultados,"/Estadist_EDAPH_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablaedaph, file = paste(resultados,"/Estadist_EDAPH_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tabla, file = paste(resultados,"/Tabla_ELC_celdas_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  if(any(unique(tabla$BIOCLUST)==0)){
    N_bioclust<-length(unique(tabla$BIOCLUST))-1
  }
  if(all(unique(tabla$BIOCLUST)>0)){
    N_bioclust<-length(unique(tabla$BIOCLUST))
  }
  if(any(unique(tabla$GEOCLUST)==0)){
    N_geoclust<-length(unique(tabla$GEOCLUST))-1
  }
  if(all(unique(tabla$GEOCLUST)>0)){
    N_geoclust<-length(unique(tabla$GEOCLUST))
  }
  if(any(unique(tabla$EDACLUST)==0)){
    N_edaclust<-length(unique(tabla$EDACLUST))-1
  }
  if(all(unique(tabla$EDACLUST)>0)){
    N_edaclust<-length(unique(tabla$EDACLUST))
  }
  if(any(unique(tabla$ELC_CAT)==0)){
    N_ELC_CAT<-length(unique(tabla$ELC_CAT))-1
  }
  if(all(unique(tabla$ELC_CAT)>0)){
    N_ELC_CAT<-length(unique(tabla$ELC_CAT))
  }
  NCATS<-as.data.frame(cbind(N_ELC_CAT,N_bioclust,N_geoclust,N_edaclust))
  
  #OBJETO SALIDA 4
  write.table(NCATS, file = paste(resultados,"/numero_categorias_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write("11.Terminado proceso de exportacion tabla categorias resultantes mapa ELC", file="Error/process_info.txt", append=TRUE)
  
  
  ##Obtenci?n de estad?sticas descriptivas para cada categor?a ELc
  nbioclim<-length(bioclimv)
  ngeophys<-vector(mode="numeric",length=1)
  for (i in 1:1){
    ngeophys<-ifelse(all(latitud,longitud),length(geophysv)+2,ifelse(any(latitud,longitud),length(geophysv)+1,length(geophysv)))
  }
  nedaph<-length(edaphv)
  tabla<-tabla[,c(ncol(tabla),ncol(tabla)-1,4:(3+nbioclim),(5+nbioclim):(4+nbioclim+ngeophys),(6+nbioclim+ngeophys):(ncol(tabla)-3))]
  media<-aggregate(tabla[,c(-1,-2)],by=list(tabla$ELC_CAT),FUN="mean")
  colnames(media)[1]<-"ELC_CAT"
  mediana<-aggregate(tabla[,c(-1,-2)],by=list(tabla$ELC_CAT),FUN="median")
  colnames(mediana)[1]<-"ELC_CAT"
  maximo<-aggregate(tabla[,c(-1,-2)],by=list(tabla$ELC_CAT),FUN="max")
  colnames(maximo)[1]<-"ELC_CAT"
  minimo<-aggregate(tabla[,c(-1,-2)],by=list(tabla$ELC_CAT),FUN="min")
  colnames(minimo)[1]<-"ELC_CAT"
  desvest<-aggregate(tabla[,c(-1,-2)],by=list(tabla$ELC_CAT),FUN="sd")
  colnames(desvest)[1]<-"ELC_CAT"
  #Tabla de unificaci?n de estad?sticos
  estad<-merge(media,mediana, by="ELC_CAT",suffixes=c(".media",".mediana"))
  estad1<-merge(maximo,minimo, by="ELC_CAT",suffixes=c(".maximo",".minimo"))
  estad<-merge(estad,estad1,by="ELC_CAT")
  aaa<-"sd"
  for (i in 2:length(desvest[1,])) {
    colnames(desvest)[i]<-paste(colnames(desvest)[i],aaa,sep=".")
  }
  estad<-merge(estad,desvest,by="ELC_CAT")
  #Exportar estad?sticas descriptivas
  write.table(estad, file = paste(resultados,"/Estadist_ELC_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(estad, file = paste(resultados,"/Estadist_ELC_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  #Exportar tabla de equivalencias Combinaci?n (Bio-Geo-Eda) y categor?a final mapa
  colnames(elc)[2]<-"ELC_CAT"
  write.table(estad, file = paste(resultados,"/Combi_ELC_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(estad, file = paste(resultados,"/Combi_ELC_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
  write("12.Terminado proceso de exportacion tabla estadisticas descriptivas mapa ELC", file="Error/process_info.txt", append=TRUE)
  write("13.Proceso terminado exitosamente", file="Error/process_info.txt", append=TRUE) 
}



