######################################################################
# Script  de la herramienta Tzones - Tzones tool script 
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
###########################################################################################################
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Tzones.txt", append=TRUE)
write("______Herramienta/Tool Tzones________", file="Parametros.Parameters.Tzones.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Tzones.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("elcready:", elcready,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("bioclimv:", bioclimv,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("edaphv:", edaphv,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
#Correccion por tema de letra v en parametro geophys

if(exists("geophys")){
  geophysv<-geophys
  rm(geophys)
}

write(paste("geophysv:", geophysv,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("ssp:", ssp,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("gcm:", gcm,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("proy:", proy,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("maxg:", maxg,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("metodo:", metodo,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("iterat:", iterat,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("iterarf:", iterarf,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("transfer:", transfer,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("tecogaps:", tecogaps,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("ttresh:", ttresh,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)
write(paste("resultados2:", resultados2,sep=""), file="Parametros.Parameters.Tzones.txt", append=TRUE)

##Elemento introducido por el usuario: ruta
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO Tzones________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

##########################################################################################################

#Revisar, descargar (si fuera el caso) y activar paquetes necesarios
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
if(system.file(package="vegan")==""){
  packages2<-append(packages2,"vegan")
}
if(system.file(package="mclust")==""){
  packages2<-append(packages2,"mclust")
}
if(system.file(package="adegenet")==""){
  packages2<-append(packages2,"adegenet")
}
if(system.file(package="randomForest")==""){
  packages2<-append(packages2,"randomForest")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}
#Carga de paquetes

library(modeltools)
library(lattice)
library(flexmix)
library(fpc) # Este paquete solo se carga en versiones R 2020 si antes se actualiza el paquete diptest
library(sp) 
library(raster)
library(sf)
library(vegan)
library(mclust)
library(adegenet)#este paquete en version moderna de R requiere que se actualice el paquete colorspace 
library(randomForest)


write("1.Terminado proceso de instalaci?n y carga de paquetes", file="Error/process_info.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

######################################################################
#Proceso regular ELCmapas si a lugar
######################################################################

if(!elcready){
  
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
  
  
  ##Definici?n resoluci?n
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
  load(paste("rdatapoints/",pais,"/",resol,"/base",resol,".RData",sep=""))
  if(length(puntos$POINTID)>=1000000){
    puntos$POINTID<-c(1:length(puntos$POINTID))
  }
  
  
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
  
  geophysv<-merge(geophys,geophysv, by="VARDESCR", all=F)
  geophysv<-as.character(geophysv[,3])
  
  ##Elemento introducido por el usuario: edaphv
  edaph2<-1:length(edaphv)
  edaphv<-as.data.frame(cbind(edaph2,edaphv))
  colnames(edaphv)[2]<-"VARDESCR"
  
  edaphv<-merge(edaph,edaphv, by="VARDESCR", all=F)
  edaphv<-as.character(edaphv[,3])
  
  write("3.Terminado proceso de arreglo de tablas finales de variables", file="Error/process_info.txt", append=TRUE)
  
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
  
  write("4.Terminado proceso de carga de capas raster ecogeograficas .tif", file="Error/process_info.txt", append=TRUE)
  
  #Extracci?n de informaci?n
  #bioclim?tica
  bioclim<-extract(bioclimstack,puntos[,c("POINT_X","POINT_Y")])
  bioclim<-cbind(puntos[,1],bioclim)
  colnames(bioclim)[1]<-"POINTID"
  #geof?sica
  geophys<-extract(geophysstack,puntos[,c("POINT_X","POINT_Y")])
  geophys<-cbind(puntos[,1],geophys)
  colnames(geophys)[1]<-"POINTID"
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
  
  if(metodo=="medoides"){
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
  
  
  ############################################################
  #M?todo "elbow", o disminuci?n suma de cuadrados intragrupo#
  #c?lculo de suma de cuadrados dentro de cada grupo
  if(metodo=="elbow"){
    wss <- (nrow(bioclim)-1)*sum(apply(bioclim,2,var))
    for (i in 2:maxg) {
      wss[i] <- sum(kmeans(bioclim[,-1],centers=i)$withinss)
    }
    par(mfrow=c(1,3))
    plot(1:maxg, wss, type="b", xlab="Number of Clusters",
         ylab="Within groups sum of squares")
    title(main="Componente Bioclim?tico",sub="Estimaci?n No cluster")
    dif<-vector(mode="numeric",length=maxg)
    wss<-cbind(c(1:maxg),wss,dif)
    colnames(wss)[1]<-"CLUSTER"
    for (i in 2:maxg){
      wss[i,3]<-wss[i,2]*100/wss[i-1,2]
    }
    for (i in 2:maxg){
      if(wss[i,3]>=50){
        nclust<-as.integer(paste(wss[i,1]))
        break
      }
    }
    fitbioclim<- kmeans(bioclim[,-1], nclust)
    bioclim<- data.frame(bioclim, fitbioclim$cluster)
    colnames(bioclim)[1]<-"POINTID"
    colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    
    wss <- (nrow(geophys)-1)*sum(apply(geophys,2,var))
    for (i in 2:maxg) {
      wss[i] <- sum(kmeans(geophys[,-1],centers=i)$withinss)
    }
    plot(1:maxg, wss, type="b", xlab="Number of Clusters",
         ylab="Within groups sum of squares")
    title(main="Componente Geof?sico",sub="Estimaci?n No cluster")
    dif<-vector(mode="numeric",length=maxg)
    wss<-cbind(c(1:maxg),wss,dif)
    colnames(wss)[1]<-"CLUSTER"
    for (i in 2:maxg){
      wss[i,3]<-wss[i,2]*100/wss[i-1,2]
    }
    for (i in 2:maxg){
      if(wss[i,3]>=50){
        nclust<-as.integer(paste(wss[i,1]))
        break
      }
    }
    fitgeophys<- kmeans(geophys[,-1], nclust)
    geophys<- data.frame(geophys, fitgeophys$cluster)
    colnames(geophys)[1]<-"POINTID"
    colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    
    wss <- (nrow(edaph)-1)*sum(apply(edaph,2,var))
    for (i in 2:maxg) {
      wss[i] <- sum(kmeans(edaph[,-1],centers=i)$withinss)
    }
    plot(1:maxg, wss, type="b", xlab="Number of Clusters",
         ylab="Within groups sum of squares")
    title(main="Componente Ed?fico",sub="Estimaci?n No cluster")
    dif<-vector(mode="numeric",length=maxg)
    wss<-cbind(c(1:maxg),wss,dif)
    colnames(wss)[1]<-"CLUSTER"
    for (i in 2:maxg){
      wss[i,3]<-wss[i,2]*100/wss[i-1,2]
    }
    for (i in 2:maxg){
      if(wss[i,3]>=50){
        nclust<-as.integer(paste(wss[i,1]))
        break
      }
    }
    fitedaph<- kmeans(edaph[,-1], nclust)
    edaph<- data.frame(edaph, fitedaph$cluster)
    colnames(edaph)[1]<-"POINTID"
    colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    write("7.Terminado proceso de agrupamiento por componente - Elbow", file="Error/process_info.txt", append=TRUE)
  }
  
  ############################################################
  #M?todo Calinski-Harabasz (1974) criterion#
  if(metodo=="calinski"){
    #Bioclim
    fitb<-cascadeKM(bioclim[,-1], 2, maxg,iter=iterat,criterion = "calinski")
    calinski.bio<- as.numeric(which.max(fitb$results[2,]))
    fitb<-fitb$partition[,calinski.bio]
    bioclim<- data.frame(bioclim, fitb)
    colnames(bioclim)[1]<-"POINTID"
    colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    rm(fitb)
    #Edaphic
    fite<-cascadeKM(edaph[,-1], 2, maxg,iter=iterat,criterion = "calinski")
    calinski.eda<- as.numeric(which.max(fite$results[2,]))
    fite<-fite$partition[,calinski.eda]
    edaph<- data.frame(edaph, fite)
    colnames(edaph)[1]<-"POINTID"
    colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    rm(fite)
    #Geophys
    fitg<-cascadeKM(geophys[,-1], 2, maxg,iter=iterat,criterion = "calinski")
    calinski.geo<- as.numeric(which.max(fitg$results[2,]))
    fitg<-fitg$partition[,calinski.geo]
    geophys<- data.frame(geophys, fitg)
    colnames(geophys)[1]<-"POINTID"
    colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    rm(fitg)
  }
  
  ############################################################
  #simple structure index "ssi" (Dolnicar et al. 1999)#
  if(metodo=="ssi"){
    fitb<-cascadeKM(bioclim[,-1], 2, maxg,iter=iterat,criterion = "ssi")
    ssi.bio<- as.numeric(which.max(fitb$results[1,]))
    fitb<-fitb$partition[,ssi.bio]
    bioclim<- data.frame(bioclim, fitb)
    colnames(bioclim)[1]<-"POINTID"
    colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    rm(fitb)
    #Edaphic
    fite<-cascadeKM(edaph[,-1], 2, maxg,iter=iterat,criterion = "ssi")
    ssi.eda<- as.numeric(which.max(fite$results[1,]))
    fite<-fite$partition[,ssi.eda]
    edaph<- data.frame(edaph, fite)
    colnames(edaph)[1]<-"POINTID"
    colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    rm(fite)
    #Geophys
    fitg<-cascadeKM(geophys[,-1], 2, maxg,iter=iterat,criterion = "ssi")
    ssi.geo<- as.numeric(which.max(fitg$results[1,]))
    fitg<-fitg$partition[,ssi.geo]
    geophys<- data.frame(geophys, fitg)
    colnames(geophys)[1]<-"POINTID"
    colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    rm(fitg)
  }
  
  ##########################################################################
  #optimal model according to BIC for parameterized Gaussian mixture models#
  if(metodo=="bic"){
    if(nrow(bioclim)>=100000){
      setwd(paste(resultados))
      write(paste("Number of cells from your workframe is > 100000, it may cause R shutdown"), file="Possible_Error_Mclust_BIC.txt", append=TRUE)
      write(paste("Number of cells from your workframe =",nrow(bioclim),sep=""), file="Possible_Error_Mclust_BIC.txt", append=TRUE)
      setwd(paste(ruta))
    }
    if(nrow(bioclim)>50000&nrow(bioclim)<100000){
      setwd(paste(resultados))
      write(paste("Number of cells from your workframe is > 50000, it may cause R processing for a long time (24 h or more) or even R shutdown"), file="Possible_Error_Mclust_BIC.txt", append=TRUE)
      write(paste("Number of cells from your workframe =",nrow(bioclim),sep=""), file="Possible_Error_Mclust_BIC.txt", append=TRUE)
      setwd(paste(ruta))
    }
    #Bioclim
    b_clust <- mclustBIC(bioclim[,-1], G=2:maxg)
    setwd(paste(resultados))
    jpeg(file = "Bioclim_BIC_vs_NcompClust.jpeg")
    plot(b_clust, G = 2:maxg)
    dev.off()
    setwd(paste(ruta))
    b_summary <- summary(b_clust, data = bioclim[,-1])
    bioclim_1<-b_summary$modelName
    bioclim_2<-b_summary$n
    bioclim_3<-b_summary$d
    bioclim_4<-b_summary$G
    bioclim_5<-b_summary$bic
    bioclim_6<-b_summary$loglik
    bioclim_names<-c("Optimal model code","Number of observations in data",
                     "Number of variables","Optimal number of clusters",
                     "Optimal BIC value", "Loglikehood to optimal BIC")
    bioclim_values<-c(bioclim_1,bioclim_2,bioclim_3,bioclim_4,bioclim_5,bioclim_6)
    bioclim_result<-data.frame(cbind(bioclim_names,bioclim_values))
    colnames(bioclim_result)[1]<-"Parameters"
    colnames(bioclim_result)[2]<-"Values"
    write.table(bioclim_result, file = paste(resultados,"/Bioclim_BIC_results.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(bioclim_result, file = paste(resultados,"/Bioclim_BIC_results.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    b_summary<-b_summary$classification
    bioclim<- data.frame(bioclim,b_summary)
    colnames(bioclim)[1]<-"POINTID"
    colnames(bioclim)[ncol(bioclim)]<-"BIOCLUST"
    rm(b_summary)
    #Edaphic
    e_clust <- mclustBIC(edaph[,-1], G=2:maxg)
    setwd(paste(resultados))
    jpeg(file = "Edaph_BIC_vs_NcompClust.jpeg")
    plot(e_clust, G = 2:maxg)
    dev.off()
    setwd(paste(ruta))
    e_summary <- summary(e_clust, data = edaph[,-1])
    edaph_1<-e_summary$modelName
    edaph_2<-e_summary$n
    edaph_3<-e_summary$d
    edaph_4<-e_summary$G
    edaph_5<-e_summary$bic
    edaph_6<-e_summary$loglik
    edaph_names<-c("Optimal model code","Number of observations in data",
                   "Number of variables","Optimal number of clusters",
                   "Optimal BIC value", "Loglikehood to optimal BIC")
    edaph_values<-c(edaph_1,edaph_2,edaph_3,edaph_4,edaph_5,edaph_6)
    edaph_result<-data.frame(cbind(edaph_names,edaph_values))
    colnames(edaph_result)[1]<-"Parameters"
    colnames(edaph_result)[2]<-"Values"
    write.table(edaph_result, file = paste(resultados,"/edaph_BIC_results.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(edaph_result, file = paste(resultados,"/edaph_BIC_results.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    e_summary<-e_summary$classification
    edaph<- data.frame(edaph,e_summary)
    colnames(edaph)[1]<-"POINTID"
    colnames(edaph)[ncol(edaph)]<-"EDACLUST"
    rm(e_summary)
    #Geophys
    g_clust <- mclustBIC(geophys[,-1], G=2:maxg)
    setwd(paste(resultados))
    jpeg(file = "Geophys_BIC_vs_NcompClust.jpeg")
    plot(g_clust, G = 2:maxg)
    dev.off()
    setwd(paste(ruta))
    g_summary <- summary(g_clust, data = geophys[,-1])
    geophys_1<-g_summary$modelName
    geophys_2<-g_summary$n
    geophys_3<-g_summary$d
    geophys_4<-g_summary$G
    geophys_5<-g_summary$bic
    geophys_6<-g_summary$loglik
    geophys_names<-c("Optimal model code","Number of observations in data",
                     "Number of variables","Optimal number of clusters",
                     "Optimal BIC value", "Loglikehood to optimal BIC")
    geophys_values<-c(geophys_1,geophys_2,geophys_3,geophys_4,geophys_5,geophys_6)
    geophys_result<-data.frame(cbind(geophys_names,geophys_values))
    colnames(geophys_result)[1]<-"Parameters"
    colnames(geophys_result)[2]<-"Values"
    write.table(geophys_result, file = paste(resultados,"/geophys_BIC_results.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(geophys_result, file = paste(resultados,"/geophys_BIC_results.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    g_summary<-g_summary$classification
    geophys<- data.frame(geophys,g_summary)
    colnames(geophys)[1]<-"POINTID"
    colnames(geophys)[ncol(geophys)]<-"GEOCLUST"
    rm(g_summary)
  }
  
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
  #Bautizo
  elc[,2]<-1:nrow(elc)
  mapaelc<-mapaelc[,1:2]
  #Asignaci?n
  mapaelc<-merge(mapaelc,elc,by="COMBI")
  colnames(mapaelc)[3]<-"ELC_CAT"
  tabla<-merge(tabla,mapaelc,by="POINTID",all.x=T)
  tabla$ELC_CAT[is.na(tabla$ELC_CAT)]<-0
  tabla$BIOCLUST[is.na(tabla$BIOCLUST)]<-0
  tabla$GEOCLUST[is.na(tabla$GEOCLUST)]<-0
  tabla$EDACLUST[is.na(tabla$EDACLUST)]<-0
  #Creaci?n del mapa r?ster ELC
  mapaelc0<-raster(matrix(nrow=dim(biocliml[[1]])[1],ncol=dim(biocliml[[1]])[2]),template=bioclimstack)
  mapaelc1<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$ELC_CAT)
  mapaelc2<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$BIOCLUST)
  mapaelc3<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$GEOCLUST)
  mapaelc4<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$EDACLUST)
  
  write("9.Terminado proceso de consolidaci?n de tabla unica y generacion mapa ELC", file="Error/process_info.txt", append=TRUE)
  
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
  tablaf<-tabla
  write.table(tablaf, file = paste(resultados,"/Tabla_ELC_celdas_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  
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
  write("12.Terminado proceso de exportacion tabla estadisticas descriptivas mapa ELC", file="Error/process_info.txt", append=TRUE)
  write("13.Proceso terminado exitosamente", file="Error/process_info.txt", append=TRUE)
  setwd(resultados)
  rm(tabla)
  save.image("Producto.RData")
}


#############################################################################
#############################################################################
#############################################################################
#Proyecci?n de categor?as bioclim?ticas de futuro
#############################################################################
#########################################
#Carga de datos de parte anterior
if(elcready){
  gcm1<-gcm
  ssp1<-ssp
  proy1<-proy
  iterarf1<-iterarf
  transfer1<-transfer
  pasaporte1<-pasaporte
  tecogaps1<-tecogaps
  ttresh1<-ttresh
  resultados21<-resultados2
  setwd(resultados)
  load("Producto.RData")
  gcm<-gcm1
  ssp<-ssp1
  proy<-proy1
  iterarf<-iterarf1
  transfer<-transfer1
  pasaporte<-pasaporte1
  tecogaps<-tecogaps1
  ttresh<-ttresh1
  resultados2<-resultados21
  rm(gcm1)
  rm(ssp1)
  rm(proy1)
  rm(iterarf1)
  rm(transfer1)
  rm(pasaporte1)
  rm(tecogaps1)
  rm(ttresh1)
  rm(resultados21)
}
#
setwd(paste(ruta))
#Stack datos futuro bioclim?tico para todo Colombia / geof?sico y ed?fico presente

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

#carga capa de puntos
#Bioclim futuro
biocliml<-list()
for(i in 1:length(bioclimv)){
  biocliml[[i]]<-raster(paste(ruta,"/rdatamapsf/",pais,"/",gcm,"_",ssp,"_",proy,"/",resol,"/",bioclimv[i],".tif",sep=""))
#names(biocliml[[i]])<-paste(bioclimv[i])
}
bioclimstackf<-do.call("stack",biocliml)
#Extracci?n de informaci?n
bioclimf<-extract(bioclimstackf,puntos[,c("POINT_X","POINT_Y")])
bioclimf<-data.frame(cbind(puntos[,1],bioclimf))
colnames(bioclimf)[1]<-"POINTID"
############################################
####predicci?n de clasificaci?n bioclim?tica a futuro con Random Forest
#Tabla de predictores
##Arreglo inicial para que coincidan tablas presente y futuro
#eliminar NAs
repeat{
  bioclim<-na.omit(bioclim)
  bioclimf<-na.omit(bioclimf)
  if(length(bioclim[,1])<length(bioclimf[,1])){
    bioclimenor<-data.frame(bioclim[,1])
    colnames(bioclimenor)[1]<-"POINTID"
    bioclimf<-merge(bioclimf,bioclimenor,by="POINTID",all.y=TRUE)
    rm(bioclimenor)
  }
  if(length(bioclimf[,1])<length(bioclim[,1])){
    bioclimenor<-data.frame(bioclimf[,1])
    colnames(bioclimenor)[1]<-"POINTID"
    bioclim<-merge(bioclim,bioclimenor,by="POINTID",all.y=TRUE)
    rm(bioclimenor)
  } 
  if(all(!is.na(bioclim[,]))) {break}
}
#Eliminaci?n columnas inservibles
bioclimpresent<-bioclim[,c(-1,as.numeric(paste("-",length(colnames(bioclim)),sep="")))]
#Tabla donde predecir el patr?n encontrado por RF
bioclimfuture<-bioclimf[,-1]
colnames(bioclimfuture)[]<-colnames(bioclimpresent)
#Response vector para RF (como factor para que asuma que es una clasificaci?n)
BioCat<-as.factor(bioclim$BIOCLUST)
#Determinaci?n patr?n RF de clasificaci?n bioclim?tica (ntree = 1000 error por memoria)
RFpredict<-randomForest(bioclimpresent,y=BioCat,ntree=100)
#Proyecci?n sobre datos bioclim de futuro
RFpredict<-as.numeric(predict(RFpredict, bioclimfuture))
#Tabla de variables originales bioclim de futuro y el grupo proyectado
bioclimf<-data.frame(bioclimf[,1],bioclimfuture,RFpredict)
#Renombrar variables y variable de grupo bioclim?tico
colnames(bioclimf)[1]<-"POINTID"
colnames(bioclimf)[ncol(bioclimf)]<-"BIOCLUST2"
for(i in 2:(ncol(bioclimf)-1)){
  colnames(bioclimf)[i]<-paste(colnames(bioclimf)[i],"_f",sep="")
}
rm(bioclimfuture)
rm(bioclimpresent)

######################################################################
######################################################################
#########################PARTE FINAL##################################

#merge proyecci?n bioclim a futuro con tabla ELC de presente
############
###Aqu? cambiar el all.x all o all.y porque dependiendo del tama?o de la tabla m?s peque?a
tabla<-merge(tablaf,bioclimf,by="POINTID",all.x=T)
#Se crea la tabla de comparaci?n presente-futuro que luego se termina de llenar con futuro
tablacomp<-tablaf[,c("POINTID","POINT_X","POINT_Y","ELC_CAT")]
rm(tablaf)
#Marcar como 0 celdas sin datos de geophys o edaph en BIOCLUST2
for(i in 1:nrow(tabla)){
  if(tabla$BIOCLUST[i]==0){
    tabla$BIOCLUST2[i]<-0
  }
  if(is.na(tabla$BIOCLUST2[i])){
    tabla$BIOCLUST2[i]<-0
  }
}

##############################
#Repetici?n de proceso creaci?n de combinaciones y asignaci?n
#Primero, GEOCLUST y EDAPCLUST deben numeric
GEOCLUST<-as.integer(tabla$GEOCLUST)
#Buscar la columna GEOCLUST 
posgeoclust<-which(colnames(tabla)=="GEOCLUST")
#y reemplazar por la num?rica
tabla<-cbind(tabla[,1:(posgeoclust-1)],GEOCLUST,tabla[,(posgeoclust+1):(ncol(tabla))])

#Buscar manualmente la columna EDACLUST y reemplazar por la num?rica
EDACLUST<-as.integer(tabla$EDACLUST)
posedaclust<-which(colnames(tabla)=="EDACLUST")
tabla<-cbind(tabla[,1:(posedaclust-1)],EDACLUST,tabla[,(posedaclust+1):(ncol(tabla))])

rm(GEOCLUST)
rm(EDACLUST)
rm(posgeoclust)
rm(posedaclust)

################################
#Repetici?n de generaci?n de combinaciones
mapaelc2<-as.data.frame(matrix(nrow = length(tabla[,1]), ncol = 3))
mapaelc2[,1]<-tabla[,1]
colnames(mapaelc2)[1]<-"POINTID"
colnames(mapaelc2)[2]<-"COMBI"
for (i in 1:length(tabla[,1])) {
  mapaelc2[i,2]<-ifelse(substr(tabla$BIOCLUST2[i],1,1)==0|substr(tabla$GEOCLUST[i],1,1)==0|substr(tabla$EDACLUST[i],1,1)==0,NA,
                        paste(substr(tabla$BIOCLUST2[i],1,1),substr(tabla$GEOCLUST[i],1,1),substr(tabla$EDACLUST[i],1,1),sep=""))
}

################################################

elc2<-subset(mapaelc2,!duplicated(COMBI),select=-POINTID)
elc2<-subset(elc2,!is.na(COMBI))
i <- order(elc2$COMBI)
elc2<- elc2[i,]
#Tabla de asignaci?n de las mismas categor?as a las combinaciones que las usadas en mapa ELC presente
elc2<-merge(elc2,elc,by="COMBI",all=TRUE)
elc2<-elc2[,c(1,3)]
colnames(elc2)[2]<-"ELC_CAT2"
######OJO
#Se dan m?s combinaciones con futuro que con presente, se deben crear nuevas categor?as 9 seguido del valor combi
if(nrow(elc2)>nrow(elc)){
  for(i in 1:nrow(elc2)){
    if(is.na(elc2$ELC_CAT2[i]))
      elc2$ELC_CAT2[i]<-as.integer(paste(9,elc2$COMBI[i],sep=""))
  }
}
mapaelc2<-mapaelc2[,1:2]
#Asignaci?n
mapaelc2<-merge(mapaelc2,elc2,by="COMBI")
mapaelc2<-mapaelc2[,c(2,1,3)]
colnames(mapaelc2)[2]<-"COMBI2"
tabla<-merge(tabla,mapaelc2,by="POINTID",all.x=T)
#Se rellenan igual los NA como categor?as 0
tabla$ELC_CAT2[is.na(tabla$ELC_CAT2)]<-0
tabla$BIOCLUST2[is.na(tabla$BIOCLUST2)]<-0
#Creaci?n mapas
mapaelc7<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$ELC_CAT2)
mapaelc8<-rasterize(cbind(tabla[,2],tabla[,3]),mapaelc0,field=tabla$BIOCLUST2)

#Exportar mapas (finalmente)
crs(mapaelc7)<-"+proj=longlat"
writeRaster(mapaelc7,filename=paste(resultados2,"/mapa_ssp",ssp,"_elcF_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
crs(mapaelc8)<-"+proj=longlat"
writeRaster(mapaelc7,filename=paste(resultados2,"/mapa_ssp",ssp,"_elcF_DIVA_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
writeRaster(mapaelc7,filename=paste(resultados2,"/mapa_ssp",ssp,"_elcF_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')

writeRaster(mapaelc8,filename=paste(resultados2,"/mapa_ssp",ssp,"_bioclimaticoF_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
writeRaster(mapaelc8,filename=paste(resultados2,"/mapa_ssp",ssp,"_bioclimaticoF_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')


#Ahora tabla de cat bioclim?ticas de futuro
tablabio<-data.frame(table(bioclimf$BIOCLUST2))
colnames(tablabio)[1]<-"BIOCLIM_CATF"
tablabioclim<-aggregate(bioclimf[,2:(ncol(bioclimf)-1)],by=list(bioclimf$BIOCLUST2),mean,na.rm=TRUE)
colnames(tablabioclim)[1]<-"BIOCLIM_CATF"
tablabioclim1<-aggregate(bioclimf[,2:(ncol(bioclimf)-1)],by=list(bioclimf$BIOCLUST2),min,na.rm=TRUE)
colnames(tablabioclim1)[1]<-"BIOCLIM_CATF"
tablabioclim2<-aggregate(bioclimf[,2:(ncol(bioclimf)-1)],by=list(bioclimf$BIOCLUST2),max,na.rm=TRUE)
colnames(tablabioclim2)[1]<-"BIOCLIM_CATF"
tablabioclim3<-aggregate(bioclimf[,2:(ncol(bioclimf)-1)],by=list(bioclimf$BIOCLUST2),sd,na.rm=TRUE)
colnames(tablabioclim3)[1]<-"BIOCLIM_CATF"
tablabioclim<-merge(tablabio,tablabioclim, by="BIOCLIM_CATF")
tablabioclim<-merge(tablabioclim,tablabioclim1, by="BIOCLIM_CATF",suffixes=c(".media",".min"))
tablabioclim2<-merge(tablabioclim2,tablabioclim3, by="BIOCLIM_CATF",suffixes=c(".max",".sd"))
tablabioclim<-merge(tablabioclim,tablabioclim2, by="BIOCLIM_CATF")
write.table(tablabioclim, file = paste(resultados2,"/Estadist_gcm",gcm,"_ssp",ssp,"_proy",proy,"_BIOCLIMF_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(tablabioclim, file = paste(resultados2,"/Estadist_gcm",gcm,"_ssp",ssp,"_proy",proy,"_BIOCLIMF_",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
#Tabla completa de trabajo
write.table(tabla, file = paste(resultados2,"/Tabla_ELCF_celdas_",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")

#Completar tabla de comparaci?n
tablacomp<-data.frame(tablacomp,tabla$ELC_CAT2)
colnames(tablacomp)[ncol(tablacomp)]<-"ELC_CAT2"
PRESvsFUT<-vector(mode="numeric")
for(i in 1:nrow(tablacomp)){
  if(tablacomp$ELC_CAT[i]==tablacomp$ELC_CAT2[i]){
    PRESvsFUT[i]<-0
  }
  else{
    PRESvsFUT[i]<-1
  }
  if(is.na(tablacomp$ELC_CAT[i])|is.na(tablacomp$ELC_CAT[i])|tablacomp$ELC_CAT[i]==0|tablacomp$ELC_CAT2[i]==0){
    PRESvsFUT[i]<-NA
  }
}
tablacomp2<-data.frame(tablacomp,PRESvsFUT)
tablacomp2<-subset(tablacomp2,PRESvsFUT==1)

#TablaFrecuencias de categor?as que cambian
stats_comp<-data.frame(table(tablacomp2$ELC_CAT))
colnames(stats_comp)[1]<-"ELC_CAT_present"
write.table(stats_comp, file = paste(resultados2,"/stats_change_table.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write.table(stats_comp, file = paste(resultados2,"/stats_change_table.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")


#Mapas de cambio de categor?a
mapaelc9<-rasterize(cbind(tablacomp2[,2],tablacomp2[,3]),mapaelc0,field=tablacomp2$ELC_CAT)
crs(mapaelc9)<-"+proj=longlat"
writeRaster(mapaelc9,filename=paste(resultados2,"/map_change_pres_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
mapaelc10<-rasterize(cbind(tablacomp2[,2],tablacomp2[,3]),mapaelc0,field=tablacomp2$ELC_CAT2)
writeRaster(mapaelc9,filename=paste(resultados2,"/map_change_pres_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')
crs(mapaelc10)<-"+proj=longlat"
writeRaster(mapaelc10,filename=paste(resultados2,"/map_change_fut_",pais,".grd",sep=""),overwrite=T,datatype='FLT4S')
writeRaster(mapaelc10,filename=paste(resultados2,"/map_change_fut_",pais,".tif",sep=""),overwrite=T,datatype='FLT4S')


#Parte de Transfer zones
if(transfer){
  setwd(ruta)
  pasaporte<-read.delim(paste(ruta,"/Pasaporte/",pasaporte,sep=""))
  if(geoqual){
    pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
  }
  setwd(resultados2)
  PopsEndangered<-extract(mapaelc9,pasaporte[,c("DECLONGITUDE","DECLATITUDE")])
  catactual2<-table(PopsEndangered)
  if(length(catactual2)==0){
    write(paste(), file="ResultadoTransferZones.txt", append=TRUE)
    write("No populations occur in changing ELC categories areas", file="ResultadoTransferZones.txt", append=TRUE)
    write("Ninguna poblaci?n cae en ?reas con categorias ELC cambiante", file="ResultadoTransferZones.txt", append=TRUE)
  }
  else{
    BG_ELC_pres<-extract(mapaelc1,pasaporte[,c("DECLONGITUDE","DECLATITUDE")])
    BG_ELC_fut<-extract(mapaelc7,pasaporte[,c("DECLONGITUDE","DECLATITUDE")])
    pasaporte2<-data.frame(pasaporte,BG_ELC_pres,BG_ELC_fut,PopsEndangered)
    pasaporte3<-subset(pasaporte2,PopsEndangered>=1)
    buscarelc<-unique(pasaporte3$BG_ELC_fut)
    Sources<-vector(length=nrow(pasaporte2),mode="numeric")
    for(i in 1:nrow(pasaporte2)){
      for(j in 1:length(buscarelc)){
        if(!is.na(pasaporte2$BG_ELC_pres[i])&pasaporte2$BG_ELC_pres[i]==buscarelc[j]){
          Sources[i]<-1
        }
      }
    }
    pasaporte2<-data.frame(pasaporte2,Sources)
    #Aqu? viene lo diferente para tecogaps
    if(tecogaps){
      Priority<-vector(length=nrow(pasaporte2),mode="numeric")
      for(i in 1:nrow(pasaporte2)){
        if(!is.na(pasaporte2$GAPTYPE[i])&pasaporte2$GAPTYPE[i]<=ttresh&pasaporte2$Sources[i]==1){
          Priority[i]<-1
        }
      }
      pasaporte2<-data.frame(pasaporte2,Priority)
      pasaporte2<-pasaporte2[,c("ACCENUMB","DECLATITUDE","DECLONGITUDE","GAPTYPE","BG_ELC_pres","BG_ELC_fut","PopsEndangered","Sources","Priority")]
    }
    if(!tecogaps){
      pasaporte2<-pasaporte2[,c("ACCENUMB","DECLATITUDE","DECLONGITUDE","BG_ELC_pres","BG_ELC_fut","PopsEndangered","Sources")]
    }
    write.table(pasaporte2, file = paste(resultados2,"/TransferZoneAnalysis.txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte2, file = paste(resultados2,"/TransferZoneAnalysis.xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
    shapefile2<-SpatialPointsDataFrame(pasaporte2[,c(3,2)],pasaporte2[,c(-2,-3)])
    shapefile2<- st_as_sf(shapefile2)
    st_write(shapefile2,dsn=paste(resultados2),layer="MapTransferZone",driver="ESRI Shapefile")
  }
}

