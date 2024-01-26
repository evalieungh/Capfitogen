######################################################################
# Script  de la herramienta TesTable - TesTable tool script 
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
setwd(paste(ruta))
write(paste(), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write("_________________________________________", file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write("______Herramienta/Tool TesTable________", file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write("_________________________________________", file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste(), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("tiptable:", tiptable,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("access:", access,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("availab:", availab,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("fixthem:", fixthem,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("nmark:", nmark,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)
write(paste("phenot:", phenot,sep=""), file="Pasaporte/Parametros.Parameters.TesTable.txt", append=TRUE)


##Elemento introducido por el usuario: ruta (ext)
#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))

##########################################################
#########################
##### Inicio#######
#########################
#Registro de problemas - creaci?n archivo texto reporte
write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write("_________________________________________", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write("______An?lisis TestTable Analysis________", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write(date(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write(paste("Table to be analyzed / Tabla a ser analizada: '", paste(pasaporte),"'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
#Configuraci?n del sistema
jjj<-Sys.getenv("JAVA_HOME")
rrr<-Sys.getenv("R_ARCH")
www<-Sys.info()['release']
jjj2<-Sys.getenv("PATH")
jjj2<-grepl("jdk1.",jjj2,ignore.case = TRUE)
jjj<-grepl("(x86)",jjj)
rrr<-grepl("i386",rrr)
www<-grepl("x64",www)
write("__Windows/R/Java configuration____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
if(www){
  write("WINDOWS version: x64 (64 bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(!www){
  write("WINDOWS version: x86 (32 bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(rrr){
  write("R version in use: 3.1.2 (2014-10-31) / for platform: mingw32/i386 (32-bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(!rrr){
  write("R version in use: 3.1.2 (2014-10-31) / for platform: w64-mingw32/x64 (64-bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(jjj){
  write("Java version in use: jre7 / jdk1.7.0_13 for x86 OS (32 bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(!jjj){
  write("Java version in use: jre1.8.0_60 / jdk1.8.0_60 for x64 OS (64 bit)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(jjj2){
  write("Java development kit (jdk) is included in your 'path' environment variable (ok for Modela-biomod option)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
if(!jjj2){
  write("Java development kit (jdk) is NOT included in your 'path' environment variable (it is required for Modela-biomod option)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
}
write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
#####################################################################################
#########Tabla Pasaporte#############################################################
#####################################################################################

if(tiptable=="Pasaporte"){
  #introducci?n datos pasaporte
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
    Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"), fileEncoding="latin1")
  } else {Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""),colClasses=c("LONGITUDE"="character","LATITUDE"="character"))}
  
  ######1######
  #Dimensiones#
  #############
  #revisi?n de dimensiones por columnas
  write("__Part1/parte1: Dimension/Dimensi?n____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  if(!availab&!geoqual){
    if(ncol(Pasaporte)!=45){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has no 45 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla no tiene 45 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(!availab&!geoqual){
    if(ncol(Pasaporte)==45){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has the 45 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla tiene las 45 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  if(availab&!geoqual){
    if(ncol(Pasaporte)!=46){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus 'AVAILAB' field",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has no 46 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla no tiene 46 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(availab&!geoqual){
    if(ncol(Pasaporte)==46){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus 'AVAILAB' field",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has the 46 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla tiene las 46 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  if(!availab&geoqual){
    if(ncol(Pasaporte)!=50&ncol(Pasaporte)!=49){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus GEOQUAL fields",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has no 49 or 50 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla no tiene 49 o 50 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(!availab&geoqual){
    if(ncol(Pasaporte)==50|ncol(Pasaporte)==49){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus GEOQUAL fields",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has the 49 or 50 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla tiene las 49 o 50 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  if(availab&geoqual){
    if(ncol(Pasaporte)!=51&ncol(Pasaporte)!=50){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus GEOQUAL and 'AVAILAB' fields",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has no 50 or 51 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla no tiene 50 o 51 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(availab&geoqual){
    if(ncol(Pasaporte)==51|ncol(Pasaporte)==50){
      write(paste("According to you, the table '",paste(pasaporte),"' is a regular passport table plus GEOQUAL and 'AVAILAB' fields",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' es una tabla de pasaporte normal",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("The table has the 50 or 51 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La tabla tiene las 50 or 51 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  #Arreglo de dimensiones por Columnas
  if(fixthem){
    if(availab&geoqual){
      if(ncol(Pasaporte)!=51){
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Your table has been resized, in case it exceeds the 51 columns required", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Su tabla ha sido reducida en n?mero columnas en caso de que excediera las 51 requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        Pasaporte<-Pasaporte[,1:51] 
      }
    }  
    if(availab&!geoqual){
      if(ncol(Pasaporte)!=46){
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Your table has been resized, in case it exceeds the 46 columns required", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Su tabla ha sido reducida en n?mero columnas en caso de que excediera las 46 requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        Pasaporte<-Pasaporte[,1:46] 
      }
    }
    if(!availab&geoqual){
      if(ncol(Pasaporte)!=50){
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Your table has been resized, in case it exceeds the 50 columns required", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Su tabla ha sido reducida en n?mero columnas en caso de que excediera las 50 requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        Pasaporte<-Pasaporte[,1:50] 
      }
    }
    if(!availab&!geoqual){
      if(ncol(Pasaporte)!=45){
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Your table has been resized, in case it exceeds the 45 columns required", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Su tabla ha sido reducida en n?mero columnas en caso de que excediera las 45 requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        Pasaporte<-Pasaporte[,1:45] 
      }
    }
  }
  
  ######2###########
  #Nombres Columnas#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part2/parte2:Column names/Nombres columnas____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  #Revisi?n de nombres de columnas
  #Introducci?n nombres correctos y creaci?n lista usuario
  colok_pasaporte1<-data.frame(colnames(Pasaporte))
  #Evitar error por load de testable1.RData
  loadError<-FALSE
  abcd<-try(load("testable1.RData"),silent=TRUE)
  loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
  if(loadError){
    colok_pasaporte<-read.delim("testable1.txt")
  }
  rm(abcd)
  rm(loadError)
  
  if(availab&!geoqual){
    colok_pasaporte<-data.frame(colok_pasaporte[1:46,1])
  }
  if(!availab&geoqual){
    colok_pasaporte3<-data.frame(colok_pasaporte[c(1:45,47:51),1])
    colok_pasaporte2<-data.frame(colok_pasaporte[c(1:45,47,49:51),1])
  }
  if(!availab&!geoqual){
    colok_pasaporte<-data.frame(colok_pasaporte[1:45,1])
  }
  if(availab&geoqual){
    colok_pasaporte3<-data.frame(colok_pasaporte[1:51,1])
    colok_pasaporte2<-data.frame(colok_pasaporte[c(1:47,49:51),1])
  }
  
  #Comparaci?n nombres columnas
  ##Casos sin geoqual (no columna variable)
  if((availab&!geoqual)|(!availab&!geoqual)){
  if(nrow(colok_pasaporte)==nrow(colok_pasaporte1)){
    for (i in 1:nrow(colok_pasaporte1)){
      if(fixthem){
        if(paste(colok_pasaporte[i,1])!=paste(colok_pasaporte1[i,1])){
          write(paste("The column name '",paste(colok_pasaporte[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El nombre de columna '",paste(colok_pasaporte[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          colnames(Pasaporte)[i]<-paste(colok_pasaporte[i,1])
        }
        #Lista de las buenas, anulado
        #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
        # write(paste("The column name in position ",paste(i)," is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        #write(paste("EL nombre de columna en la posici?n ",paste(i)," es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        #}
      }
      if(!fixthem){
        if(paste(colok_pasaporte[i,1])!=paste(colok_pasaporte1[i,1])){
          write(paste("The column name '",paste(colok_pasaporte[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El nombre de columna '",paste(colok_pasaporte[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
        #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
        # write(paste("The column name in position '",paste(i),"'' is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        #write(paste("EL nombre de columna en la posici?n '",paste(i),"'' es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        #}
      }
    }
    if(all(paste(colok_pasaporte[,1])==paste(colok_pasaporte1[,1]))){
      write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(nrow(colok_pasaporte)!=nrow(colok_pasaporte1)){
    write("Comparison between expected and user's column names cannot be done", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("THe number of columns does not match", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Comparaci?n entre los nombres de columnas esperadas y las aportadas por el usuario no pudo ser hecha", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero de columnas no coincide", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  }
  ##Caso geoqual con 49 o 50 columnas
  if(!availab&geoqual){
    if(nrow(colok_pasaporte3)==nrow(colok_pasaporte1)|nrow(colok_pasaporte2)==nrow(colok_pasaporte1)){
      if(nrow(colok_pasaporte1)==50){
      for (i in 1:nrow(colok_pasaporte1)){
        if(fixthem){
          if(paste(colok_pasaporte3[i,1])!=paste(colok_pasaporte1[i,1])){
            write(paste("The column name '",paste(colok_pasaporte3[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("El nombre de columna '",paste(colok_pasaporte3[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            colnames(Pasaporte)[i]<-paste(colok_pasaporte3[i,1])
          }
          #Lista de las buenas, anulado
          #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
          # write(paste("The column name in position ",paste(i)," is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          #write(paste("EL nombre de columna en la posici?n ",paste(i)," es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          #}
        }
        if(!fixthem){
          if(paste(colok_pasaporte3[i,1])!=paste(colok_pasaporte1[i,1])){
            write(paste("The column name '",paste(colok_pasaporte3[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("El nombre de columna '",paste(colok_pasaporte3[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
          # write(paste("The column name in position '",paste(i),"'' is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          #write(paste("EL nombre de columna en la posici?n '",paste(i),"'' es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          #}
        }
      }
      if(all(paste(colok_pasaporte3[,1])==paste(colok_pasaporte1[,1]))){
        write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
      }
      if(nrow(colok_pasaporte1)==49){
        for (i in 1:nrow(colok_pasaporte1)){
          if(fixthem){
            if(paste(colok_pasaporte2[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte2[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte2[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              colnames(Pasaporte)[i]<-paste(colok_pasaporte2[i,1])
            }
            #Lista de las buenas, anulado
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position ",paste(i)," is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n ",paste(i)," es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
          if(!fixthem){
            if(paste(colok_pasaporte2[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte2[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte2[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position '",paste(i),"'' is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n '",paste(i),"'' es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
        }
        if(all(paste(colok_pasaporte2[,1])==paste(colok_pasaporte1[,1]))){
          write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      } 
    }
    if(nrow(colok_pasaporte3)!=nrow(colok_pasaporte1)&nrow(colok_pasaporte2)!=nrow(colok_pasaporte1)){
      write("Comparison between expected and user's column names cannot be done", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("THe number of columns does not match", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Comparaci?n entre los nombres de columnas esperadas y las aportadas por el usuario no pudo ser hecha", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("El n?mero de columnas no coincide", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  ##Caso geoqual & availab con 50 o 51 columnas
  if(availab&geoqual){
    if(nrow(colok_pasaporte3)==nrow(colok_pasaporte1)|nrow(colok_pasaporte2)==nrow(colok_pasaporte1)){
      if(nrow(colok_pasaporte1)==51){
        for (i in 1:nrow(colok_pasaporte1)){
          if(fixthem){
            if(paste(colok_pasaporte3[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte3[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte3[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              colnames(Pasaporte)[i]<-paste(colok_pasaporte3[i,1])
            }
            #Lista de las buenas, anulado
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position ",paste(i)," is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n ",paste(i)," es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
          if(!fixthem){
            if(paste(colok_pasaporte3[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte3[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte3[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position '",paste(i),"'' is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n '",paste(i),"'' es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
        }
        if(all(paste(colok_pasaporte3[,1])==paste(colok_pasaporte1[,1]))){
          write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      if(nrow(colok_pasaporte1)==50){
        for (i in 1:nrow(colok_pasaporte1)){
          if(fixthem){
            if(paste(colok_pasaporte2[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte2[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte2[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              colnames(Pasaporte)[i]<-paste(colok_pasaporte2[i,1])
            }
            #Lista de las buenas, anulado
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position ",paste(i)," is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n ",paste(i)," es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
          if(!fixthem){
            if(paste(colok_pasaporte2[i,1])!=paste(colok_pasaporte1[i,1])){
              write(paste("The column name '",paste(colok_pasaporte2[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El nombre de columna '",paste(colok_pasaporte2[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            #if(paste(colok_pasaporte[i,1])==paste(colok_pasaporte1[i,1])){
            # write(paste("The column name in position '",paste(i),"'' is ok", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #write(paste("EL nombre de columna en la posici?n '",paste(i),"'' es correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            #}
          }
        }
        if(all(paste(colok_pasaporte2[,1])==paste(colok_pasaporte1[,1]))){
          write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      } 
    }
    if(nrow(colok_pasaporte3)!=nrow(colok_pasaporte1)&nrow(colok_pasaporte2)!=nrow(colok_pasaporte1)){
      write("Comparison between expected and user's column names cannot be done", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("THe number of columns does not match", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Comparaci?n entre los nombres de columnas esperadas y las aportadas por el usuario no pudo ser hecha", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("El n?mero de columnas no coincide", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  ######3#########
  #Filas fantasma#
  ################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part3/parte3:Ghost rows/Filas fantasma____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #revisi?n de dimensiones por filas
  if(access!=nrow(Pasaporte)){
    write("The number of expected rows does not match with the number of rows from your table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero esperado de filas no concuerda con el n?mero de filas de su tabla", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(all(lastrow=="1"|lastrow=="NA")){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because (at least) the last row contains only NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues (al menos) la ?ltima fila solo contiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(access==nrow(Pasaporte)){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(!all(lastrow=="1"|lastrow=="NA")){
      write(paste("There is no evidence the table '",paste(pasaporte),"' has 'ghost' rows",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("No hay eviodencias de que la tabla '",paste(pasaporte),"' tenga filas 'fantasma'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  #Eliminaci?n de filas fantasmas por eliminaci?n de NA en Accenumb
  if(fixthem){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    if(is.na(lastrow[1,2])){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because ACCENUMB field contains NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues campo ACCENUMB tiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for (i in nrow(Pasaporte):1){
        lastrow<-nrow(Pasaporte)
        lastrow<-Pasaporte[paste(lastrow),]
        if(is.na(lastrow[1,2])){
          write(paste("The row ",paste(i)," seems to be a ghost row", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La fila ",paste(i)," parece ser una fila fantasma", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte<-Pasaporte[(-1*i),]
        } 
      }
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("All the 'ghost' rows were deleted", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Todas las filas 'fantasma' fueron eliminadas", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
    }
  }
  #Aun sin solicitar autocorrecci?n, se eliminar?n filas m?s alla del n?mero reportado por el usuario en ACCESS
  #para el resto de procesos, pues pueden generarse errores
  Pasaporte<-Pasaporte[1:paste(access),]
  
  
  ########4#########
  #Celdas en blanco#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part4/parte4:Blank cells/Celdas en blanco____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }  
        }
      }
    }      
  }
  if(fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            Pasaporte[j,i]<-NA
          }  
        }
      }
    }
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Any blank cell detected was filled with NA value", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Cualquier celda vac?a detectada fue rellenada con valor NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  
  #############5###############
  #Requerimientos de cada campo#
  ##############################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part5/parte5:Fields requirements/requerimentos de cada campo____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #ACCENUMB
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. ACCENUMB field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. Campo ACCENUMB", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  if(fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte[i,2]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB row value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la posici?n de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  #Identificaci?n de valores NA en ACCENUMB
  accenumb<-unique(Pasaporte$ACCENUMB)
  if(any(is.na(accenumb))){
    if(!fixthem){
      write("ACCENUMB field contains some NA values - please replace them because it is going to produce bugs in tools", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, por favor reempl?celos pues de lo contrario ocasionar?n errores en las herramientas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write("ACCENUMB field contains some NA values - this values will be replaced by 'ACCENUMB' code plus the position number", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, estos valores ser?n reemplazados por el c?digo 'ACCENUMB' m?s el valor de posici?n", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for(i in 1:length(Pasaporte$ACCENUMB)){
        if(is.na(Pasaporte$ACCENUMB[i])){
          Pasaporte[i,2]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB 'NA' value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor 'NA' en la posici?n de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  
  
  #ORIGCTY
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. ORIGCTY field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Campo ORIGCTY", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #Evitar error por load de tablaORIGCTY.RData
  loadError<-FALSE
  abcd<-try(load("tablaORIGCTY.RData"),silent=TRUE)
  loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
  if(loadError){
    tablaORIGCTY<-read.delim("tablaORIGCTY.txt")
  }
  rm(abcd)
  rm(loadError)
  
  ORIGCTY<-unique(Pasaporte[,16])
  
  if(class(Pasaporte[,16])=="logical"){
    if(all(is.na(Pasaporte[,16]))){
      write("Warning! all your ORIGCTY values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores ORIGCTY son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,16])!="logical"){
    if(!all(is.na(Pasaporte[,16]))){
      if(!fixthem){
        for(i in 1:length(ORIGCTY)){
          if(!is.na(ORIGCTY[i])){
            if(!any(paste(ORIGCTY[i])==tablaORIGCTY[,2])){
              write(paste("ORIGCTY value '", paste(ORIGCTY[i]),"'' does not correspond to any valid ISO code for countries", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor en el campo ORIGCTY '", paste(ORIGCTY[i]),"'' no se corresponde con ning?n valor v?lido de c?digo ISO para pa?s", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
          }
        }
      }
      if(fixthem){
        for(i in 1:length(ORIGCTY)){
          if(!is.na(ORIGCTY[i])){
            if(!any(paste(ORIGCTY[i])==tablaORIGCTY[,2])){
              write(paste("ORIGCTY value '", paste(ORIGCTY[i]),"' does not correspond to any valid ISO code for countries", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor en el campo ORIGCTY '", paste(ORIGCTY[i]),"' no se corresponde con ning?n valor v?lido de c?digo ISO para pa?s", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              ORIGCTY2<-setdiff(paste(ORIGCTY[]),tablaORIGCTY[,2])
              for(j in 1:length(Pasaporte[,16])){
                for(k in 1:length(ORIGCTY2)){
                  if(!is.na(Pasaporte[j,16])&ORIGCTY2[k]==Pasaporte[j,16]){
                    Pasaporte[j,16]<-NA
                  }
                }
              }
              write(paste(paste("'",ORIGCTY[i]),"' value was replaced by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor '", paste(ORIGCTY[i]),"' fue reemplazado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }  
          }
        }
      }
      ORIGCTY3<-data.frame(ORIGCTY)
      ORIGCTY4<-merge(ORIGCTY3,tablaORIGCTY, by.x="ORIGCTY",by.y="ISO")
      if(nrow(ORIGCTY3)==nrow(ORIGCTY4)){
        write("ORIGCTY field is Ok, all ISO country codes in your table are valid", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Campo ORIGCTY esta ok, todos los c?digos ISO de pa?s en su tabla son v?lidos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
  }
  
  
  #ADM's
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. ADMs fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. Campos ADM", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,18])=="logical"){
    if(all(is.na(Pasaporte[,18]))){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Warning! all your ADM1 values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores ADM1 son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,19])=="logical"){
    if(all(is.na(Pasaporte[,19]))){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Warning! all your ADM2 values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores ADM2 son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,20])=="logical"){
    if(all(is.na(Pasaporte[,20]))){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Warning! all your ADM3 values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores ADM3 son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,21])=="logical"){
    if(all(is.na(Pasaporte[,21]))){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Warning! all your ADM4 values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores ADM4 son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  
  #DECLATITUDE/DECLONGITUDE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("D. DECLATITUDE/DECLONGITUDE fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("D. Campos DECLATITUDE/DECLONGITUDE", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,23])=="logical"){
    if(all(is.na(Pasaporte[,23]))){
      write("Warning! all your DECLATITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores DECLATITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,23])!="logical"){
    if(!all(is.na(Pasaporte[,23]))){
      #No hay problemas evidentes
      if(class(Pasaporte[,23])=="numeric"){
        if(all(Pasaporte[,23]<90,na.rm=TRUE) & all(Pasaporte[,23]> -90,na.rm=TRUE)){
          write("DECLATITUDE values are OK", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores DECLATITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      
      #Hay problemas
      if(!fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,23])!="numeric"){
          for(i in 1:length(Pasaporte[,23])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,23]))
            if (aaa< -90|aaa>90|is.na(aaa)){
              if(!is.na(Pasaporte[i,23])){
                write(paste("DECLATITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,23])=="numeric"){
          for(i in 1:length(Pasaporte[,23])){
            if((Pasaporte[i,23]>90 | Pasaporte[i,23]< -90) & !is.na(Pasaporte[i,23])){
              if(!is.na(Pasaporte[i,23])){
                write(paste("DECLATITUDE value in position ", paste(i)," exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
      }
      if(fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,23])!="numeric"){
          for(i in 1:length(Pasaporte[,23])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,23]))
            if (aaa< -90|aaa>90|is.na(aaa)){
              if(!is.na(Pasaporte[i,23])){
                write(paste("DECLATITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLATITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,23]<-NA
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,23])=="numeric"){
          for(i in 1:length(Pasaporte[,23])){
            if((Pasaporte[i,23]>90 | Pasaporte[i,23]< -90) & !is.na(Pasaporte[i,23])){
              if(!is.na(Pasaporte[i,23])){
                write(paste("DECLATITUDE value in position ", paste(i)," exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,23]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,23]<-NA
            }
          }
        }
      }
    }
  }
  
  
  #DECLONGITUDE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,25])=="logical"){
    if(all(is.na(Pasaporte[,25]))){
      write("Warning! all your DECLONGITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores DECLONGITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,25])!="logical"){
    if(!all(is.na(Pasaporte[,25]))){
      #No hay problemas evidentes
      if(class(Pasaporte[,25])=="numeric"){
        if(all(Pasaporte[,25]<180,na.rm=TRUE) & all(Pasaporte[,25]> -180,na.rm=TRUE)){
          write("DECLONGITUDE values are OK", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores DECLONGITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      
      #Hay problemas
      if(!fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,25])!="numeric"){
          for(i in 1:length(Pasaporte[,25])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,25]))
            if (aaa< -180|aaa>180|is.na(aaa)){
              if(!is.na(Pasaporte[i,25])){
                write(paste("DECLONGITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,25])=="numeric"){
          for(i in 1:length(Pasaporte[,25])){
            if((Pasaporte[i,25]>180 | Pasaporte[i,25]< -180) & !is.na(Pasaporte[i,25])){
              if(!is.na(Pasaporte[i,25])){
                write(paste("DECLONGITUDE value in position ", paste(i)," exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
      }
      if(fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,25])!="numeric"){
          for(i in 1:length(Pasaporte[,25])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,25]))
            if (aaa< -180|aaa>180|is.na(aaa)){
              if(!is.na(Pasaporte[i,25])){
                write(paste("DECLONGITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,25]<-NA
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,25])=="numeric"){
          for(i in 1:length(Pasaporte[,25])){
            if((Pasaporte[i,25]>180 | Pasaporte[i,25]< -180) & !is.na(Pasaporte[i,25])){
              if(!is.na(Pasaporte[i,25])){
                write(paste("DECLONGITUDE value in position ", paste(i)," exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,25]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,25]<-NA
            }
          }
        }
      }
    }
  }
  
  
  #LATITUDE/LONGITUDE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("E. LATITUDE/LONGITUDE fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("E. Campos LATITUDE/LONGITUDE", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #LATITUDE
  if(class(Pasaporte[,24])=="logical"){
    if(all(is.na(Pasaporte[,24]))){
      write("Warning! all your LATITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores LATITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,24])!="logical"){
    if(!all(is.na(Pasaporte[,24]))){
      #LATITUDE
      latitude<-nchar(paste(Pasaporte[,24]), type = "chars", allowNA = TRUE)
      if(!fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        dddd<-list()
        for(i in 1:length(Pasaporte[,24])){
          if(!is.na(Pasaporte[i,24])){
            if(latitude[i]!=7){
              write(paste("LATITUDE value in position ", paste(i)," has a non-valid number of characters (is no 7), in this case: ",paste(latitude[i])," characters", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 7), en este caso: ",paste(latitude[i])," caracteres", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            if(latitude[i]==7){
              aaa<-as.numeric(paste(substr(Pasaporte[i,24],1,2)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,24],3,4)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,24],5,6)))
              ddd<-paste(substr(Pasaporte[i,24],7,7))
              if(aaa>90|aaa<0|is.na(aaa)){
                write(paste("LATITUDE value in position ", paste(i)," has a non-valid degree value (>90), in this case: ",paste(substr(Pasaporte[i,24],1,2)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de grados no v?lido (>90), en este caso: ",paste(substr(Pasaporte[i,24],1,2)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb>=60|bbb<0|is.na(bbb))){
                if(substr(Pasaporte[i,24],3,4)!="--"){
                  write(paste("LATITUDE value in position ", paste(i)," has a non-valid minutes value (>=60), in this case: ",paste(substr(Pasaporte[i,24],3,4)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de minutos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,24],3,4)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc>=60|ccc<0|is.na(ccc))){
                if(substr(Pasaporte[i,24],5,6)!="--"){
                  write(paste("LATITUDE value in position ", paste(i)," has a non-valid seconds value (>=60), in this case: ",paste(substr(Pasaporte[i,24],5,6)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,24],5,6)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc<60&ccc>=0&!is.na(ccc))&(ddd!="N"&ddd!="S"|is.na(ddd))){
                write(paste("LATITUDE value in position ", paste(i)," has a non-valid hemisphere value (not N or S), in this case: ",paste(substr(Pasaporte[i,24],7,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de hemisferio no v?lido (ni N ni S), en este caso: ",paste(substr(Pasaporte[i,24],7,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
          if(is.na(Pasaporte[i,24])){
            aaa<-1
            bbb<-1
            ccc<-1
            ddd<-1
          }
          if(!is.na(Pasaporte[i,24])&substr(Pasaporte[i,24],3,4)=="--"){
            bbb<-1
          }
          if(!is.na(Pasaporte[i,24])&substr(Pasaporte[i,24],5,6)=="--"){
            ccc<-1
          }
          aaaa[[i]]<-aaa
          bbbb[[i]]<-bbb
          cccc[[i]]<-ccc
          dddd[[i]]<-ddd
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        dddd<-do.call("rbind",dddd)
        if(all(aaaa<=90&aaaa>=0&!is.na(aaaa))&all(bbbb<60&bbbb>=0&!is.na(bbbb))&all(cccc<60&cccc>=0&!is.na(cccc))&all(dddd=="N"|dddd=="S"&!is.na(dddd))){
          write("LATITUDE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores LATITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      if(fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        dddd<-list()
        for(i in 1:length(Pasaporte[,24])){
          if(!is.na(Pasaporte[i,24])){
            if(latitude[i]!=7){
              Pasaporte[i,24]<-NA
              write(paste("LATITUDE value in position ", paste(i)," has a non-valid number of characters (is not 7), in this case: ",paste(latitude[i])," characters", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 7), en este caso: ",paste(latitude[i])," caracteres", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("LATITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            if(latitude[i]==7){
              aaa<-as.numeric(paste(substr(Pasaporte[i,24],1,2)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,24],3,4)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,24],5,6)))
              ddd<-paste(substr(Pasaporte[i,24],7,7))
              if(aaa>90|aaa<0|is.na(aaa)){
                write(paste("LATITUDE value in position ", paste(i)," has a non-valid degree value (>90), in this case: ",paste(substr(Pasaporte[i,24],1,2)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de grados no v?lido (>90), en este caso: ",paste(substr(Pasaporte[i,24],1,2)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("LATITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,24]<-NA
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb>=60|bbb<0|is.na(bbb))){
                if(substr(Pasaporte[i,24],3,4)!="--"&!is.na(bbb)){
                  write(paste("LATITUDE value in position ", paste(i)," has a non-valid minutes value (>=60), in this case: ",paste(substr(Pasaporte[i,24],3,4)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de minutos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,24],3,4)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("LATITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,24]<-NA
                }
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc>=60|ccc<0|is.na(ccc))){
                if(substr(Pasaporte[i,24],5,6)!="--"&!is.na(ccc)){
                  write(paste("LATITUDE value in position ", paste(i)," has a non-valid seconds value (>=60), in this case: ",paste(substr(Pasaporte[i,24],5,6)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,24],5,6)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("LATITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,24]<-NA
                }
              }
              if((aaa<=90&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc<60&ccc>=0&!is.na(ccc))&(ddd!="N"&ddd!="S"|is.na(ddd))){
                write(paste("LATITUDE value in position ", paste(i)," has a non-valid hemisphere value (not N or S), in this case: ",paste(substr(Pasaporte[i,24],7,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," tiene un valor de hemisferio no v?lido (ni N ni S), en este caso: ",paste(substr(Pasaporte[i,24],7,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("LATITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,24]<-NA
              }
            }
          }
          if(is.na(Pasaporte[i,24])){
            aaa<-1
            bbb<-1
            ccc<-1
            ddd<-1
          }
          if(!is.na(Pasaporte[i,24])&substr(Pasaporte[i,24],3,4)=="--"){
            bbb<-1
          }
          if(!is.na(Pasaporte[i,24])&substr(Pasaporte[i,24],5,6)=="--"){
            ccc<-1
          }
          aaaa[[i]]<-aaa
          bbbb[[i]]<-bbb
          cccc[[i]]<-ccc
          dddd[[i]]<-ddd
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        dddd<-do.call("rbind",dddd)
        if(all(aaaa<=90&aaaa>=0&!is.na(aaaa))&all(bbbb<60&bbbb>=0&!is.na(bbbb))&all(cccc<60&cccc>=0&!is.na(cccc))&all(dddd=="N"|dddd=="S"&!is.na(dddd))){
          write("LATITUDE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores LATITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        } 
      }
    }
  }
  
  #LONGITUDE
  if(class(Pasaporte[,26])=="logical"){
    if(all(is.na(Pasaporte[,26]))){
      write("Warning! all your LONGITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores LONGITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,26])!="logical"){
    if(!all(is.na(Pasaporte[,26]))){
      #LONGITUDE
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      
      longitude<-nchar(paste(Pasaporte[,26]), type = "chars", allowNA = TRUE)
      
      if(!fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        dddd<-list()
        for(i in 1:length(Pasaporte[,26])){
          if(!is.na(Pasaporte[i,26])){
            if(longitude[i]!=8){
              write(paste("LONGITUDE value in position ", paste(i)," has a non-valid number of characters (is not 8), in this case: ",paste(longitude[i])," characters", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 8), en este caso: ",paste(longitude[i])," caracteres", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            if(longitude[i]==8){
              aaa<-as.numeric(paste(substr(Pasaporte[i,26],1,3)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,26],4,5)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,26],6,7)))
              ddd<-paste(substr(Pasaporte[i,26],8,8))
              if(aaa>180|aaa<0|is.na(aaa)){
                write(paste("LONGITUDE value in position ", paste(i)," has a non-valid degree value (>180), in this case: ",paste(substr(Pasaporte[i,26],1,3)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de grados no v?lido (>180), en este caso: ",paste(substr(Pasaporte[i,26],1,3)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb>=60|bbb<0|is.na(bbb))){
                if(substr(Pasaporte[i,26],4,5)!="--"){
                  write(paste("LONGITUDE value in position ", paste(i)," has a non-valid minutes value (>=60), in this case: ",paste(substr(Pasaporte[i,26],4,5)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de minutos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,26],4,5)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc>=60|ccc<0|is.na(ccc))){
                if(substr(Pasaporte[i,26],6,7)!="--"){
                  write(paste("LONGITUDE value in position ", paste(i)," has a non-valid seconds value (>=60), in this case: ",paste(substr(Pasaporte[i,26],6,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,26],6,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc<60&ccc>=0&!is.na(ccc))&(ddd!="W"&ddd!="E"|is.na(ddd))){
                write(paste("LONGITUDE value in position ", paste(i)," has a non-valid hemisphere value (not W or E), in this case: ",paste(substr(Pasaporte[i,26],8,8)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de hemisferio no v?lido (ni W ni E), en este caso: ",paste(substr(Pasaporte[i,26],8,8)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
          if(is.na(Pasaporte[i,26])){
            aaa<-1
            bbb<-1
            ccc<-1
            ddd<-1
          }
          if(!is.na(Pasaporte[i,26])&substr(Pasaporte[i,26],4,5)=="--"){
            bbb<-1
          }
          if(!is.na(Pasaporte[i,26])&substr(Pasaporte[i,26],6,7)=="--"){
            ccc<-1
          }
          aaaa[[i]]<-aaa
          bbbb[[i]]<-bbb
          cccc[[i]]<-ccc
          dddd[[i]]<-ddd
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        dddd<-do.call("rbind",dddd)
        if(all(aaaa<=180&aaaa>=0&!is.na(aaaa))&all(bbbb<60&bbbb>=0&!is.na(bbbb))&all(cccc<60&cccc>=0&!is.na(cccc))&all(dddd=="W"|dddd=="E"&!is.na(dddd))){
          write("LONGITUDE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores LONGITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      if(fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        dddd<-list()
        for(i in 1:length(Pasaporte[,26])){
          if(!is.na(Pasaporte[i,26])){
            if(longitude[i]!=8){
              Pasaporte[i,26]<-NA
              write(paste("LONGITUDE value in position ", paste(i)," has a non-valid number of characters (is not 8), in this case: ",paste(longitude[i])," characters", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 8), en este caso: ",paste(longitude[i])," caracteres", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("LONGITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor LONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            if(longitude[i]==8){
              aaa<-as.numeric(paste(substr(Pasaporte[i,26],1,3)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,26],4,5)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,26],6,7)))
              ddd<-paste(substr(Pasaporte[i,26],8,8))
              if(aaa>180|aaa<0|is.na(aaa)){
                write(paste("LONGITUDE value in position ", paste(i)," has a non-valid degree value (>180), in this case: ",paste(substr(Pasaporte[i,26],1,3)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de grados no v?lido (>180), en este caso: ",paste(substr(Pasaporte[i,26],1,3)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("LONGITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,26]<-NA
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb>=60|bbb<0|is.na(bbb))){
                if(substr(Pasaporte[i,26],4,5)!="--"){
                  write(paste("LONGITUDE value in position ", paste(i)," has a non-valid minutes value (>=60), in this case: ",paste(substr(Pasaporte[i,26],4,5)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de minutos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,26],4,5)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("LONGITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,26]<-NA
                }
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc>=60|ccc<0|is.na(ccc))){
                if(substr(Pasaporte[i,26],6,7)!="--"){
                  write(paste("LONGITUDE value in position ", paste(i)," has a non-valid seconds value (>=60), in this case: ",paste(substr(Pasaporte[i,26],6,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>=60), en este caso: ",paste(substr(Pasaporte[i,26],6,7)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("LONGITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor LONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,26]<-NA
                }
              }
              if((aaa<=180&aaa>=0&!is.na(aaa))&(bbb<60&bbb>=0&!is.na(bbb))&(ccc<60&ccc>=0&!is.na(ccc))&(ddd!="W"&ddd!="E"|is.na(ddd))){
                write(paste("LONGITUDE value in position ", paste(i)," has a non-valid hemisphere value (not W or E), in this case: ",paste(substr(Pasaporte[i,26],8,8)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," tiene un valor de hemisferio no v?lido (ni W ni E), en este caso: ",paste(substr(Pasaporte[i,26],8,8)), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("LONGITUDE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor LONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,26]<-NA
              }
            }
          }
          if(is.na(Pasaporte[i,26])){
            aaa<-1
            bbb<-1
            ccc<-1
            ddd<-1
          }
          if(!is.na(Pasaporte[i,26])&substr(Pasaporte[i,26],4,5)=="--"){
            bbb<-1
          }
          if(!is.na(Pasaporte[i,26])&substr(Pasaporte[i,26],6,7)=="--"){
            ccc<-1
          }
          aaaa[[i]]<-aaa
          bbbb[[i]]<-bbb
          cccc[[i]]<-ccc
          dddd[[i]]<-ddd
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        dddd<-do.call("rbind",dddd)
        if(all(aaaa<=180&aaaa>=0&!is.na(aaaa))&all(bbbb<60&bbbb>=0&!is.na(bbbb))&all(cccc<60&cccc>=0&!is.na(cccc))&all(dddd=="W"|dddd=="E"&!is.na(dddd))){
          write("LONGITUDE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores LONGITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        } 
      }
    }
  }
  
  #GEOREFMETH
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("F. GEOREFMETH field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("F. Campo GEOREFMETH", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  
  if(class(Pasaporte[,29])=="logical"){
    if(all(is.na(Pasaporte[,29]))){
      write("Warning! all your GEOREFMETH values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores GEOREFMETH son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,29])!="logical"){
    if(!all(is.na(Pasaporte[,29]))){
      #GEOREFMETH
      
      if(!fixthem){
        bbb<-Pasaporte[,29]
        if(class(bbb)!="numeric"){
          if(class(bbb)!="integer"){
            write("GEOREFMETH field contain some non-valid values (non numeric nor NA), please verify them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo GEOREFMETH contiene algunos valores no v?lidos (no num?ricos ni NA), por favor verif?quelos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          } 
        }
        aaaa<-list()
        for(i in 1:length(Pasaporte[,29])){
          if(!is.na(Pasaporte[i,29])){
            aaa<-as.numeric(paste(substr(Pasaporte[i,29],1,3)))
            if(aaa!=100&aaa!=200&aaa!=300&aaa!=400&aaa!=500|is.na(aaa)){
              write(paste("GEOREFMETH value in position ", paste(i)," has a non-valid value, in this case: ",paste(Pasaporte[i,29]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor GEOREFMETH en la posici?n ", paste(i)," tiene un valor no v?lido, en este caso: ",paste(Pasaporte[i,29]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
          }
          aaaa[[i]]<-aaa
        }
        if(class(bbb)=="numeric"|class(bbb)=="integer"){
          aaaa<-do.call("rbind",aaaa)
          if(all(aaaa==100|aaaa==200|aaaa==300|aaaa==400|aaaa==500)){
            write("GEOREFMETH values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores GEOREFMETH son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
        }
      }
      
      if(fixthem){
        bbb<-Pasaporte[,29]
        if(class(bbb)!="numeric"){
          if(class(bbb)!="integer"){
            write("GEOREFMETH field contain some non-valid values (non numeric nor NA)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo GEOREFMETH contiene algunos valores no v?lidos (no num?ricos ni NA)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
        }
        aaaa<-list()
        for(i in 1:length(Pasaporte[,29])){
          if(!is.na(Pasaporte[i,29])){
            aaa<-as.numeric(paste(substr(Pasaporte[i,29],1,3)))
            if(aaa!=100&aaa!=200&aaa!=300&aaa!=400&aaa!=500|is.na(aaa)){
              write(paste("GEOREFMETH value in position ", paste(i)," has a non-valid value, in this case: ",paste(Pasaporte[i,29]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor GEOREFMETH en la posici?n ", paste(i)," tiene un valor no v?lido, en este caso: ",paste(Pasaporte[i,29]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              Pasaporte[i,29]<-NA
            }
          }
          aaaa[[i]]<-aaa
        }
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("GEOREFMETH non-valid values were replaced by NA values", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Valores no v?lidos en GEOREFMETH fueron reemplazados por NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        if(class(bbb)=="numeric"|class(bbb)=="integer"){
          aaaa<-do.call("rbind",aaaa)
          if(all(aaaa==100|aaaa==200|aaaa==300|aaaa==400|aaaa==500)){
            write("GEOREFMETH values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores GEOREFMETH son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
        }
      }
    }
  }
  
  #COLLDATE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("G. COLLDATE field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("G. Campo COLLDATE", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  
  if(class(Pasaporte[,31])=="logical"){
    if(all(is.na(Pasaporte[,31]))){
      write("Warning! all your COLLDATE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores COLLDATE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,31])!="logical"){
    if(!all(is.na(Pasaporte[,31]))){
      #COLLDATE    
      colldate<-nchar(paste(Pasaporte[,31]), type = "chars", allowNA = TRUE)
      for(i in 1:length(Pasaporte[,31])){
        if(is.na(Pasaporte[i,31])){
          colldate[i]<-8
        }
      }
      if(!fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        anno<-as.numeric(paste(substr(date(),21,24)))
        for(i in 1:length(Pasaporte[,31])){
          if(!is.na(Pasaporte[i,31])){
            if(colldate[i]!=8){
              write(paste("COLLDATE value in position ", paste(i)," has a non-valid number of characters (is not 8), in this case: '",paste(Pasaporte[i,31]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 8), en este caso: '",paste(Pasaporte[i,31]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
            if(colldate[i]==8){
              aaa<-as.numeric(paste(substr(Pasaporte[i,31],1,4)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,31],5,6)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,31],7,8)))
              if(aaa>anno|aaa<1900|is.na(aaa)){
                write(paste("COLLDATE value in position ", paste(i)," has a non-valid year value, in this case: '",paste(substr(Pasaporte[i,31],1,colldate[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de año no v?lido, en este caso: '",paste(substr(Pasaporte[i,31],1,colldate[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              if((aaa<=anno&aaa>=1900&!is.na(aaa))&(bbb>12|bbb<1|is.na(bbb))){
                if(substr(Pasaporte[i,31],5,6)!="--"){
                  write(paste("COLLDATE value in position ", paste(i)," has a non-valid month value (>12 & <01), in this case: '",paste(paste(substr(Pasaporte[i,31],5,6))),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de mes no v?lido (>12 & <01), en este caso: '",paste(paste(substr(Pasaporte[i,31],5,6))),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                } 
              }
              if((aaa<=anno&aaa>=1900&!is.na(aaa))&(bbb<=12&bbb>=1&!is.na(bbb))&(ccc>31|ccc<1|is.na(ccc))){
                if(substr(Pasaporte[i,31],7,8)!="--"){
                  write(paste("COLLDATE value in position ", paste(i)," has a non-valid day value (>31 & <01), in this case: '",paste(substr(Pasaporte[i,31],7,8)),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>31 & <01), en este caso: '",paste(substr(Pasaporte[i,31],7,8)),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                } 
              }
              aaaa[[i]]<-aaa
              bbbb[[i]]<-bbb
              cccc[[i]]<-ccc
            }
          }
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        if(all(aaaa<=anno&aaaa>=1900, na.rm=TRUE)&all(bbbb<=12&bbbb>=1,na.rm=TRUE)&all(cccc<=31&cccc>=1,na.rm=TRUE)&all(colldate==8,na.rm=TRUE)){
          write("COLLDATE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores COLLDATE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        } 
      }
      if(fixthem){
        aaaa<-list()
        bbbb<-list()
        cccc<-list()
        anno<-as.numeric(paste(substr(date(),21,24)))
        for(i in 1:length(Pasaporte[,31])){
          if(is.na(Pasaporte[i,31])){
            aaa<-NA
            bbb<-NA
            ccc<-NA
          }
          if(!is.na(Pasaporte[i,31])){
            if(colldate[i]!=8){
              write(paste("COLLDATE value in position ", paste(i)," has a non-valid number of characters (is not 8), in this case: '",paste(Pasaporte[i,31]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un n?mero de caracteres diferente al v?lido (no es 8), en este caso: '",paste(Pasaporte[i,31]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("COLLDATE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor COLLDATE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              Pasaporte[i,31]<-NA
            }
            if(colldate[i]==8){
              aaa<-as.numeric(paste(substr(Pasaporte[i,31],1,4)))
              bbb<-as.numeric(paste(substr(Pasaporte[i,31],5,6)))
              ccc<-as.numeric(paste(substr(Pasaporte[i,31],7,8)))
              if(aaa>anno|aaa<1900|is.na(aaa)){
                write(paste("COLLDATE value in position ", paste(i)," has a non-valid year value, in this case: '",paste(substr(Pasaporte[i,31],1,colldate[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de año no v?lido, en este caso: '",paste(substr(Pasaporte[i,31],1,colldate[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("COLLDATE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLDATE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,31]<-NA
              }
              if((aaa<=anno&aaa>=1900&!is.na(aaa))&(bbb>12|bbb<1|is.na(bbb))){
                if(substr(Pasaporte[i,31],5,6)!="--"){
                  write(paste("COLLDATE value in position ", paste(i)," has a non-valid month value (>12 & <01), in this case: '",paste(paste(substr(Pasaporte[i,31],5,6))),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de mes no v?lido (>12 & <01), en este caso: '",paste(paste(substr(Pasaporte[i,31],5,6))),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("COLLDATE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,31]<-NA
                } 
              }
              if((aaa<=anno&aaa>=1900&!is.na(aaa))&(bbb<=12&bbb>=1&!is.na(bbb))&(ccc>31|ccc<1|is.na(ccc))){
                if(substr(Pasaporte[i,31],7,8)!="--"){
                  write(paste("COLLDATE value in position ", paste(i)," has a non-valid day value (>31 & <01), in this case: '",paste(substr(Pasaporte[i,31],7,8)),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," tiene un valor de segundos no v?lido (>31 & <01), en este caso: '",paste(substr(Pasaporte[i,31],7,8)),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("COLLDATE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLDATE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,31]<-NA
                } 
              }
            }
          }
          aaaa[[i]]<-aaa
          bbbb[[i]]<-bbb
          cccc[[i]]<-ccc
        }
        aaaa<-do.call("rbind",aaaa)
        bbbb<-do.call("rbind",bbbb)
        cccc<-do.call("rbind",cccc)
        if(all(aaaa<=anno&aaaa>=1900, na.rm=TRUE)&all(bbbb<=12&bbbb>=1,na.rm=TRUE)&all(cccc<=31&cccc>=1,na.rm=TRUE)&all(colldate==8,na.rm=TRUE)){
          write("COLLDATE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores COLLDATE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        } 
      }
    }
  }
  
  #SAMPSTAT
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("H. SAMPSTAT field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("H. Campo SAMPSTAT", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  
  if(class(Pasaporte[,34])=="logical"){
    if(all(is.na(Pasaporte[,34]))){
      write("Warning! all your SAMPSTAT values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores SAMPSTAT son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,34])!="logical"){
    if(!all(is.na(Pasaporte[,34]))){
      #SAMPSTAT        
      sampstat<-nchar(paste(Pasaporte[,34]), type = "chars", allowNA = TRUE)
      #Conversi?n de NA en valores 3, pues son correctos
      for(i in 1:length(sampstat)){
        if(is.na(Pasaporte[i,34])){
          sampstat[i]<-3
        }
      }
      #Aparentemente mal
      if((class(Pasaporte[,34])!="numeric"&class(Pasaporte[,34])!="integer")|any(sampstat!=3,na.rm=TRUE)){
        if(!fixthem){
          write("SAMPSTAT field contains some non-valid values, please check the follow list of errors and correct them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo SAMPSTAT contiene valores no v?lidos, por favor verifique la siguiente lista de errores y corr?jalos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,34])){
            if(!is.na(Pasaporte[i,34])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,34],1,sampstat[i])))
              if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
        if(fixthem){
          write("SAMPSTAT field contains some non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,34])){
            if(!is.na(Pasaporte[i,34])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,34],1,sampstat[i])))
              if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("SAMPSTAT value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,34]<-NA
              }
            }
          }
        }  
      }
      
      #Aparentemente bien
      if((class(Pasaporte[,34])=="numeric"|class(Pasaporte[,34])=="integer")&all(sampstat==3,na.rm=TRUE)){
        if(!fixthem){
          if(all(Pasaporte[,34]==100|Pasaporte[,34]==110|Pasaporte[,34]==120|Pasaporte[,34]==200|Pasaporte[,34]==300|Pasaporte[,34]==400|Pasaporte[,34]==410|Pasaporte[,34]==411|Pasaporte[,34]==412|Pasaporte[,34]==413|Pasaporte[,34]==414|Pasaporte[,34]==415|Pasaporte[,34]==420|Pasaporte[,34]==500|Pasaporte[,34]==999,na.rm=TRUE)){
            write("SAMPSTAT values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores SAMPSTAT son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,34]==100|Pasaporte[,34]==110|Pasaporte[,34]==120|Pasaporte[,34]==200|Pasaporte[,34]==300|Pasaporte[,34]==400|Pasaporte[,34]==410|Pasaporte[,34]==411|Pasaporte[,34]==412|Pasaporte[,34]==413|Pasaporte[,34]==414|Pasaporte[,34]==415|Pasaporte[,34]==420|Pasaporte[,34]==500|Pasaporte[,34]==999,na.rm=TRUE)){
            write("SAMPSTAT field contains some non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,34])){
              if(!is.na(Pasaporte[i,34])){
                aaa<-as.numeric(paste(substr(Pasaporte[i,34],1,sampstat[i])))
                if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                  write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
            }
          }
        }
        if(fixthem){
          if(all(Pasaporte[,34]==100|Pasaporte[,34]==110|Pasaporte[,34]==120|Pasaporte[,34]==200|Pasaporte[,34]==300|Pasaporte[,34]==400|Pasaporte[,34]==410|Pasaporte[,34]==411|Pasaporte[,34]==412|Pasaporte[,34]==413|Pasaporte[,34]==414|Pasaporte[,34]==415|Pasaporte[,34]==420|Pasaporte[,34]==500|Pasaporte[,34]==999,na.rm=TRUE)){
            write("SAMPSTAT values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores SAMPSTAT son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,34]==100|Pasaporte[,34]==110|Pasaporte[,34]==120|Pasaporte[,34]==200|Pasaporte[,34]==300|Pasaporte[,34]==400|Pasaporte[,34]==410|Pasaporte[,34]==411|Pasaporte[,34]==412|Pasaporte[,34]==413|Pasaporte[,34]==414|Pasaporte[,34]==415|Pasaporte[,34]==420|Pasaporte[,34]==500|Pasaporte[,34]==999,na.rm=TRUE)){
            write("SAMPSTAT field contains some non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,34])){
              if(!is.na(Pasaporte[i,34])){
                aaa<-as.numeric(paste(substr(Pasaporte[i,34],1,sampstat[i])))
                if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                  write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,34],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("SAMPSTAT value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,34]<-NA
                }
              }
            }
          }
        }
      }
    }
  }
  
  #COLLSRC
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("I. COLLSRC field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("I. Campo COLLSRC", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,36])=="logical"){
    if(all(is.na(Pasaporte[,36]))){
      write("Warning! all your COLLSRC values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores COLLSRC son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,36])!="logical"){
    if(!all(is.na(Pasaporte[,36]))){
      #COLLSRC    
      collsrc<-nchar(paste(Pasaporte[,36]), type = "chars", allowNA = TRUE)
      #Aparentemente mal
      if((class(Pasaporte[,36])!="numeric"&class(Pasaporte[,36])!="integer")|any(collsrc!=2,na.rm=TRUE)){
        if(!fixthem){
          write("COLLSRC field contains any non-valid values, please check the follow list of errors and correct them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo COLLSRC contiene valores no v?lidos, por favor verifique la siguiente lista de errores y corr?jalos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,36])){
            if(!is.na(Pasaporte[i,36])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,36],1,collsrc[i])))
              if(!((aaa==10|aaa==11|aaa==12|aaa==13|aaa==14|aaa==15|aaa==20|aaa==21|aaa==22|aaa==23|aaa==24|aaa==25|aaa==26|aaa==27|aaa==28|aaa==30|aaa==40|aaa==50|aaa==60|aaa==61|aaa==62|aaa==99)&!is.na(aaa))){
                write(paste("COLLSRC value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLSRC en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
        if(fixthem){
          write("COLLSRC field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo COLLSRC contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,36])){
            if(!is.na(Pasaporte[i,36])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,36],1,collsrc[i])))
              if(!((aaa==10|aaa==11|aaa==12|aaa==13|aaa==14|aaa==15|aaa==20|aaa==21|aaa==22|aaa==23|aaa==24|aaa==25|aaa==26|aaa==27|aaa==28|aaa==30|aaa==40|aaa==50|aaa==60|aaa==61|aaa==62|aaa==99)&!is.na(aaa))){
                write(paste("COLLSRC value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLSRC en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("COLLSRC value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor COLLSRC en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,36]<-NA
              }
            }
          }
        }  
      }
      
      #Aparentemente bien
      if((class(Pasaporte[,36])=="numeric"|class(Pasaporte[,36])=="integer")&all(collsrc==2,na.rm=TRUE)){
        if(!fixthem){
          if(all(Pasaporte[,36]==10|Pasaporte[,36]==11|Pasaporte[,36]==12|Pasaporte[,36]==13|Pasaporte[,36]==14|Pasaporte[,36]==15|Pasaporte[,36]==20|Pasaporte[,36]==21|Pasaporte[,36]==22|Pasaporte[,36]==23|Pasaporte[,36]==24|Pasaporte[,36]==25|Pasaporte[,36]==26|Pasaporte[,36]==27|Pasaporte[,36]==28|Pasaporte[,36]==30|Pasaporte[,36]==40|Pasaporte[,36]==50|Pasaporte[,36]==60|Pasaporte[,36]==61|Pasaporte[,36]==62|Pasaporte[,36]==99,na.rm=TRUE)){
            write("COLLSRC values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores COLLSRC son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,36]==10|Pasaporte[,36]==11|Pasaporte[,36]==12|Pasaporte[,36]==13|Pasaporte[,36]==14|Pasaporte[,36]==15|Pasaporte[,36]==20|Pasaporte[,36]==21|Pasaporte[,36]==22|Pasaporte[,36]==23|Pasaporte[,36]==24|Pasaporte[,36]==25|Pasaporte[,36]==26|Pasaporte[,36]==27|Pasaporte[,36]==28|Pasaporte[,36]==30|Pasaporte[,36]==40|Pasaporte[,36]==50|Pasaporte[,36]==60|Pasaporte[,36]==61|Pasaporte[,36]==62|Pasaporte[,36]==99,na.rm=TRUE)){
            write("COLLSRC field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo COLLSRC contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,36])){
              if(!is.na(Pasaporte[i,36])){
                if(!((Pasaporte[i,36]==10|Pasaporte[i,36]==11|Pasaporte[i,36]==12|Pasaporte[i,36]==13|Pasaporte[i,36]==14|Pasaporte[i,36]==15|Pasaporte[i,36]==20|Pasaporte[i,36]==21|Pasaporte[i,36]==22|Pasaporte[i,36]==23|Pasaporte[i,36]==24|Pasaporte[i,36]==25|Pasaporte[i,36]==26|Pasaporte[i,36]==27|Pasaporte[i,36]==28|Pasaporte[i,36]==30|Pasaporte[i,36]==40|Pasaporte[i,36]==50|Pasaporte[i,36]==60|Pasaporte[i,36]==61|Pasaporte[i,36]==62|Pasaporte[i,36]==99)&!is.na(Pasaporte[i,36]))){
                  write(paste("COLLSRC value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLSRC en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
            }
          }
        }
        if(fixthem){
          if(all(Pasaporte[,36]==10|Pasaporte[,36]==11|Pasaporte[,36]==12|Pasaporte[,36]==13|Pasaporte[,36]==14|Pasaporte[,36]==15|Pasaporte[,36]==20|Pasaporte[,36]==21|Pasaporte[,36]==22|Pasaporte[,36]==23|Pasaporte[,36]==24|Pasaporte[,36]==25|Pasaporte[,36]==26|Pasaporte[,36]==27|Pasaporte[,36]==28|Pasaporte[,36]==30|Pasaporte[,36]==40|Pasaporte[,36]==50|Pasaporte[,36]==60|Pasaporte[,36]==61|Pasaporte[,36]==62|Pasaporte[,36]==99,na.rm=TRUE)){
            write("COLLSRC values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores COLLSRC son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,36]==10|Pasaporte[,36]==11|Pasaporte[,36]==12|Pasaporte[,36]==13|Pasaporte[,36]==14|Pasaporte[,36]==15|Pasaporte[,36]==20|Pasaporte[,36]==21|Pasaporte[,36]==22|Pasaporte[,36]==23|Pasaporte[,36]==24|Pasaporte[,36]==25|Pasaporte[,36]==26|Pasaporte[,36]==27|Pasaporte[,36]==28|Pasaporte[,36]==30|Pasaporte[,36]==40|Pasaporte[,36]==50|Pasaporte[,36]==60|Pasaporte[,36]==61|Pasaporte[,36]==62|Pasaporte[,36]==99,na.rm=TRUE)){
            write("COLLSRC field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo COLLSRC contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,36])){
              if(!is.na(Pasaporte[i,36])){
                if(!((Pasaporte[i,36]==10|Pasaporte[i,36]==11|Pasaporte[i,36]==12|Pasaporte[i,36]==13|Pasaporte[i,36]==14|Pasaporte[i,36]==15|Pasaporte[i,36]==20|Pasaporte[i,36]==21|Pasaporte[i,36]==22|Pasaporte[i,36]==23|Pasaporte[i,36]==24|Pasaporte[i,36]==25|Pasaporte[i,36]==26|Pasaporte[i,36]==27|Pasaporte[i,36]==28|Pasaporte[i,36]==30|Pasaporte[i,36]==40|Pasaporte[i,36]==50|Pasaporte[i,36]==60|Pasaporte[i,36]==61|Pasaporte[i,36]==62|Pasaporte[i,36]==99)&!is.na(Pasaporte[i,36]))){
                  write(paste("COLLSRC value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLSRC en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,36],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("COLLSRC value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor COLLSRC en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,36]<-NA
                }
              }
            }
          }
        }
      }
    }
  }
  
  #AVAILAB
  if(availab){
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("J. AVAILAB field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("J. Campo AVAILAB", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    if(!fixthem){
      if(class(Pasaporte[,46])=="logical"){
        if(all(is.na(Pasaporte[,46]))){
          write("Warning! all your AVAILAB values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Precauci?n! todos sus valores AVAILAB son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }  
      }
      if(class(Pasaporte[,46])!="logical"){
        #Bien
        if(all(Pasaporte[,46]==1|Pasaporte[,46]==0|is.na(Pasaporte[,46]))){
          write("AVAILAB values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores AVAILAB son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)   
        }
        #Errores
        if(!all(Pasaporte[,46]==1|Pasaporte[,46]==0|is.na(Pasaporte[,46]))){
          availab<-nchar(paste(Pasaporte[,46]), type = "chars", allowNA = TRUE)
          for(i in 1:length(Pasaporte[,46])){
            if(Pasaporte[i,46]!=1&Pasaporte[i,46]!=0&!is.na(Pasaporte[i,46])){
              write(paste("AVAILAB value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,46],1,availab[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor AVAILAB en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,46],1,availab[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }
          }
        }  
      }
    }
    if(fixthem){
      if(class(Pasaporte[,46])=="logical"){
        if(all(is.na(Pasaporte[,46]))){
          write("Warning! all your AVAILAB values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Precauci?n! todos sus valores AVAILAB son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }  
      }
      if(class(Pasaporte[,46])!="logical"){
        #Bien
        if(all(Pasaporte[,46]==1|Pasaporte[,46]==0|is.na(Pasaporte[,46]))){
          write("AVAILAB values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores AVAILAB son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)   
        }
        #Errores
        if(!all(Pasaporte[,46]==1|Pasaporte[,46]==0|is.na(Pasaporte[,46]))){
          availab<-nchar(paste(Pasaporte[,46]), type = "chars", allowNA = TRUE)
          for(i in 1:length(Pasaporte[,46])){
            if(Pasaporte[i,46]!=1&Pasaporte[i,46]!=0&!is.na(Pasaporte[i,46])){
              write(paste("AVAILAB value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,46],1,availab[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor AVAILAB en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,46],1,availab[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("AVAILAB value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("El valor AVAILAB en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              Pasaporte[i,46]<-NA
            }
          }
        }  
      }
    }
  }
  
  if(fixthem){
  write.table(Pasaporte,file="Pasaporte/Pasaporte_Passport_corr.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(Pasaporte,file="Pasaporte/Pasaporte_Passport_corr.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  ####END_FIN!############
}



#####################################################################################
#########Tabla Fuentes externas######################################################
#####################################################################################

if(tiptable=="FuentesExternas"){
  #introducci?n datos pasaporte
  Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
  
  ######1######
  #Dimensiones#
  #############
  #revisi?n de dimensiones por columnas
  write("__Part1/parte1: Dimension/Dimensi?n____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  if(ncol(Pasaporte)!=15){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'External Source' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Fuentes Externas'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has no 15 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla no tiene 15 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("The table has ", paste(ncol(Pasaporte))," columns",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  } 
  if(ncol(Pasaporte)==15){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'External Source' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Fuentes Externas'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has the 15 required columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla tiene las 15 columnas requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(fixthem){
    if(ncol(Pasaporte)!=15){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Your table has been resized, in case it exceeds the 12 columns required", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Su tabla ha sido reducida en n?mero columnas en caso de que excediera las 15 requeridas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte<-Pasaporte[,1:15] 
    }
  }
  
  ######2###########
  #Nombres Columnas#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part2/parte2:Column names/Nombres columnas____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  #Revisi?n de nombres de columnas
  #Introducci?n nombres correctos y creaci?n lista usuario
  colok_pasaporte1<-data.frame(colnames(Pasaporte))
  #Evitar error por load de testable1.RData
  loadError<-FALSE
  abcd<-try(load("testable1.RData"),silent=TRUE)
  loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
  if(loadError){
    colok_pasaporte<-read.delim("testable1.txt")
  }
  rm(abcd)
  rm(loadError)
  
  colok_pasaporte<-data.frame(colok_pasaporte[1:15,2])
  #Comparaci?n
  if(nrow(colok_pasaporte)==nrow(colok_pasaporte1)){
    for (i in 1:nrow(colok_pasaporte1)){
      if(fixthem){
        if(paste(colok_pasaporte[i,1])!=paste(colok_pasaporte1[i,1])){
          write(paste("The column name '",paste(colok_pasaporte[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("The column name in the position ",paste(i)," on your table has been replaced by the right name", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El nombre de columna '",paste(colok_pasaporte[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("EL nombre de columna en la posici?n ",paste(i)," en su tabla ha sido reemplazado por el nombre correcto", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          colnames(Pasaporte)[i]<-paste(colok_pasaporte[i,1])
        }
      }
      if(!fixthem){
        if(paste(colok_pasaporte[i,1])!=paste(colok_pasaporte1[i,1])){
          write(paste("The column name '",paste(colok_pasaporte[i,1]),"'' is not in the right position (",paste(i), ") in your table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El nombre de columna '",paste(colok_pasaporte[i,1]),"'' no est? en la posici?n (",paste(i), ") adecuada en su tabla", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
    if(all(paste(colok_pasaporte[,1])==paste(colok_pasaporte1[,1]))){
      write("All the column names of your table do match with the expected names", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Todos los nombres de columna de su tabla coinciden con los nombres esperados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(nrow(colok_pasaporte)!=nrow(colok_pasaporte1)){
    write("Comparison between expected and user's column names cannot be done", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("THe number of columns does not match", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Comparaci?n entre los nombres de columnas esperadas y las aportadas por el usuario no pudo ser hecha", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero de columnas no coincide", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  
  ######3#########
  #Filas fantasma#
  ################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part3/parte3:Ghost rows/Filas fantasma____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #revisi?n de dimensiones por filas
  if(access!=nrow(Pasaporte)){
    write("The number of expected rows does not match with the number of rows from your table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero esperado de filas no concuerda con el n?mero de filas de su tabla", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(all(lastrow=="1"|lastrow=="NA")){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because (at least) the last row contains only NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues (al menos) la ?ltima fila solo contiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(access==nrow(Pasaporte)){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(!all(lastrow=="1"|lastrow=="NA")){
      write(paste("There is no evidence the table '",paste(pasaporte),"' has 'ghost' rows",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("No hay eviodencias de que la tabla '",paste(pasaporte),"' tenga filas 'fantasma'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  #Eliminaci?n de filas fantasmas por eliminaci?n de NA en ID
  if(fixthem){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    if(all(is.na(lastrow[1,]))){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because ID field contains NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues campo ID tiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for (i in nrow(Pasaporte):1){
        lastrow<-nrow(Pasaporte)
        lastrow<-Pasaporte[paste(lastrow),]
        if(all(is.na(lastrow[1,]))){
          write(paste("The row ",paste(i)," seems to be a ghost row", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La fila ",paste(i)," parece ser una fila fantasma", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte<-Pasaporte[(-1*i),]
        } 
      }
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("All the 'ghost' rows were deleted", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Todas las filas 'fantasma' fueron eliminadas", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
    }
  }
  ########4#########
  #Celdas en blanco#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part4/parte4:Blank cells/Celdas en blanco____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }  
        }
      }
    }      
  }
  if(fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            Pasaporte[j,i]<-NA
          }  
        }
      }
    }
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Any blank cell detected was filled with NA value", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Cualquier celda vac?a detectada fue rellenada con valor NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  
  #############5###############
  #Requerimientos de cada campo#
  ##############################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part5/parte5:Specific field requirements/Requerimientos especiales de algunos campos____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
 
  
  #ID
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. ID field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. Campo ID", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    accenumb<-unique(Pasaporte$ID)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ID field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ID field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ID)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ID row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ID ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  if(fixthem){
    if(class(Pasaporte$ID)=="logical"){
      if(all(is.na(Pasaporte$ID[]))){
        write("All your ID values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Todos los valores ID son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        Pasaporte$ID<-c(1:length(Pasaporte$ID))
        write("ID values (NA) were replaced by consecutive integer numbers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write("Los valores en ID de tipo NA fueron reemplazados por n?meros integrales consecutivos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    accenumb<-unique(Pasaporte$ID)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ID field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ID field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ID)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ID row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ID ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte[i,1]<-paste("ID",i,sep="")
          write(paste("ID row value at position ", paste(i)," was replaced by 'ID' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la posici?n/fila de ID ", paste(i)," fue reemplazado por 'ID' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  #Identificaci?n de valores NA en ID
  accenumb<-unique(Pasaporte$ID)
  if(any(is.na(accenumb))){
    if(!fixthem){
      write("ID field contains some NA values - please replace them because it is going to produce bugs in tools", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID contiene valores NA, por favor reempl?celos pues de lo contrario ocasionar?n errores en las herramientas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID field contains some NA values - this values will be replaced by 'ID' code plus the position number", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID contiene valores NA, estos valores ser?n reemplazados por el c?digo 'ID' m?s el valor de posici?n", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for(i in 1:length(Pasaporte$ID)){
        if(is.na(Pasaporte$ID[i])){
          Pasaporte[i,1]<-paste("ID",i,sep="")
          write(paste("ID 'NA' value at position ", paste(i)," was replaced by 'ID' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor 'NA' en la posici?n de ID ", paste(i)," fue reemplazado por 'ID' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  
  #TYPESOURCE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. TYPESOURCE field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Campo TYPESOURCE", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,3])=="logical"){
    if(all(is.na(Pasaporte[,3]))){
      write("Warning! all your TYPESOURCE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores TYPESOURCE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,3])!="logical"){
    if(!all(is.na(Pasaporte[,3]))){
      #TYPESOURCE    
      collsrc<-nchar(paste(Pasaporte[,3]), type = "chars", allowNA = TRUE)
      #Aparentemente mal
      if((class(Pasaporte[,3])!="numeric"&class(Pasaporte[,3])!="integer")|any(collsrc!=2,na.rm=TRUE)){
        if(!fixthem){
          write("TYPESOURCE field contains any non-valid values, please check the follow list of errors and correct them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo TYPESOURCE contiene valores no v?lidos, por favor verifique la siguiente lista de errores y corr?jalos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,3])){
            if(!is.na(Pasaporte[i,3])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,3],1,collsrc[i])))
              if(!((aaa==10|aaa==20|aaa==30|aaa==40|aaa==50)&!is.na(aaa))){
                write(paste("TYPESOURCE value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
        if(fixthem){
          write("TYPESOURCE field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo TYPESOURCE contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,3])){
            if(!is.na(Pasaporte[i,3])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,3],1,collsrc[i])))
              if(!((aaa==10|aaa==20|aaa==30|aaa==40|aaa==50)&!is.na(aaa))){
                write(paste("TYPESOURCE value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("TYPESOURCE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,3]<-NA
              }
            }
          }
        }  
      }
      
      #Aparentemente bien
      if((class(Pasaporte[,3])=="numeric"|class(Pasaporte[,3])=="integer")&all(collsrc==2,na.rm=TRUE)){
        if(!fixthem){
          if(all(Pasaporte[,3]==10|Pasaporte[,3]==20|Pasaporte[,3]==30|Pasaporte[,3]==40|Pasaporte[,3]==50,na.rm=TRUE)){
            write("TYPESOURCE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores TYPESOURCE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,3]==10|Pasaporte[,3]==20|Pasaporte[,3]==30|Pasaporte[,3]==40|Pasaporte[,3]==50,na.rm=TRUE)){
            write("TYPESOURCE field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo TYPESOURCE contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,3])){
              if(!is.na(Pasaporte[i,3])){
                if(!((Pasaporte[i,3]==10|Pasaporte[i,3]==20|Pasaporte[i,3]==30|Pasaporte[i,3]==40|Pasaporte[i,3]==50)&!is.na(Pasaporte[i,3]))){
                  write(paste("TYPESOURCE value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
            }
          }
        }
        if(fixthem){
          if(all(Pasaporte[i,3]==10|Pasaporte[i,3]==20|Pasaporte[i,3]==30|Pasaporte[i,3]==40|Pasaporte[i,3]==50,na.rm=TRUE)){
            write("TYPESOURCE values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores TYPESOURCE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[i,3]==10|Pasaporte[i,3]==20|Pasaporte[i,3]==30|Pasaporte[i,3]==40|Pasaporte[i,3]==50,na.rm=TRUE)){
            write("TYPESOURCE field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo TYPESOURCE contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,3])){
              if(!is.na(Pasaporte[i,3])){
                if(!((Pasaporte[i,3]==10|Pasaporte[i,3]==20|Pasaporte[i,3]==30|Pasaporte[i,3]==40|Pasaporte[i,3]==50)&!is.na(Pasaporte[i,3]))){
                  write(paste("TYPESOURCE value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,3],1,collsrc[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("TYPESOURCE value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor TYPESOURCE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,3]<-NA
                }
              }
            }
          }
        }
      }
    }
  }
  
  #DECLATITUDE/DECLONGITUDE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. DECLATITUDE/DECLONGITUDE fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. Campos DECLATITUDE/DECLONGITUDE", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,11])=="logical"){
    if(all(is.na(Pasaporte[,11]))){
      write("Warning! all your DECLATITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores DECLATITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,11])!="logical"){
    if(!all(is.na(Pasaporte[,11]))){
      #No hay problemas evidentes
      if(class(Pasaporte[,11])=="numeric"){
        if(all(Pasaporte[,11]<90,na.rm=TRUE) & all(Pasaporte[,11]> -90,na.rm=TRUE)){
          write("DECLATITUDE values are OK", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores DECLATITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      
      #Hay problemas
      if(!fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,11])!="numeric"){
          for(i in 1:length(Pasaporte[,11])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,11]))
            if (aaa< -90|aaa>90|is.na(aaa)){
              if(!is.na(Pasaporte[i,11])){
                write(paste("DECLATITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,11])=="numeric"){
          for(i in 1:length(Pasaporte[,11])){
            if((Pasaporte[i,11]>90 | Pasaporte[i,11]< -90) & !is.na(Pasaporte[i,11])){
              if(!is.na(Pasaporte[i,11])){
                write(paste("DECLATITUDE value in position ", paste(i)," exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
      }
      if(fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,11])!="numeric"){
          for(i in 1:length(Pasaporte[,11])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,11]))
            if (aaa< -90|aaa>90|is.na(aaa)){
              if(!is.na(Pasaporte[i,11])){
                write(paste("DECLATITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLATITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,11]<-NA
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,11])=="numeric"){
          for(i in 1:length(Pasaporte[,11])){
            if((Pasaporte[i,11]>90 | Pasaporte[i,11]< -90) & !is.na(Pasaporte[i,11])){
              if(!is.na(Pasaporte[i,11])){
                write(paste("DECLATITUDE value in position ", paste(i)," exceeds valid values (from -90 to 90). The invalid value detected was: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -90 a 90). Valor detectado: ",paste(Pasaporte[i,11]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLATITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,11]<-NA
            }
          }
        }
      }
    }
  }
  
  
  #DECLONGITUDE
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,12])=="logical"){
    if(all(is.na(Pasaporte[,12]))){
      write("Warning! all your DECLONGITUDE values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores DECLONGITUDE son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,12])!="logical"){
    if(!all(is.na(Pasaporte[,12]))){
      #No hay problemas evidentes
      if(class(Pasaporte[,12])=="numeric"){
        if(all(paste(Pasaporte[,12])<180,na.rm=TRUE) & all(paste(Pasaporte[,12])> -180,na.rm=TRUE)){
          write("DECLONGITUDE values are OK", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores DECLONGITUDE son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      
      #Hay problemas
      if(!fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,12])!="numeric"){
          for(i in 1:length(Pasaporte[,12])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,12]))
            if (aaa< -180|aaa>180|is.na(aaa)){
              if(!is.na(Pasaporte[i,12])){
                write(paste("DECLONGITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,12])=="numeric"){
          for(i in 1:length(Pasaporte[,12])){
            if((Pasaporte[i,12]>180 | Pasaporte[i,12]< -180) & !is.na(Pasaporte[i,12])){
              if(!is.na(Pasaporte[i,12])){
                write(paste("DECLONGITUDE value in position ", paste(i)," exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
      }
      if(fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,12])!="numeric"){
          for(i in 1:length(Pasaporte[,12])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,12]))
            if (aaa< -180|aaa>180|is.na(aaa)){
              if(!is.na(Pasaporte[i,12])){
                write(paste("DECLONGITUDE value in position ", paste(i)," has not a valid format or exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,12]<-NA
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,12])=="numeric"){
          for(i in 1:length(Pasaporte[,12])){
            if((Pasaporte[i,12]>180 | Pasaporte[i,12]< -180) & !is.na(Pasaporte[i,12])){
              if(!is.na(Pasaporte[i,12])){
                write(paste("DECLONGITUDE value in position ", paste(i)," exceeds valid values (from -180 to 180). The invalid value detected was: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," excede los valores permitidos (de -180 a 180). Valor detectado: ",paste(Pasaporte[i,12]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("DECLONGITUDE value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor DECLONGITUDE en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,12]<-NA
            }
          }
        }
      }
    }
  }
  
  #SAMPSTAT
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("D. SAMPSTAT field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("D. Campo SAMPSTAT", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  
  if(class(Pasaporte[,14])=="logical"){
    if(all(is.na(Pasaporte[,14]))){
      write("Warning! all your SAMPSTAT values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores SAMPSTAT son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,14])!="logical"){
    if(!all(is.na(Pasaporte[,14]))){
      #SAMPSTAT        
      sampstat<-nchar(paste(Pasaporte[,14]), type = "chars", allowNA = TRUE)
      #Aparentemente mal
      if((class(Pasaporte[,14])!="numeric"&class(Pasaporte[,14])!="integer")|any(sampstat!=3,na.rm=TRUE)){
        if(!fixthem){
          write("SAMPSTAT field contains any non-valid values, please check the follow list of errors and correct them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo SAMPSTAT contiene valores no v?lidos, por favor verifique la siguiente lista de errores y corr?jalos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,14])){
            if(!is.na(Pasaporte[i,14])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,14],1,sampstat[i])))
              if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
        if(fixthem){
          write("SAMPSTAT field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          for(i in 1:length(Pasaporte[,14])){
            if(!is.na(Pasaporte[i,14])){
              aaa<-as.numeric(paste(substr(Pasaporte[i,14],1,sampstat[i])))
              if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("SAMPSTAT value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                Pasaporte[i,14]<-NA
              }
            }
          }
        }  
      }
      
      #Aparentemente bien
      if((class(Pasaporte[,14])=="numeric"|class(Pasaporte[,14])=="integer")&all(sampstat==3,na.rm=TRUE)){
        if(!fixthem){
          if(all(Pasaporte[,14]==100|Pasaporte[,14]==110|Pasaporte[,14]==120|Pasaporte[,14]==200|Pasaporte[,14]==300|Pasaporte[,14]==400|Pasaporte[,14]==410|Pasaporte[,14]==411|Pasaporte[,14]==412|Pasaporte[,14]==413|Pasaporte[,14]==414|Pasaporte[,14]==415|Pasaporte[,14]==420|Pasaporte[,14]==500|Pasaporte[,14]==999,na.rm=TRUE)){
            write("SAMPSTAT values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores SAMPSTAT son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,14]==100|Pasaporte[,14]==110|Pasaporte[,14]==120|Pasaporte[,14]==200|Pasaporte[,14]==300|Pasaporte[,14]==400|Pasaporte[,14]==410|Pasaporte[,14]==411|Pasaporte[,14]==412|Pasaporte[,14]==413|Pasaporte[,14]==414|Pasaporte[,14]==415|Pasaporte[,14]==420|Pasaporte[,14]==500|Pasaporte[,14]==999,na.rm=TRUE)){
            write("SAMPSTAT field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,14])){
              if(!is.na(Pasaporte[i,14])){
                aaa<-as.numeric(paste(substr(Pasaporte[i,14],1,sampstat[i])))
                if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                  write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                }
              }
            }
          }
        }
        if(fixthem){
          if(all(Pasaporte[,14]==100|Pasaporte[,14]==110|Pasaporte[,14]==120|Pasaporte[,14]==200|Pasaporte[,14]==300|Pasaporte[,14]==400|Pasaporte[,14]==410|Pasaporte[,14]==411|Pasaporte[,14]==412|Pasaporte[,14]==413|Pasaporte[,14]==414|Pasaporte[,14]==415|Pasaporte[,14]==420|Pasaporte[,14]==500|Pasaporte[,14]==999,na.rm=TRUE)){
            write("SAMPSTAT values are Ok", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("Los valores SAMPSTAT son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }
          if(!all(Pasaporte[,14]==100|Pasaporte[,14]==110|Pasaporte[,14]==120|Pasaporte[,14]==200|Pasaporte[,14]==300|Pasaporte[,14]==400|Pasaporte[,14]==410|Pasaporte[,14]==411|Pasaporte[,14]==412|Pasaporte[,14]==413|Pasaporte[,14]==414|Pasaporte[,14]==415|Pasaporte[,14]==420|Pasaporte[,14]==500|Pasaporte[,14]==999,na.rm=TRUE)){
            write("SAMPSTAT field contains any non-valid values which will be converted in NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write("El campo SAMPSTAT contiene valores no v?lidos los cuales ser?n convertidos en NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            for(i in 1:length(Pasaporte[,14])){
              if(!is.na(Pasaporte[i,14])){
                aaa<-as.numeric(paste(substr(Pasaporte[i,14],1,sampstat[i])))
                if(!((aaa==100|aaa==110|aaa==120|aaa==200|aaa==300|aaa==400|aaa==410|aaa==411|aaa==412|aaa==413|aaa==414|aaa==415|aaa==420|aaa==500|aaa==999)&!is.na(aaa))){
                  write(paste("SAMPSTAT value in position ", paste(i)," has a non-valid code, in this case: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," tiene un c?digo no v?lido, en este caso: '",paste(substr(Pasaporte[i,14],1,sampstat[i])),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("SAMPSTAT value in position ", paste(i)," has been changed by NA value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  write(paste("El valor SAMPSTAT en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                  Pasaporte[i,14]<-NA
                }
              }
            }
          }
        }
      }
    }
  }
  
  #GEOQUAL
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("E. TOTALQUAL100 field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("E. Campo TOTALQUAL100", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(class(Pasaporte[,15])=="logical"){
    if(all(is.na(Pasaporte[,15]))){
      write("Warning! all your TOTALQUAL100 values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores TOTALQUAL100 son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(class(Pasaporte[,15])!="logical"){
    if(!all(is.na(Pasaporte[,15]))){
      #No hay problemas evidentes
      if(class(Pasaporte[,15])=="numeric"|class(Pasaporte[,15])=="integer"){
        if(all(Pasaporte[,15]<=100,na.rm=TRUE) & all(Pasaporte[,15]>=0,na.rm=TRUE)){
          write("TOTALQUAL100 values are OK", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write("Los valores TOTALQUAL100 son correctos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
      #Hay problemas
      if(!fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,15])!="numeric"&class(Pasaporte[,15])!="integer"){
          for(i in 1:length(Pasaporte[,15])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,15]))
            if (aaa< -0|aaa>100|is.na(aaa)){
              if(!is.na(Pasaporte[i,15])){
                write(paste("TOTALQUAL100 value in position ", paste(i)," has not a valid format or exceeds valid values (from 0 to 100). The invalid value detected was: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100 en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de 0 a 100). Valor detectado: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,15])=="numeric"|class(Pasaporte[,15])=="integer"){
          for(i in 1:length(Pasaporte[,15])){
            if((Pasaporte[i,15]>100 | Pasaporte[i,15]< 0) & !is.na(Pasaporte[i,15])){
              if(!is.na(Pasaporte[i,15])){
                write(paste("TOTALQUAL100 value in position ", paste(i)," exceeds valid values (from 0 to 100). The invalid value detected was: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100 en la posici?n ", paste(i)," excede los valores permitidos (de 0 a 100). Valor detectado: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
            }
          }
        }
      }
      if(fixthem){
        #Columna en clase incorrecta
        if(class(Pasaporte[,15])!="numeric"&class(Pasaporte[,15])!="integer"){
          for(i in 1:length(Pasaporte[,15])){  
            #Valores fuera de rangos
            aaa<-as.numeric(paste(Pasaporte[i,15]))
            if (aaa< 0|aaa>100|is.na(aaa)){
              if(!is.na(Pasaporte[i,15])){
                write(paste("TOTALQUAL100 value in position ", paste(i)," has not a valid format or exceeds valid values (from 0 to 100). The invalid value detected was: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100 en la posici?n ", paste(i)," no tiene un formato v?lido o excede los valores permitidos (de 0 a 100). Valor detectado: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("TOTALQUAL100 value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100L en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,15]<-NA
            } 
          }
        }
        #Columna en clase correcta
        if(class(Pasaporte[,15])=="numeric"|class(Pasaporte[,15])=="integer"){
          for(i in 1:length(Pasaporte[,15])){
            if((Pasaporte[i,15]>100 | Pasaporte[i,15]< 0) & !is.na(Pasaporte[i,15])){
              if(!is.na(Pasaporte[i,15])){
                write(paste("TOTALQUAL100 value in position ", paste(i)," exceeds valid values (from 0 to 100). The invalid value detected was: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100 en la posici?n ", paste(i)," excede los valores permitidos (de 0 a 100). Valor detectado: ",paste(Pasaporte[i,15]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("TOTALQUAL100 value in position ", paste(i)," has been switched by NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
                write(paste("El valor TOTALQUAL100 en la posici?n ", paste(i)," ha sido cambiado por el valor NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              }
              Pasaporte[i,15]<-NA
            }
          }
        }
      }
    }
  }
  if(fixthem){
    write.table(Pasaporte,file="Pasaporte/FuentesExt_ExtSources_corr.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(Pasaporte,file="Pasaporte/FuentesExt_ExtSources_corr.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  ####END_FIN!############
}


#####################################################################################
#########Tabla Fenotipo######################################################
#####################################################################################

setwd(paste(ruta))
if(tiptable=="Fenotipo"){
  #introducci?n datos pasaporte
  Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
  
  ######1######
  #Dimensiones#
  #############
  #revisi?n de dimensiones por columnas
  write("__Part1/parte1: Dimension/Dimensi?n____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(ncol(Pasaporte)!=nmark+1){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Phenotype' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Fenotipo'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has no the expected columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla no tiene el n?mero de columnas/variables/marcadores esperadas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("The table has ", paste(ncol(Pasaporte)-1)," columns/variables/markers (regardless ACCENUMB)",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("La tabla tiene ", paste(ncol(Pasaporte)-1)," columnas/variables/marcadores (sin considerar ACCENUMB",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  } 
  if(ncol(Pasaporte)==nmark+1){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Phenotype' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a tabla de 'Fenotipo'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has the expected number of columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla tiene el n?mero esperado de columnas/variables/marcadores esperadas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(fixthem){
    if(ncol(Pasaporte)!=nmark+1){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Your table has been resized, in case it exceeds the expected number of columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Su tabla ha sido reducida en n?mero de columnas/variables/marcadores si ?stas exceden el n?mero esperado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte<-Pasaporte[,1:nmark+1] 
    }
  }
  
  ######2#########
  #Filas fantasma#
  ################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part2/parte2:Ghost rows/Filas fantasma____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #revisi?n de dimensiones por filas
  if(access!=nrow(Pasaporte)){
    write("The number of expected rows does not match with the number of rows from your table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero esperado de filas no concuerda con el n?mero de filas de su tabla", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(all(lastrow=="1"|lastrow=="NA")){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because (at least) the last row contains only NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues (al menos) la ?ltima fila solo contiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(access==nrow(Pasaporte)){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(!all(lastrow=="1"|lastrow=="NA")){
      write(paste("There is no evidence the table '",paste(pasaporte),"' has 'ghost' rows",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("No hay eviodencias de que la tabla '",paste(pasaporte),"' tenga filas 'fantasma'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  #Eliminaci?n de filas fantasmas por eliminaci?n de NA en ID
  if(fixthem){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    if(is.na(lastrow[1,1])){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because ACCENUMB field contains NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues campo ACCENUMB tiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for (i in nrow(Pasaporte):1){
        lastrow<-nrow(Pasaporte)
        lastrow<-Pasaporte[paste(lastrow),]
        if(is.na(lastrow[1,1])){
          write(paste("The row ",paste(i)," seems to be a ghost row", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La fila ",paste(i)," parece ser una fila fantasma", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte<-Pasaporte[(-1*i),]
        } 
      }
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("All the 'ghost' rows were deleted", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Todas las filas 'fantasma' fueron eliminadas", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
    }
  }
  ########3#########
  #Celdas en blanco#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part3/parte3:Blank cells/Celdas en blanco____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }  
        }
      }
    }      
  }
  if(fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            Pasaporte[j,i]<-NA
          }  
        }
      }
    }
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Any blank cell detected was filled with NA value", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Cualquier celda vac?a detectada fue rellenada con valor NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  
  #############4###############
  #Requerimientos de cada campo#
  ##############################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part4/parte4:Specific field requirements/Requerimientos especiales de algunos campos____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  
  #ACCENUMB
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. ACCENUMB field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. Campo ACCENUMB", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  if(fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          Pasaporte$ACCENUMB<-as.character(Pasaporte$ACCENUMB)
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte[i,1]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB row value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la posici?n/fila de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  #Identificaci?n de valores NA en ACCENUMB
  accenumb<-unique(Pasaporte$ACCENUMB)
  if(any(is.na(accenumb))){
    if(!fixthem){
      write("ACCENUMB field contains some NA values - please replace them because it is going to produce bugs in tools", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, por favor reempl?celos pues de lo contrario ocasionar?n errores en las herramientas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write("ACCENUMB field contains some NA values - this values will be replaced by 'ACCENUMB' code plus the position number", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, estos valores ser?n reemplazados por el c?digo 'ACCENUMB' m?s el valor de posici?n", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for(i in 1:length(Pasaporte$ACCENUMB)){
        if(is.na(Pasaporte$ACCENUMB[i])){
          Pasaporte$ACCENUMB<-as.character(Pasaporte$ACCENUMB)
          Pasaporte[i,1]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB 'NA' value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor 'NA' en la posici?n de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Variable/marker fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Campos de Variables/marcadores", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  columnas<-list()
  for (i in 2:ncol(Pasaporte)){
    columnas[[i]]<-class(Pasaporte[,i])
  }
  columnas<-do.call("rbind",columnas)
  if(all(columnas=="logical")){
    if(all(is.na(Pasaporte[,2:columnas]))){
      write("Warning! all your phenotypic values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores fenot?picos son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }  
  }
  if(all(columnas=="numeric"|columnas=="integer")){
    write("All your fields in 'Phenotypic' table are Ok - they correspond to numeric or integer fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Todos los campos en su tabla 'Fenot?pica' est?n correctos, corresponden a campos num?ricos o de valores integrales", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(!fixthem){
    error<-which(columnas!="numeric"&columnas!="integer")
    error1<-colnames(Pasaporte[,error+1])
    if(!all(columnas=="numeric"|columnas=="integer")){
      for (i in 1:length(error)){
        write(paste("The variable/marker ", paste(error1[i])," has no numeric values, please check it", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("La variable marcador ", paste(error1[i])," tiene valores no num?ricos, por favor rev?selo", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    for (i in 2:ncol(Pasaporte)){
      for (j in 1:nrow(Pasaporte)){
        aaa<-substr(Pasaporte[j,i],1,1)
        if(!any(aaa==c(0:9))&!is.na(aaa)){
          write(paste("The variable/marker ", paste(colnames(Pasaporte[i]))," in its row ", paste(j)," has no valid value: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La variable marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," tiene un valor no v?lido: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  if(fixthem){
    error<-which(columnas!="numeric"&columnas!="integer")
    error1<-colnames(Pasaporte[,error+1])
    if(!all(columnas=="numeric"|columnas=="integer")){
      for (i in 1:length(error)){
        write(paste("The variable/marker ", paste(error1[i])," has no numeric values, please check it", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("La variable marcador ", paste(error1[i])," tiene valores no num?ricos, por favor rev?selo", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    for (i in 2:ncol(Pasaporte)){
      for (j in 1:nrow(Pasaporte)){
        aaa<-substr(Pasaporte[j,i],1,1)
        if(!any(aaa==c(0:9))&!is.na(aaa)){
          write(paste("The variable/marker ", paste(colnames(Pasaporte[i]))," in its row ", paste(j)," has no valid value: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La variable marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," tiene un valor no v?lido: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
          write(paste("The value for the variable/marker ", paste(colnames(Pasaporte[i]))," and row ", paste(j)," was replaced by NA ", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la variable/marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," fue reemplazado por NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
          Pasaporte[j,i]<-NA
        }
      }
    }
  }
  if(fixthem){
    write.table(Pasaporte,file="Pasaporte/Fenotipo_Phenotype_corr.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(Pasaporte,file="Pasaporte/Fenotipo_Phenotype_corr.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  ####END_FIN!############
}

#####################################################################################
#########Tabla Genotipo######################################################
#####################################################################################

if(tiptable=="Genotipo"){
  #introducci?n datos pasaporte
  Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
  
  ######1######
  #Dimensiones#
  #############
  #revisi?n de dimensiones por columnas
  write("__Part1/parte1: Dimension/Dimensi?n____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(ncol(Pasaporte)!=nmark+1){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Genotype' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Genotipo'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has no the expected columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla no tiene el n?mero de columnas/variables/marcadores esperadas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("The table has ", paste(ncol(Pasaporte)-1)," columns/variables/markers (regardless ACCENUMB)",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("La tabla tiene ", paste(ncol(Pasaporte)-1)," columnas/variables/marcadores (sin considerar ACCENUMB)",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  } 
  if(ncol(Pasaporte)==nmark+1){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Genotype' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a tabla de 'Genotipo'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has the expected number of columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla tiene el n?mero esperado de columnas/variables/marcadores esperadas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(fixthem){
    if(ncol(Pasaporte)!=nmark+1){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Your table has been resized, in case it exceeds the expected number of columns/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Su tabla ha sido reducida en n?mero de columnas/variables/marcadores si ?stas exceden el n?mero esperado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte<-Pasaporte[,1:nmark+1] 
    }
  }
  
  ######2#########
  #Filas fantasma#
  ################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part2/parte2:Ghost rows/Filas fantasma____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #revisi?n de dimensiones por filas
  if(access!=nrow(Pasaporte)){
    write("The number of expected rows does not match with the number of rows from your table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero esperado de filas no concuerda con el n?mero de filas de su tabla", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(all(lastrow=="1"|lastrow=="NA")){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because (at least) the last row contains only NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues (al menos) la ?ltima fila solo contiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(access==nrow(Pasaporte)){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(!all(lastrow=="1"|lastrow=="NA")){
      write(paste("There is no evidence the table '",paste(pasaporte),"' has 'ghost' rows",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("No hay eviodencias de que la tabla '",paste(pasaporte),"' tenga filas 'fantasma'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  #Eliminaci?n de filas fantasmas por eliminaci?n de NA en ACCENUMB
  if(fixthem){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    if(is.na(lastrow[1,1])){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because ACCENUMB field contains NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues campo ACCENUMB tiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for (i in nrow(Pasaporte):1){
        lastrow<-nrow(Pasaporte)
        lastrow<-Pasaporte[paste(lastrow),]
        if(is.na(lastrow[1,1])){
          write(paste("The row ",paste(i)," seems to be a ghost row", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La fila ",paste(i)," parece ser una fila fantasma", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte<-Pasaporte[(-1*i),]
        } 
      }
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("All the 'ghost' rows were deleted", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Todas las filas 'fantasma' fueron eliminadas", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
    }
  }
  ########3#########
  #Celdas en blanco#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part3/parte3:Blank cells/Celdas en blanco____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    if(all(Pasaporte[,]!="",na.rm=TRUE)){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(!all(Pasaporte[,]!="",na.rm=TRUE)){
      for(i in 1:ncol(Pasaporte)){
        for(j in 1:nrow(Pasaporte)){
          if(!is.na(Pasaporte[j,i])){
            if(Pasaporte[j,i]==""){
              write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            }  
          }
        }
      }  
    }   
  }
  if(fixthem){
    if(all(Pasaporte[,]!="",na.rm=TRUE)){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(!all(Pasaporte[,]!="",na.rm=TRUE)){
      for(i in 1:ncol(Pasaporte)){
        for(j in 1:nrow(Pasaporte)){
          if(!is.na(Pasaporte[j,i])){
            if(Pasaporte[j,i]==""){
              write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
              Pasaporte[j,i]<-NA
            }  
          }
        }
      }
    }
    
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Any blank cell detected was filled with NA value", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Cualquier celda vac?a detectada fue rellenada con valor NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  #############4###############
  #Requerimientos de cada campo#
  ##############################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part4/parte4:Specific field requirements/Requerimientos especiales de algunos campos____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)

  
  #ACCENUMB
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. ACCENUMB field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. Campo ACCENUMB", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  if(fixthem){
    accenumb<-unique(Pasaporte$ACCENUMB)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ACCENUMB field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ACCENUMB field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ACCENUMB)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ACCENUMB row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ACCENUMB ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte[i,1]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB row value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la posici?n/fila de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  #Identificaci?n de valores NA en ACCENUMB
  accenumb<-unique(Pasaporte$ACCENUMB)
  if(any(is.na(accenumb))){
    if(!fixthem){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB field contains some NA values - please replace them because it is going to produce bugs in tools", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, por favor reempl?celos pues de lo contrario ocasionar?n errores en las herramientas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB field contains some NA values - this values will be replaced by 'ACCENUMB' code plus the position number", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ACCENUMB contiene valores NA, estos valores ser?n reemplazados por el c?digo 'ACCENUMB' m?s el valor de posici?n", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for(i in 1:length(Pasaporte$ACCENUMB)){
        if(is.na(Pasaporte$ACCENUMB[i])){
          Pasaporte[i,1]<-paste("ACCENUMB",i,sep="")
          write(paste("ACCENUMB 'NA' value at position ", paste(i)," was replaced by 'ACCENUMB' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor 'NA' en la posici?n de ACCENUMB ", paste(i)," fue reemplazado por 'ACCENUMB' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Variable/marker fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Campos de Variables/marcadores", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  columnas<-list()
  for (i in 2:ncol(Pasaporte)){
    columnas[[i]]<-class(Pasaporte[,i])
  }
  columnas<-do.call("rbind",columnas)
  if(all(columnas=="logical")){
    if(all(is.na(Pasaporte[,2:columnas]))){
      write("Warning! all your genotypic values are NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Precauci?n! todos sus valores Genot?picos son NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }  
  }
  if(all(columnas=="numeric"|columnas=="integer")){
    write("All your fields in 'Genotypic' table are Ok - they correspond to numeric or integer fields", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Todos los campos en su tabla 'Genot?pica' est?n correctos, corresponden a campos num?ricos o de valores integrales", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(!fixthem){
    error<-which(columnas!="numeric"&columnas!="integer")
    error1<-colnames(Pasaporte[,error+1])
    if(!all(columnas=="numeric"|columnas=="integer")){
      for (i in 1:length(error)){
        write(paste("The variable/marker ", paste(error1[i])," has no numeric values, please check it", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("La variable marcador ", paste(error1[i])," tiene valores no num?ricos, por favor rev?selo", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    for (i in 2:ncol(Pasaporte)){
      for (j in 1:nrow(Pasaporte)){
        if(Pasaporte[j,i]!=1&Pasaporte[j,i]!=0&!is.na(Pasaporte[j,i])){
          write(paste("The variable/marker ", paste(colnames(Pasaporte[i]))," in its row ", paste(j)," has no valid value: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La variable marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," tiene un valor no v?lido: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
          
        }
      }
    }
  }
  if(fixthem){
    error<-which(columnas!="numeric"&columnas!="integer")
    error1<-colnames(Pasaporte[,error+1])
    if(!all(columnas=="numeric"|columnas=="integer")){
      for (i in 1:length(error)){
        write(paste("The variable/marker ", paste(error1[i])," has no numeric values, please check it", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("La variable marcador ", paste(error1[i])," tiene valores no num?ricos, por favor rev?selo", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    for (i in 2:ncol(Pasaporte)){
      for (j in 1:nrow(Pasaporte)){
        if(Pasaporte[j,i]!=1&Pasaporte[j,i]!=0&!is.na(Pasaporte[j,i])){
          write(paste("The variable/marker ", paste(colnames(Pasaporte[i]))," in its row ", paste(j)," has no valid value: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La variable marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," tiene un valor no v?lido: ", paste(Pasaporte[j,i]), sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
          write(paste("The value for the variable/marker ", paste(colnames(Pasaporte[i]))," and row ", paste(j)," was replaced by NA ", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la variable/marcador ", paste(colnames(Pasaporte[i]))," en su fila ", paste(j)," fue reemplazado por NA", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
          Pasaporte[j,i]<-NA
        }
      }
    }
  }
  if(fixthem){
    write.table(Pasaporte,file="Pasaporte/Genotipo_Genotype_corr.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(Pasaporte,file="Pasaporte/Genotipo_Genotype_corr.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  ####END_FIN!############
}

#####################################################################################
#########Tabla Naturaleza variables######################################################
#####################################################################################

setwd(paste(ruta))
if(tiptable=="NaturalezaVariables"){
  #introducci?n datos pasaporte
  Pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
  
  ######1######
  #Dimensiones#
  #############
  #revisi?n de dimensiones por columnas
  write("__Part1/parte1: Dimension/Dimensi?n____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(nrow(Pasaporte)!=nmark){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Variable type' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Naturaleza de Variables'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has no the expected rows/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla no tiene el n?mero de filas/variables/marcadores esperadas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("The table has ", paste(nrow(Pasaporte))," rows/variables/markers in the ID field",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("La tabla tiene ", paste(nrow(Pasaporte))," rows/variables/marcadores en el campo ID",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  } 
  if(nrow(Pasaporte)==nmark){
    write(paste("According to you, the table '",paste(pasaporte),"' is a 'Variable type' table",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste("De acuerdo a su informaci?n la tabla '",paste(pasaporte),"' corresponde a 'Naturaleza de Variables'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has the expected number of rows/variables/markers", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla tiene el n?mero esperado de filas/variables/marcadores", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(fixthem){
    if(nrow(Pasaporte)!=nmark){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Your table has been resized to achieve the expected number of rows/variables/markers (",paste(nmark),")",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Su tabla ha sido reducida en n?mero de filas/variables/marcadores si ?stas exceden el n?mero esperado (",paste(nmark),")",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte<-Pasaporte[1:nmark,] 
    }
  }
  if(ncol(Pasaporte)==3){
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("The table has the expected number of columns", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La tabla tiene el n?mero esperado de columnas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(ncol(Pasaporte)!=3){
    if(!fixthem){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns in the ID field. This is not the right number",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas en el campo ID. Este no es el n?mero correcto",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("The table has ", paste(ncol(Pasaporte))," columns in the ID field. This is not the right number",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla tiene ", paste(ncol(Pasaporte))," columnas en el campo ID. Este no es el n?mero correcto",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte<-Pasaporte[,1:3]
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Your table has been resized to achieve the expected number of columns (3)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Su tabla ha sido reducida en n?mero de columnas hasta alcanzar el n?mero esperado (3)", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  ######2#########
  #Filas fantasma#
  ################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part2/parte2:Ghost rows/Filas fantasma____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #revisi?n de dimensiones por filas
  if(nmark!=nrow(Pasaporte)){
    write("The number of expected rows does not match with the number of rows from your table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El n?mero esperado de filas no concuerda con el n?mero de filas de su tabla", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(all(lastrow=="1"|lastrow=="NA")){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because (at least) the last row contains only NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues (al menos) la ?ltima fila solo contiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  if(nmark==nrow(Pasaporte)){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    lastrow<-unique(paste(lastrow[1,]))
    if(!all(lastrow=="1"|lastrow=="NA")){
      write(paste("There is no evidence the table '",paste(pasaporte),"' has 'ghost' rows",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("No hay eviodencias de que la tabla '",paste(pasaporte),"' tenga filas 'fantasma'",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
  }
  
  #Eliminaci?n de filas fantasmas por eliminaci?n de NA en ACCENUMB
  if(fixthem){
    lastrow<-nrow(Pasaporte)
    lastrow<-Pasaporte[paste(lastrow),]
    if(is.na(lastrow[1,1])){
      write(paste("The table '",paste(pasaporte),"' has 'ghost' rows because ID field contains NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("La tabla '",paste(pasaporte),"' tiene filas 'fantasmas' pues campo ID tiene NAs",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for (i in nrow(Pasaporte):1){
        lastrow<-nrow(Pasaporte)
        lastrow<-Pasaporte[paste(lastrow),]
        if(is.na(lastrow[1,1])){
          write(paste("The row ",paste(i)," seems to be a ghost row", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La fila ",paste(i)," parece ser una fila fantasma", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte<-Pasaporte[(-1*i),]
        } 
      }
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("All the 'ghost' rows were deleted", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste("Todas las filas 'fantasma' fueron eliminadas", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
    }
  }
  ########3#########
  #Celdas en blanco#
  ##################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part3/parte3:Blank cells/Celdas en blanco____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          }  
        }
      }
    }      
  }
  if(fixthem){
    if(all(is.na(Pasaporte[,])|Pasaporte[,]!="")){
      write("No blank cell has been detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("Ninguna celda vac?a fue detectada", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    for(i in 1:ncol(Pasaporte)){
      for(j in 1:nrow(Pasaporte)){
        if(!is.na(Pasaporte[j,i])){
          if(Pasaporte[j,i]==""){
            write(paste("A blank cell has been detected at column ",paste(colnames(Pasaporte[i]))," row ",paste(j)," position",sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            write(paste("Una celda vac?a fue detectada en la columna ",paste(colnames(Pasaporte[i]))," y fila ",paste(j),sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
            Pasaporte[j,i]<-NA
          }  
        }
      }
    }
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Any blank cell detected was filled with NA value", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("Cualquier celda vac?a detectada fue rellenada con valor NA", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  #############4###############
  #Requerimientos de cada campo#
  ##############################
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("__Part4/parte4:Specific field requirements/Requerimientos especiales de algunos campos____", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  #ID
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. ID field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("A. Campo ID", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(!fixthem){
    accenumb<-unique(Pasaporte$ID)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ID field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ID field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      accenumb1<-duplicated(Pasaporte$ID)
      accedupli<-vector()
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ID row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ID ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  if(fixthem){
    accenumb<-unique(Pasaporte$ID)
    if(length(accenumb)==nrow(Pasaporte)){
      write("ID field is Ok - No duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID esta Ok - Ning?n duplicado fue detectado", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(length(accenumb)!=nrow(Pasaporte)){
      write("ID field has errors: duplicates were detected", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID con error - Duplicados fueron detectados", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      Pasaporte$ID<-as.character(Pasaporte$ID)
      accenumb1<-duplicated(Pasaporte$ID)
      for(i in 1:length(accenumb1)){
        if(accenumb1[i]){
          write(paste("ID row position ", paste(i)," is a duplicated value", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("La posici?n/fila en ID ", paste(i)," es un duplicado", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          Pasaporte[i,1]<-paste("ID",i,sep="")
          write(paste("ID row value at position ", paste(i)," was replaced by 'ID' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor en la posici?n/fila de ID ", paste(i)," fue reemplazado por 'ID' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        }
      }
    }
  }
  #Identificaci?n de valores NA en ACCENUMB
  accenumb<-unique(Pasaporte$ID)
  if(any(is.na(accenumb))){
    if(!fixthem){
      write("ID field contains some NA values - please replace them because it is going to produce bugs in tools", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID contiene valores NA, por favor reempl?celos pues de lo contrario ocasionar?n errores en las herramientas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    }
    if(fixthem){
      write("ID field contains some NA values - this values will be replaced by 'ID' code plus the position number", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("ID contiene valores NA, estos valores ser?n reemplazados por el c?digo 'ID' m?s el valor de posici?n", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      for(i in 1:length(Pasaporte$ID)){
        if(is.na(Pasaporte$ID[i])){
          Pasaporte[i,1]<-paste("ID",i,sep="")
          write(paste("ID 'NA' value at position ", paste(i)," was replaced by 'ID' code plus the position number", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
          write(paste("El valor 'NA' en la posici?n de ID ", paste(i)," fue reemplazado por 'ID' m?s el valor de posici?n", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE) 
        }
      }
    }
  }
  
  #NOMVAR
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. NOMVAR field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("B. Campo NOMVAR", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  phenot<-read.delim(paste("Pasaporte/",phenot,sep=""))
  phenovar<-colnames(phenot[-1])
  aaa<-list()
  for(i in 1:length(Pasaporte$NOMVAR)){
    if(Pasaporte$NOMVAR[i]!=phenovar[i]|is.na(Pasaporte$NOMVAR[i])){
      aaa[[i]]<-"ERROR"
    }
    if(Pasaporte$NOMVAR[i]==phenovar[i]&!is.na(Pasaporte$NOMVAR[i])){
      aaa[[i]]<-"OK"
    }
  }
  aaa<-do.call("rbind",aaa)
  if(all(aaa=="OK")){
    write("NOMVAR list of variables is ok and it matches with list of variables from 'Phenotype' table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La lista de variables en NOMVAR es correcta y concuerda con las variables de la tabla 'Fenotipo'", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(!all(aaa=="OK")){
    write("NOMVAR list of variables has some values that does not match with list of variables from 'Phenotype' table", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La lista de variables en NOMVAR tiene algunso valores que no concuerdan con las variables de la tabla 'Fenotipo'", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(!fixthem){
    for(i in 1:length(Pasaporte$NOMVAR)){
      if(Pasaporte$NOMVAR[i]!=phenovar[i]|is.na(Pasaporte$NOMVAR[i])){
        write(paste("NOMVAR value at position/row ", paste(i)," does not match with the corresponding variable name in 'phenotype' table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("El valor en la posici?n/fila de NOMVAR ", paste(i)," no concuerda con su nombre de variable correspondiente en la tabla 'Fenotipo'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
  }
  if(fixthem){
    for(i in 1:length(Pasaporte$NOMVAR)){
      if(Pasaporte$NOMVAR[i]!=phenovar[i]|is.na(Pasaporte$NOMVAR[i])){
        write(paste("NOMVAR value at position/row ", paste(i)," does not match with the corresponding variable name in 'phenotype' table", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("El valor en la posici?n/fila de NOMVAR ", paste(i)," no concuerda con su nombre de variable correspondiente en la tabla 'Fenotipo'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    if(any(aaa=="ERROR")){
      write("NOMVAR list of variables has been replaced by'Phenotype' table variables", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      write("La lista de variables en NOMVAR ha sido reemplazada por la lista de variables de la tabla 'Fenotipo'", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      error<-which(aaa=="ERROR")
      if(class(Pasaporte$NOMVAR)=="factor"){
        levels(Pasaporte$NOMVAR)<-c(levels(Pasaporte$NOMVAR),phenovar[error])
      }
      Pasaporte$NOMVAR[error]<-phenovar[error]
    }
  }
  
  #NATVAR
  #Identificaci?n de valores duplicados
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. NATVAR field", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write("C. Campo NATVAR", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  
  if(all(Pasaporte$NATVAR[]=="Binario simetrico"|Pasaporte$NATVAR[]=="Binario asimetrico"|Pasaporte$NATVAR[]=="Nominal"|Pasaporte$NATVAR[]=="Ordinal"|Pasaporte$NATVAR[]=="Cuantitativo")&!any(is.na(Pasaporte$NATVAR[]))){
    write("NATVAR list of type of variables is ok, only including valid options", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La lista de tipos de variable en NATVAR es correcta y s?lo incluyen opciones v?lidas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(!all(Pasaporte$NATVAR[]=="Binario simetrico"|Pasaporte$NATVAR[]=="Binario asimetrico"|Pasaporte$NATVAR[]=="Nominal"|Pasaporte$NATVAR[]=="Ordinal"|Pasaporte$NATVAR[]=="Cuantitativo")|any(is.na(Pasaporte$NATVAR[]))){
    write("NATVAR list of type of variables has some non-valid values", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("La lista de tipos de variable en NATVAR es correcta y s?lo incluyen opciones v?lidas", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    for(i in 1:length(Pasaporte$NATVAR)){
      if(Pasaporte$NATVAR[i]!="Binario simetrico"&Pasaporte$NATVAR[i]!="Binario asimetrico"&Pasaporte$NATVAR[i]!="Nominal"&Pasaporte$NATVAR[i]!="Ordinal"&Pasaporte$NATVAR[i]!="Cuantitativo"|is.na(Pasaporte$NATVAR[i])){
        write(paste("NATVAR value at position/row ", paste(i)," does not match with the list of valid values for type of variables, wrong value: '",paste(Pasaporte$NATVAR[i]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
        write(paste("El valor en la posici?n/fila de NATVAR ", paste(i)," no concuerda con ning?n valor valido. El valor es: '",paste(Pasaporte$NATVAR[i]),"'", sep=""), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
      }
    }
    write(paste(), file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("NATVAR field cannot be corrected, user must check all errors detected and correct them", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
    write("El campo NATVAR no puede ser corregido, el usuario debe revisar los errores detectados y corregirlos", file="Pasaporte/TestTableAnalysis.txt", append=TRUE)
  }
  if(fixthem){
    write.table(Pasaporte,file="Pasaporte/NaturalezaVariables_VariableType_corr.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(Pasaporte,file="Pasaporte/NaturalezaVariables_VariableType_corr.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  ####END_FIN!############
}