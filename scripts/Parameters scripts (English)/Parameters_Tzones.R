#############################################
#Tzones 2021 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

elcready<-FALSE 
#TRUE or FALSE type parameter
#Note 1: Check this option if a previous analysis of Tzones has already been carried out and you want to make another projection of the ELC map in the future but with another GCM, r.c.p and/or projection period. WARNING, if you check this option, the "resultados" parameter must be the identical path used in the previous execution of Tzones, where there must be a file called "Product.RData". Additionally, checking this option only requires filling the ruta, gcm, rcp, proy, iterarf, transfer, pasaporte, tecogaps, ttresh, resultados and resultados2 parameters.
#Note2: If this parameter is TRUE, it means that the tool has already been run before and that a file called Productos.RData will be loaded from the "resultados" folder.
#Note3: It is simply used to change some future parameters but based on the same ELC map of the present
#Note4: THEREFORE, THE FIRST TIME THIS TOOL IS RUN WITH A NEW PARAMETER CONFIGURATION, elcready MUST BE = FALSE

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
#etc
#Text type parameter (text that goes between quotation marks "")
##### Note: The selected country/region (the first letter usually goes in uppercase as in "Ecuador") must have the corresponding folder (with the name of the country but there it goes in lowercase as in "ecuador") in rdatamaps.
##### Note2: the name of the country must be written as it appears in the lista_paises.xlsx table, and as it appears in the column "Way to write country name (pais parameter)"
##### Note3: If you have previously used the rLayer tool and generated a set of cropped layers according to the individual needs of the user, you can enter here a name defined in the "uname" parameter to use that set of layers

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Text type parameter (text that goes between quotation marks "")
###### Note1: This parameter indicates the resolution that will be used to generate the ELC map, base of Tzones
###### Note2: resol1 means the resolution of the ecogeographic layers that will be used to extract information for each point. resol1 must exist as a "1x1", "5x5", "10x10" or "20x20" folder inside rdatamaps/nombre_pais and rdatamapsf/nombre_pais
###### Note3: Therefore, the resolution defined here requires that sets of ecogeographic variables exist for the selected "pais" in the rdatamaps and rdatamapsf folders. If you do not have the future layers in radatamapsf, you can obtain them using the Bfuture tool 
###### Note4: Please keep on mind Tzones uses WorldClim 2.1 projected information (to project future scenarios), and this database does not have 30 arc-seconds (1x1 km) resolution available for future GCM and SSP (stated 14 JAN 2022, please check it at http://www.worldclim.org) 

###############################
#Ecogeographic variables
###############################

bioclimv<-c("Temp prom anual","Prec anual","Prec cuarto mas calido") #Only applies if bioclimsn=TRUE
###Complete list of bioclimatic variables, for more information see the table of variables and their corresponding descriptions in English and Spanish:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
###List of the 19 BIOCLIM variables:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)
##### Note:The names of the variables come from a column in the figvartotal.xlsx table, called VARDESCR, which are indicated in the VARMODULO column as "Bioclimatic"

edaphv<-c("Silt content top","Sand content top","Avail soil water cap top") #Only applies if bioclimsn=TRUE
###Complete list of SOILGRIDS edaphic variables (more modern), for more information see the table of variables and their corresponding descriptions in English and Spanish:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)
##### Note: The names of the variables come from a column in the figvartotal.xlsx table, called VARDESCR, which are indicated in the VARMODULO column as "Edaphic"

geophysv<-c("Elevacion","Pendiente grados")
###Complete list of geophysical variables, for more information see the table of variables and their corresponding descriptions in English and Spanish:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)
##### Note:The names of the variables come from a column in the figvartotal.xlsx table, called VARDESCR, which are indicated in the VARMODULO column as "Geophysical"

latitud<-FALSE
#TRUE or FALSE type parameter
##### Note:This parameter indicates if the latitude variable (X) will be taken into account as a variable in the geophysical component for the creation of the ELC map. Keep in mind that using the latitude and longitude (TRUE) parameters in the creation of an ELC map will produce more spatially aggregated ecogeographic units (something usually pursued)

longitud<-TRUE
#TRUE or FALSE type parameter
##### Note:This parameter indicates if the longitude variable (y) will be taken into account as a variable in the geophysical component for the creation of the ELC map. Keep in mind that using the latitude and longitude (TRUE) parameters in the creation of an ELC map will produce more spatially aggregated ecogeographic units (something usually pursued)
##### Note2:latitude and longitude are not found as layers in rdatamaps since they are directly obtained from the centroids of the cells that make up the work area.

###############################
#Future conditions
###############################
ssp<-126
#ssp<-245
#ssp<-370
#ssp<-585
# Number type parameter (which will appear in blue in Rstudio)
##### Note: ssp means shared socio-economic pathways, and the only options are 126, 245, 370 and 585

gcm<-"MRI-ESM2-0"
#gcm<-"BCC-CSM2-MR"
#gcm<-"CNRM-CM6-1"
#gcm<-"CNRM-ESM2-1"
#gcm<-"CanESM5"
#gcm<-"GFDL-ESM4"
#gcm<-"IPSL-CM6A-LR"
#gcm<-"MIROC-ES2L"
#gcm<-"MIROC6"
#Text type parameter (text that goes between quotation marks "")
##### Note: gcm means global circulate models, and the only options are those listed above.

#proy<-2030
#proy<-2050
proy<-2070
#proy<-2090
#Number type parameter (which will appear in blue in Rstudio)
##### Note: proy indicates the time periods (future), and the only options are 2030, 2050, 2070 and 2090

###############################
#ELC map configuration/setting
###############################
maxg<-8 #applies if elcready= FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This numeric parameter tells the tool the maximum number of clusters that will be allowed per component. Therefore, this number is a factor that the algorithm chosen in the metodo parameter will take into account to limit the optimal number of clusters per component.
##### Note2: Very high numbers (greater than 8) can allow some algorithms to determine high numbers of optimal clusters per component, which will eventually generate an ELC map with too many categories (>100).

metodo<-"kmeansbic" #applies if elcready= FALSE
#metodo<-"medoides"
#metodo<-"elbow"
#metodo<-"calinski"
#metodo<-"ssi"
#metodo<-"bic"
#Text type parameter (text that goes between quotation marks "")
##### Note: This parameter tells the tool the type of algorithm that will be used to determine the optimal number of clusters for each component (bioclimatic, geophysical, edaphic), which affects the final number of categories of the ELC map.

iterat<-10 #Only applies if m?todo="Calinski" or "ssi"
#Number type parameter (which will appear in blue in Rstudio)
##### Note: This parameter is specific to the algorithms for cluster determination (metodo parameter) ssi or calisnki and indicates the number of iterations that will be used by these methods to calculate the optimal number of clusters.

###############################
#Transfer zone configuration
###############################
iterarf<-10
#Number type parameter (which will appear in blue in Rstudio)
#### Note1: This parameter indicates the number of iterations or permutations to be used for the Random Forest model with which the present ELC map is projected to future bioclimatic conditions.

transfer<-TRUE
#TRUE or FALSE type parameter
#### Note1: Check this option if you want to perform a germplasm transfer zone analysis.
#### Note2: It is required to have a table with presence data (it will be in the pasaporte parameter), which contains populations that could be at risk of disappearing due to climate change and populations that could serve as a source of germplasm in the present to prevent their disappearance.

pasaporte<-"Pasaporte/PasaporteOriginalEvaluadoGEOQUAL.txt" #Only applies if transfer=TRUE
#Text type parameter (text that goes between quotation marks "")
#### Note1: in this case, the pasaporte parameter corresponds to a passport table, that must be in the path X:/CAPFITOGEN/Pasaporte and may have been analyzed by GEOQUAL and/or have availability columns
#### Note2: Here you write the name of the file that contains the table of presence/occurrences data (in CAPFITOGEN passport format for the Complementa tool, in tab-delimited text format) without forgetting to include the (.txt) extension. For example, if the file is called 'tabla' you must write: 'tabla.txt'. Remember that this file must be previously saved in the 'Pasaporte' folder, which is part of the set of folders that make up the CAPFITOGEN directory. In case you want to perform a FIGS analysis, the table of the "pasaporte" parameter corresponds to the table of evaluated accessions that have the trait of interest.

geoqual<-TRUE #Only applies if transfer=TRUE
#TRUE or FALSE type parameter
# Note: Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)

totalqual<-50 #Only applies if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.


tecogaps<-FALSE #Only applies if transfer=TRUE
#TRUE or FALSE type parameter
#### Note1: the tecogaps parameter can be TRUE if the passport table has the "GAPTYPE" column and it contains valid values (it has been analyzed by the Representa tool) that can filter those presences corresponding to priority ecogeographic gaps.

ttresh<-4 #Only applies if transfer=TRUE and tecogaps=TRUE
#Number type parameter (which will appear in blue in Rstudio)
#### Note1: The ttresh parameter establishes the threshold value for GAPTYPE (on a scale from 1 to 15) to determine what presences are considered priority ecogeographic gaps. This value is usually set to 4 (see user manual for the Representa tool).


###############################
#Results NOTE: Note that you must stipulate two different paths for two results
###############################
resultados<-"C:/CAPFITOGEN3/ResultadosTzones"
#Text type parameter (text that goes between quotation marks "")
#### Note1: Path of a folder (existing) where the results for PRESENTE will be saved (ELC map of present)
#### Note2: The resultados destination folder must be previously created.

resultados2<-"C:/CAPFITOGEN3/ResultadosTzonesFuture" #this folder must be previously created
#Text type parameter (text that goes between quotation marks "")
#### Note1: Path of a folder (existing) where the results for FUTURO will be saved, such as future ELC maps, maps of change zones, and transfer zone analysis.
#### Note2: The resultados2 destination folder must be previously created.
