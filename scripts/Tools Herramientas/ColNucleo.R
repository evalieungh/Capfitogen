#####################################################################
# Script  de la herramienta ColNucleo - ColNucleo Tool script 
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
write(paste(), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write("______Herramienta/Tool ColNucleo________", file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("statelc:", statelc,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("porcol:", porcol,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("estratcol:", estratcol,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("availab:", availab,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.ColNucleo.txt", append=TRUE)


##Elemento introducido por el usuario: ruta (ext)
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO ColNucleo________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

##########################################################


write("1.Terminado proceso de fijacion de ruta de la herramienta", file="Error/process_info.txt", append=TRUE)

#activar paquetes ya instalados y necesarios
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

library(sp)
library(raster)
library(sf)

write("2.Terminado proceso de carga de paquetes", file="Error/process_info.txt", append=TRUE)

#########################
##### Inicio#######
#########################
#introducci?n del mapa elc
mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
write("3.Terminado carga de mapa ELC formato paquete raster", file="Error/process_info.txt", append=TRUE)
#introducci?n datos pasaporte
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
#Extracci?n ELC para pasaporte con duplicados espaciales
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))

#filtro por GEOQUAL
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}

puntosBG<-SpatialPointsDataFrame(pasaporte[,c("DECLONGITUDE","DECLATITUDE")],pasaporte,proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
BGcat<-extract(mapaelc,puntosBG)
pasaporte<-data.frame(pasaporte,BGcat)
write("4.Terminado extracci?n ELC cat para pasaportes completos", file="Error/process_info.txt", append=TRUE)
#Pasaporte sin duplicados espaciales
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
#reconstrucci?n de los pasaportes
pasaporte2<-puntosBG@data
write("5.Pasaporte2 version sin duplicados espaciales", file="Error/process_info.txt", append=TRUE)
#Extracci?n categor?a ELC
BGcat<-extract(mapaelc,puntosBG)
pasaporte2<-data.frame(pasaporte2,BGcat)
#Introducci?n tabla de categor?as total del ELCmapa
statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
statelc<-as.data.frame(statelc[,"ELC_CAT"])
colnames(statelc)[1]<-"ELC_CAT"
#Tablas de frecuencias desde pasaporte
#total
BGfrec<-as.data.frame(table(pasaporte[,"BGcat"]))
colnames(BGfrec)[1]<-"ELC_CAT"
colnames(BGfrec)[2]<-"FREC_W_DUPL"
#Sin duplicados
BGfrec2<-as.data.frame(table(pasaporte2[,"BGcat"]))
colnames(BGfrec2)[1]<-"ELC_CAT"
colnames(BGfrec2)[2]<-"FREC_WO_DUPL"
BGfrec<-merge(BGfrec,BGfrec2,by="ELC_CAT",all.x=TRUE)
statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
Duplicates<-vector(length=nrow(statelc))
for (i in 1:nrow(statelc)){
  if (is.na(statelc$FREC_WO_DUPL[i])){
    statelc$FREC_WO_DUPL[i]<-0
  }
  if (is.na(statelc$FREC_W_DUPL[i])){
    statelc$FREC_W_DUPL[i]<-0
  }
  Duplicates[i]<-statelc$FREC_W_DUPL[i]-statelc$FREC_WO_DUPL[i]
}
statelc<-cbind(statelc,Duplicates)
#Distribuci?n de disponibles
#if(availab){
  N_Availab<-aggregate(pasaporte[,46],by=list(pasaporte$BGcat),sum, na.rm=TRUE)
  colnames(N_Availab)[1]<-"ELC_CAT"
  colnames(N_Availab)[2]<-"N_Availab"
  statelc<-merge(statelc,N_Availab,by="ELC_CAT",all.x=TRUE)
  N_AvailabWO<-aggregate(pasaporte2[,46],by=list(pasaporte2$BGcat),sum, na.rm=TRUE)
  colnames(N_AvailabWO)[1]<-"ELC_CAT"
  colnames(N_AvailabWO)[2]<-"N_AvailabWO"
  statelc<-merge(statelc,N_AvailabWO,by="ELC_CAT",all.x=TRUE)
#}
#Calculo de clases de frecuencia 
cuartil25<-quantile(BGfrec$FREC_W_DUPL,probs=0.25,type=3)
cuartil50<-quantile(BGfrec$FREC_W_DUPL,probs=0.5,type=3)
cuartil75<-quantile(BGfrec$FREC_W_DUPL,probs=0.75,type=3)
tablaclas<-data.frame(nrow=1,ncol=3)
tablaclas[1,1]<-cuartil25
colnames(tablaclas)[1]<-"25%"
tablaclas[1,2]<-cuartil50
colnames(tablaclas)[2]<-"50%"
tablaclas[1,3]<-cuartil75
colnames(tablaclas)[3]<-"75%"
#write.table(tablaclas,file=paste(resultados,"/QuartileCutoff.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
write("6.Terminado generaci?n/exportaci?n tabla de clasificaci?n de frecuencias x cuartiles", file="Error/process_info.txt", append=TRUE)

FreqClass_W_DUPL<-vector(length=length(statelc$FREC_W_DUPL))
Porcent_W_DUPL<-vector(length=length(statelc$FREC_W_DUPL))
sumaBG<-sum(statelc$FREC_W_DUPL)
for(i in 1:length(statelc$FREC_W_DUPL)){
  FreqClass_W_DUPL[i]<-ifelse(statelc$FREC_W_DUPL[i]==0,"null",
                             ifelse(statelc$FREC_W_DUPL[i]>0&statelc$FREC_W_DUPL[i]<=cuartil25,"low",
                                    ifelse(statelc$FREC_W_DUPL[i]>cuartil25&statelc$FREC_W_DUPL[i]<=cuartil50,"mid-low",
                                           ifelse(statelc$FREC_W_DUPL[i]>cuartil50&statelc$FREC_W_DUPL[i]<=cuartil75,"mid-high","high"))))
  Porcent_W_DUPL[i]<-(statelc$FREC_W_DUPL[i]*100)/sumaBG
}
statelc<-cbind(statelc[,1:3],Porcent_W_DUPL,FreqClass_W_DUPL,statelc[,4:ncol(statelc)])
write("7.Terminado generaci?n tabla porcentaje de cada categor?a ELC", file="Error/process_info.txt", append=TRUE)

########################
#Determinaci?n de cuotas
########################
tot<-sum(statelc$FREC_W_DUPL)
cats<-nrow(N_Availab)
if(estratcol=="C"){
  Q_Even<-vector(length=nrow(statelc))
  ms<-tot*(porcol/100)
  for(i in 1:nrow(statelc)){
    Q_Even[i]<-ifelse(statelc$FREC_W_DUPL[i]>0,ms/cats,0)
    if(Q_Even[i]>0&Q_Even[i]<1){
      Q_Even[i]<-1
    }
    Q_Even[i]<-round(Q_Even[i],digits=0)
  }
  statelc<-cbind(statelc,Q_Even)
}
if(estratcol=="P"){
  Q_Prop<-vector(length=nrow(statelc))
  for(i in 1:nrow(statelc)){
    Q_Prop[i]<-ifelse(statelc$FREC_W_DUPL[i]>0,statelc$FREC_W_DUPL[i]*(porcol/100),0)
    if(Q_Prop[i]>0&Q_Prop[i]<1){
      Q_Prop[i]<-1
    }
    Q_Prop[i]<-round(Q_Prop[i],digits=0)
  }
  statelc<-cbind(statelc,Q_Prop)
}
if(estratcol=="L"){
  Q_Log<-vector(length=nrow(statelc))
  ms<-tot*(porcol/100)
  for(i in 1:nrow(statelc)){
    multi<-prod(BGfrec$FREC_W_DUPL)
    Q_Log[i]<-ifelse(statelc$FREC_W_DUPL[i]>0,ms*log(statelc$FREC_W_DUPL[i])/log(multi),0)
    if(Q_Log[i]>0&Q_Log[i]<1){
      Q_Log[i]<-1
    }
    Q_Log[i]<-round(Q_Log[i],digits=0)
  }
  statelc<-cbind(statelc,Q_Log)
}
write("7.Terminado generaci?n valores de afijaci?n", file="Error/process_info.txt", append=TRUE)


###############
#Proceso de selecci?n entradas
###############
#trabajando con datos de disponibilidad
if (availab){
  lista<-list()
  lista2<-list()
  lista3<-list()
  lista4<-list()
  #Proceso x categor?a ELC
  for(i in 1:nrow(statelc)){
    #Si hay que seleccionar entradas para esta cat y si hay disponibles
    if(statelc[i,9]>0&statelc[i,7]>0){
      #si hay suficientes entradas no duplicadas y disponibles para cumplir la cuota
      if(statelc[i,8]>=statelc[i,9]){
        select<-subset(pasaporte2,BGcat==(i-1)&AVAILAB==1)
        azar<-as.data.frame(sample(select$ACCENUMB,size=statelc[i,9]))
        colnames(azar)[1]<-"ACCENUMB"
        select<-merge(select,azar,by="ACCENUMB")
        select<-select[,c(2,1,3:ncol(select))]
        lista[[i]]<-select
      }
      #si no hay suficientes entradas no duplicadas pero si hay duplicadas disponibles para cumplir la cuota
      if(statelc[i,8]<statelc[i,9]&statelc[i,7]>=statelc[i,9]){
        select<-subset(pasaporte,BGcat==(i-1)&AVAILAB==1)
        azar<-as.data.frame(sample(select$ACCENUMB,size=statelc[i,9]))
        colnames(azar)[1]<-"ACCENUMB"
        select<-merge(select,azar,by="ACCENUMB")
        select<-select[,c(2,1,3:ncol(select))]
        lista2[[i]]<-select
      }
    }
    #Si hay que seleccionar entradas para esta cat y no hay disponibles suficientes
    if(statelc[i,9]>0&statelc[i,7]<statelc[i,9]&statelc[i,7]>0){
      lista3[[i]]<-subset(pasaporte,BGcat==(i-1)&AVAILAB==1)
    }
    #Si hay que seleccionar entradas para esta cat y no hay disponibles
    if(statelc[i,9]>0&statelc[i,7]==0&statelc[i,2]>0){
      lista4[[i]]<-subset(pasaporte,BGcat==(i-1))
    }
  }
  corecoll<-do.call("rbind",lista)
  corecoll2<-do.call("rbind",lista2)
  corecoll3<-do.call("rbind",lista3)
  Entxmult<-do.call("rbind",lista4)
  corecoll<-rbind(corecoll,corecoll2,corecoll3)
  if(ncol(corecoll)==47){
    colnames(corecoll)[47]<-"BGcat/GBcat"
  }
  if(ncol(corecoll)==52){
    colnames(corecoll)[52]<-"BGcat/GBcat"
  }
  write.table(corecoll,file=paste(resultados,"/CoreCollection.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(corecoll,file=paste(resultados,"/CoreCollection.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(Entxmult,file=paste(resultados,"/EntriesToBeMultiplied.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(Entxmult,file=paste(resultados,"/EntriesToBeMultiplied.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  newdist<-as.data.frame(table(corecoll$BGcat))
  colnames(newdist)[1]<-"ELC_CAT"
  colnames(newdist)[2]<-"CCfinal"
  statelc<-merge(statelc,newdist,by="ELC_CAT",all.x=TRUE)
  write.table(statelc,file=paste(resultados,"/CoreCollect_stats.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(statelc,file=paste(resultados,"/CoreCollect_stats.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  Allocat_strategy<-as.data.frame(ifelse(estratcol=="C",paste("Constant"),ifelse(estratcol=="L",paste("Logarithmic"),paste("Proportional"))))
  colnames(Allocat_strategy)[1]<-"Allocation_strategy"
  Sample_size<-as.data.frame(paste(porcol,"%",sep=""))
  colnames(Sample_size)[1]<-"Sample_size"
  Use_availability_data<-as.data.frame(ifelse(availab,"Yes","No"))
  colnames(Use_availability_data)[1]<-"Use_availability_data"
  No_access_sampled<-as.data.frame(nrow(corecoll))
  colnames(No_access_sampled)[1]<-"No_access_sampled"
  if(!is.null(Entxmult)){
    No_access_multiplied<-as.data.frame(nrow(Entxmult))
    colnames(No_access_multiplied)[1]<-"No_access_to_be_multiplied"
    Core_details<-cbind(Allocat_strategy,Sample_size,Use_availability_data,No_access_sampled,No_access_multiplied)
  }
  if(is.null(Entxmult)){
    Core_details<-cbind(Allocat_strategy,Sample_size,Use_availability_data,No_access_sampled)
  }
  write.table(Core_details,file=paste(resultados,"/CoreCollect_Properties.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(Core_details,file=paste(resultados,"/CoreCollect_Properties.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  }
#si no se consideran datos de disponibilidad
if (!availab){
  lista<-list()
  lista2<-list()
  lista3<-list()
  #Proceso x categor?a ELC
  for(i in 1:nrow(statelc)){
    #Si hay que seleccionar entradas para esta cat y si hay disponibles
    if(statelc[i,9]>0&statelc[i,2]>0){
      #si hay suficientes entradas no duplicadas para cubrir la cuota
      if(statelc[i,3]>=statelc[i,9]){
        select<-subset(pasaporte2,BGcat==(i-1))
        if(nrow(select)==1){
          lista[[i]]<-select
        }
        if(nrow(select)>1){
          azar<-as.data.frame(sample(select$ACCENUMB,size=statelc[i,9]))
          colnames(azar)[1]<-"ACCENUMB"
          select<-merge(select,azar,by="ACCENUMB")
          select<-select[,c(2,1,3:ncol(select))]
          lista[[i]]<-select
        }
      }
      #no hay suficientes entradas no duplicadas (pero hay) y se completa la cuota con duplicadas disponibles
      if(statelc[i,3]<statelc[i,9]&statelc[i,2]>=statelc[i,9]){
        select<-subset(pasaporte,BGcat==(i-1))
        azar<-as.data.frame(sample(select$ACCENUMB,size=statelc[i,9]))
        colnames(azar)[1]<-"ACCENUMB"
        select<-merge(select,azar,by="ACCENUMB")
        select<-select[,c(2,1,3:ncol(select))]
        lista2[[i]]<-select
      }
      #no hay disponibles en total suficientes
      if(statelc[i,3]<statelc[i,9]&statelc[i,2]<statelc[i,9]){
        lista3[[i]]<-subset(pasaporte,BGcat==(i-1))
      }
    }
  }
  corecoll<-do.call("rbind",lista)
  corecoll2<-do.call("rbind",lista2)
  corecoll3<-do.call("rbind",lista3)
  corecoll<-rbind(corecoll,corecoll2,corecoll3)
  if(ncol(corecoll)==47){
    colnames(corecoll)[47]<-"BGcat/GBcat"
  }
  if(ncol(corecoll)==52){
    colnames(corecoll)[52]<-"BGcat/GBcat"
  }
  write.table(corecoll,file=paste(resultados,"/CoreCollection.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(corecoll,file=paste(resultados,"/CoreCollection.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  newdist<-as.data.frame(table(corecoll$BGcat))
  colnames(newdist)[1]<-"ELC_CAT"
  colnames(newdist)[2]<-"CCfinal"
  statelc<-merge(statelc,newdist,by="ELC_CAT",all.x=TRUE)
  write.table(statelc,file=paste(resultados,"/CoreCollect_stats.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")  
  write.table(statelc,file=paste(resultados,"/CoreCollect_stats.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  Allocat_strategy<-as.data.frame(ifelse(estratcol=="C",paste("Constant"),ifelse(estratcol=="L",paste("Logarithmic"),paste("Proportional"))))
  colnames(Allocat_strategy)[1]<-"Allocation_strategy"
  Sample_size<-as.data.frame(paste(porcol,"%",sep=""))
  colnames(Sample_size)[1]<-"Sample_size"
  Use_availability_data<-as.data.frame(ifelse(availab,"Yes","No"))
  colnames(Use_availability_data)[1]<-"Use_availability_data"
  No_access_sampled<-as.data.frame(nrow(corecoll))
  colnames(No_access_sampled)[1]<-"No_access_sampled"
  Core_details<-cbind(Allocat_strategy,Sample_size,Use_availability_data,No_access_sampled)
  write.table(Core_details,file=paste(resultados,"/CoreCollect_Properties.txt", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(Core_details,file=paste(resultados,"/CoreCollect_Properties.xls", sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
}