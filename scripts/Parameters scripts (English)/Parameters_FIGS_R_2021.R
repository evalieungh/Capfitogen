############################################
#FIGS_R 2021 parameters script
############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

pais<-"Ecuador"
#pais<-"Colombia"
#pais<-"Spain"
#pais<-"United States"
#pais<-"Argentina"
#pais<-"Bolivia"
#pais<-"Brasil"
#pais<-"Chile"
#pais<-"Chile continental"
#pais<-"Canada"
#pais<-"Meso America"
#pais<-"Russia"
#pais<-"South America"
#pais<-"Costa Rica"
#pais<-"World"
#pais<-"user1"
#...... etc.
#Text type parameter (text that goes between quotation marks "")
##### Note: The selected country/region (the first letter usually goes in uppercase as in "Ecuador") must have the corresponding folder (with the name of the country but there it goes in lowercase as in "ecuador") in rdatamaps.
##### Note2: the name of the country must be written as it appears in the lista_paises.xlsx table, and as it appears in the column "Way to write country name (pais parameter)"
##### Note3: If you have previously used the rLayer tool and generated a set of cropped layers according to the individual needs of the user, you can enter here a name defined in the "uname" parameter to use that set of layers
#############################################
#Pasaporte and GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
# Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta"
# Note2: This table has the same structure as other passport tables. it may have already been analyzed using the GEOQUAL tool

geoqual<-TRUE
#TRUE or FALSE type parameter
# Note: Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)

totalqual<-60 #Only applies if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

#############################################
#ELC map
#############################################

controlelc<-TRUE
#TRUE or FALSE type parameter
##### Note1: This parameter indicates the FIGS_R tool if an ELC map previously obtained from the ELCmapas tool will be used. This map would be used to distribute the accessions that will be included in the FIGS subset into different ecogeographic categories.
##### Note2: It is required to locate the ELC map and its statistics table on the path X:/CAPFITOGEN3/ELCmapas(where X is the letter of the Hard Disk unit)

mapaelc<-"mapa_elc_ecuador.grd" #Only applies if controlelc is TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter indicates what the ELC map is called (the one that combines the categories of the bioclimatic, edaphic and geophysical components) produced as a result of the ELC mapas tool (it must be in the "CAPFITOGEN3/ELCmapas" folder)
##### Note2: It is required to locate this ELC map file in the path X:/CAPFITOGEN3/ELCmapas(where X is the letter of the Hard Disk unit)

statelc<-"Estadist_ELC_ecuador.txt" #Only applies if controlelc es TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter indicates the name of the statistics table that accompanies the ELC map produced as a result of the ELC mapas tool (it must be in the "CAPFITOGEN3/ELCmapas" folder)
##### Note2: It is required to locate this ELC map file in the path X:/CAPFITOGEN3/ELCmapas(where X is the letter of the Hard Disk unit) 

#############################################
#Duplicate removal
#############################################

distdup<-0
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This numerical parameter indicates the distance threshold under which you consider that two collection sites in fact represent the same population (expressed in km)
##### Note2: A very high number in distdup can significantly reduce the number of accessions in the analysis

#############################################
#Characteristics of the FIGS subset
#############################################

availab<-FALSE
#TRUE or FALSE type parameter
##### Note1: Do you want to use the AVAILAB (which stands for availability of entry) field of the passport table, to prioritize the selection of entries for the FIGS subset marked as available?
##### Note2: For you to configure the availab=TRUE parameter, the passport table indicated in the "pasaporte" parameter is required to contain a column named AVAILAB, otherwise it will produce an error

soloavailab<-TRUE #Only applies if availab=TRUE
#TRUE or FALSE type parameter
##### Note1: With this parameter you can absolutely restrict the selection to available entries (marked in the AVAILAB column as 1).
##### Note2: Restricting the number of accessions with this parameter is very useful so that the accessions of the FIGS subset are really available, but on the other hand, it may result in leaving very few accessions to select within them.

#############################################
#Ecogeographic
#############################################

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Text type parameter (text that goes between quotation marks "")
###### Note1: This parameter indicates the resolution at which you want to extract ecogeographic information
###### Note2: resol1 means the resolution of the ecogeographic layers that will be used to extract information for each point. resol1 must exist as a "1x1", "5x5", "10x10" or "20x20" folder inside rdatamaps/nombre_pais

buffy<-FALSE
#TRUE or FALSE type parameter
##### Note1: Method of extraction, do you want to include contiguous cells (buffer zone) to calculate the value assigned to each collection site?
##### Note2: selecting buffy=TRUE can slow down the extraction process, since it forces R to extract values for each point (which comes from the coordinates of the records in the passport table) not only from the cell where they fall (simple extraction, when buffy=FALSE) but from adjacent cells, whose values are averaged... that slows down the operation

tamp<-1000 #Only applies when buffy=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Radius of the buffer zone that you want to apply to calculate the value that will be assigned to each collection site (in meters)
##### Note2: a very large tamp (> 10000) combined with a very high resolution (resol1) (1x1) will generate very slow extraction processes

#############################################
#Variables to select
#############################################

variab1v<-"Temp prom anual"
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter is used to indicate the primary ecogeographic variable for which you wish to select accessions for the FIGS collection.
##### Note2: The variable names come from a column in the figvartotal.xlsx table called VARDESCR. In this case, any of the variables in this column is valid regardless of the component (VARMODULO column)

variab1rang<-FALSE
#TRUE or FALSE type parameter
##### Note: This parameter is used to indicate if the way to select accessions for the primary ecogeographic variable is by establishing a range of values (with minimum and maximum value)

variab1min<-0 #Only applies if variab1rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the minimum value of the selection range for the primary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab1max<-50 #Only applies if variab1rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the minimum value of the selection range for the primary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab1cola<-TRUE
#TRUE or FALSE type parameter
##### Note: This parameter indicates if the method for selecting accessions by the primary ecogeographic variable is through the definition of a fraction in the distribution of values.

variab1vpor<-20 #Only applies if variab1cola=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter defines the intensity of selection (% of the distribution) that will be applied to one of the two fractions of the distribution of values for the primary ecogeographic variable
##### Note2: This value cannot be less than 0 and greater than 100.

variab1vhl<-"high" #Only applies if variab1cola=TRUE
#variab1vhl<-"low"
#Text type parameter (text that goes between quotation marks "")
##### Note: This parameter determines if the intensity indicated in variab1vpor will be applied to the end of the fraction (distribution of values) high (high) or low (low)

variab2<-TRUE
#TRUE or FALSE type parameter
##### Note1: This parameter indicates if a secondary ecogeographic variable will be used to refine the selection of accessions that will make up the FIGS subset.

variab2v<-"Temp prom anual" #Only applies if variab2=TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter is used to indicate the secondary ecogeographic variable for which you wish to select accessions for the FIGS collection.
##### Note2: The variable names come from a column in the figvartotal.xlsx table called VARDESCR. In this case, any of the variables in this column is valid regardless of the component (VARMODULO column)

variab2rang<-FALSE
#TRUE or FALSE type parameter
##### Note1: This parameter is used to indicate if the method for selecting the accessions by the secondary ecogeographic variable is by setting a range of values (with minimum and maximum value)

variab2min<-0 #Only applies if variab2rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the minimum value of the selection range for the secondary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab2max<-50 #Only applies if variab2rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the maximum value of the selection range for the secondary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab2cola<-TRUE #Only applies if variab2=TRUE and variab2rang=FALSE
#TRUE or FALSE type parameter
##### Note: This parameter is used to indicate if the method to select the accessions by the secondary ecogeographic variable is through the definition of a fraction in the distribution of values.

variab2vpor<-50 #Only applies if variab1cola=TRUE and variab2rang=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter defines the intensity of selection (% of the distribution) that will be applied to one of the two fractions of the distribution of values for the secondary ecogeographic variable
##### Note2: This value cannot be less than 0 and greater than 100.

variab2vhl<-"high" #Only applies if variab2cola=TRUE
#variab2vhl<-"low"
#Text type parameter (text that goes between quotation marks "")
##### Note: This parameter determines if the intensity indicated in variab2vpor will be applied to the end of the fraction (distribution of values) high (high) or low (low)

variab3<-TRUE
#TRUE or FALSE type parameter
##### Note1: This parameter indicates whether a tertiary ecogeographic variable will be used to refine the selection of accessions that will make up the FIGS subset.

variab3v<-"Elevacion"
#Text type parameter (text that goes between quotation marks "")
##### Note1: This parameter is used to indicate the primary ecogeographic variable for which you wish to select accessions for the FIGS collection.
##### Note2: The variable names come from a column in the figvartotal.xlsx table called VARDESCR. In this case, any of the variables in this column is valid regardless of the component (VARMODULO column)

variab3rang<-FALSE
#TRUE or FALSE type parameter
##### Note1: This parameter is used to indicate if the method for selecting the accessions by the tertiary ecogeographic variable is by setting a range of values (with minimum and maximum value)

variab3min<-0 #Only applies if variab3rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the minimum value of the selection range for the tertiary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab3max<-100 #Only applies if variab3rang=TRUE 
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter indicates the maximum value of the selection range for the tertiary variable
##### Note2: It is recommended to check the possible values of this variable, since selecting values outside the total range for this species and variable may generate an error

variab3cola<-TRUE #Only applies if variab3=TRUE and variab3rang=FALSE
#TRUE or FALSE type parameter
##### Note: This parameter is used to indicate if the method for selecting the accessions by the tertiary ecogeographic variable is through the definition of a fraction in the distribution of values.

variab3vpor<-50 #Only applies if variab3cola=TRUE and variab3rang=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This parameter defines the intensity of selection (% of the distribution) that will be applied to one of the two fractions of the distribution of values for the tertiary ecogeographic variable
##### Note2: This value cannot be less than 0 and greater than 100.

variab3vhl<-"high" #Only applies if variab3cola=TRUE
#variab3vhl<-"low"
#Text type parameter (text that goes between quotation marks "")
##### Note: This parameter determines if the intensity indicated in variab3vpor will be applied to the end of the fraction (distribution of values) high (high) or low (low)

#############################################
#Results
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/FIGS_R"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved 
