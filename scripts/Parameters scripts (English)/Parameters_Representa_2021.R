##############################################
#Representa 2021 parameters script
##############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually C:/)

internet<-FALSE
#TRUE or FALSE type parameter
#### Note1: This parameter tells the tool if the user has an internet connection at the time of running the Representa tool.
#### note2: An internet connection is only necessary to import externally-source data of presence from GBIF (gbifFE parameter)

#############################################
#Pasaporte and GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
# Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta"
# Note2: this table has the same structure as other passport tables. It may have already been analyzed using the GEOQUAL tool

geoqual<-TRUE
#TRUE or FALSE type parameter
# Note: Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)

totalqual<-60 #Only applies if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

#############################################
#External sources and GEOQUAL
#############################################

fext<-TRUE
#TRUE or FALSE type parameter
#### Note: In this parameter, the user indicates that they will provide a series of records or presence data from external sources.

fuentex<-"DatosFuentesExternas.txt" #Only applies if fext=TRUE
#Text type parameter (text that goes between quotation marks "")
#### Note1: This parameter indicates the name of the external source table, which must be in the "Pasaporte" folder or path X:/CAPFITOGEN/Pasaporte. The format of this table can be found in the folder with excel formats.
#### Note2: This table must be in text format (.txt) and the extension must be included in the file name.

geoqualfe<-FALSE #Only applies if fext=TRUE
#TRUE or FALSE type parameter
#### Note: Indicate here if the external source table has the GEOQUAL evaluation passport (4 additional variables on the right side of the table?)
#### Note2: To have TOTALQUAL100 values, the information in the geoqualfe table must have been analyzed using the GEOQUAL tool, but GEOQUAL only supports information in passport table format, not external sources. This requires first putting the externally sourced information in a passport table format, evaluating it with GEOQUAL, and then bringing it to the external source format, including the TOTALQUAL100 column.

totalqualfe<-70 #Only applies if geoqualfe=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

duplibg<-TRUE #Only applies if fext=TRUE
#TRUE or FALSE type parameter
#### Note1: This parameter indicates whether records from the external source table that come from genebanks will be considered potential interbank duplicates (TRUE) or not (FALSE).
#### Note2: Setting duplibg=TRUE when all the records in the external source table come from passport banks (TYPESOURCE=40) will generate an error, since all the records in the external source table will be discarded in the representativeness analysis

gbifFE<-FALSE #Only applies if fext=TRUE and internet=TRUE
#TRUE or FALSE type parameter
#### Note: This parameter tells the tool that the user wants to download the presence data as external sources from GBIF (Global Biodiversity Information Facility, http://www.gbif.org)
#### Note2: For gbifFe=TRUE, it is necessary to have an internet connection 

genero<-"Arachis" #Only applies if fext=TRUE and gbifFE=TRUE
#Text type parameter (text that goes between quotation marks "")
#### Note: This parameter indicates for what genera you want to download observation information from GBIF


especie<-"hypogaea" #Only applies if fext=TRUE and gbifFE=TRUE
#Text type parameter (text that goes between quotation marks "")
#### Note1: This parameter indicates for what species (only the epithet) you want to download observation information from GBIF
#### Note2: Together the genus and species parameters configure the taxon for which you want to download information from GBIF.

#############################################
#ELC map
#############################################

mapaelc<-"mapa_elc_ecuador.grd"
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter indicates the name of the ELC map (the one that combines the categories of bioclimatic, edaphic and geophysical components) produced as a result of the ELC mapas tool (it must be in the "CAPFITOGEN3/ELCmapas" folder)
##### Note2: This ELC map file must be located in the path X:/CAPFITOGEN3/ELCmapas (when X is the letter for the Hard Disk unit where the CAPFITOGEN3 folder was located)

statelc<-"Estadist_ELC_ecuador.xls"
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter indicates the name of the statistics table that accompanies the ELC map produced as a result of the ELC mapas tool (it must be in the "CAPFITOGEN3/ELCmapas" folder)
##### Nota2: From CAPFITOGEN3, please use the table file on ELC map statistics with the extension .xls rather than .txt. Sometimes txt tables are not well produced (columns are not tab separated).
##### Note3: This ELC map file must be located in the path X:/CAPFITOGEN3/ELCmapas (when X is the letter for the Hard Disk unit where the CAPFITOGEN3 folder was located)

#############################################
#Duplicate removal
#############################################

distdup<-0
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This numerical parameter indicates the distance threshold under which you consider that two collection sites in fact represent the same population (expressed in km)
##### Note2: A very high number in distdup can significantly reduce the number of accessions in the analysis
#############################################
#Results
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/Representa"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
