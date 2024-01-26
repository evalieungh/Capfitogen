#############################################
#DIVmapas 2021 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"E:/CAPFITOGEN3"
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
#etc
#Text type parameter (text that goes between quotation marks "")
##### Note: The selected country/region (the first letter usually goes in uppercase as in "Ecuador") must have the corresponding folder (with the name of the country but there it goes in lowercase as in "ecuador") in rdatamaps. 
##### Note2: the name of the country must be written as it appears in the lista_paises.xlsx table, and as it appears in the "Way to write country name (pais parameter)" column
##### Note3: If you have used the rLayer tool before and generated a set of layers cropped according to the individual needs of the user, you can enter here a name defined in the "uname" parameter to use that set of layers 

#############################################
#Pasaporte and GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
# Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta"
# Note2: this table has the same structure as other passport tables. It may have been already analyzed using the GEOQUAL tool

geoqual<-TRUE
#TRUE or FALSE type parameter 
# Note: Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)

totalqual<-60 #Only applies if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

#############################################
#Ecogeografic
#############################################

ecogeo<-TRUE
#TRUE or FALSE type parameter
##### Note: Extraction/analysis of ecogeographic diversity?
##### Note: This parameter =TRUE implies that is going to be ecogeographically characterized, which will generate a folder with the particular results of said characterization

buffy<-FALSE #Only applies if ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note1: Method of extraction, do you want to include contiguous cells (buffer zone) to calculate the value assigned to each collection site?
##### Note2: Selecting buffy=TRUE can slow down the extraction process, since it forces R to extract values for each point (which comes from the coordinates of the records in the passport table) not only from the cell where they fall (simple extraction, when buffy=FALSE) but from adjacent cells, whose values are averaged... that slows down the operation

tamp<-2000 #Only applies if buffy=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Radius of the buffer zone that you want to apply to calculate the value that will be assigned to each collection site (in meters)
##### Note2: a very large tamp (>10000) combined with a very high resolution (resol1) (1x1), will generate very slow extraction processes

resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Text type parameter (text that goes between quotation marks "")
###### Note1: This parameter indicates the resolution you wish to use to extract ecogeographic information
###### Note2: resol1 means the resolution of the ecogeographic layers that will be used to extract information for each point. resol1 must exist as a "1x1", "5x5", "10x10" or "20x20" folder inside rdatamaps/nombre_pais

bioclimsn<-TRUE #Only applies if ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note1: in this parameter you must indicate... do you want to extract information from bioclimatic variables?
##### Note2: ecogeographic (bioclimatic) variables for which you wish to extract information for the points that come from the passport table:

bioclimv<-c("Temp prom anual","Prec anual","Prec cuarto mas calido") #Only applies if bioclimsn=TRUE
###Complete list of bioclimatic variables, for more information see the table of variables and their corresponding descriptions in English and Spanish:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
###List of the 19 BIOCLIM variables:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options between quotation marks, separated by commas and all within a pair of parentheses preceded by the letter c)
##### Note:The names of the variables come from a column in the figvartotal.xlsx table called VARDESCR, which are indicated in the VARMODULO column as "Bioclimatic"

edaphsn<-TRUE #Only applies if ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note1: in this parameter you must indicate... do you want to extract information from edaphic variables?
##### Note2: ecogeographic (edaphic) variables for which you wish to extract information for the points that come from the passport table 

edaphv<-c("Silt content top","Sand content top","Avail soil water cap top") #Only applies if bioclimsn=TRUE
#Complete list of SOILGRIDS edaphic variables (more modern), for more information see the table of variables and their corresponding descriptions in English and Spanish:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
#Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options between quotation marks, separated by commas and all within a pair of parentheses preceded by the letter c)
##### Note:The names of the variables come from a column in the figvartotal.xlsx table called VARDESCR, which are indicated in the VARMODULO column as "Edaphic"

geophyssn<-TRUE #Only applies if ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note1: in this parameter you must indicate... do you want to extract information from geophysical variables?
##### Note2: ecogeographic (geophysical) variables for which you wish to extract information for the points coming from the passport table

geophysv<-c("Elevacion","Pendiente grados")
#Complete list of geophysical variables, for more information see table of variables and their corresponding descriptions in English and Spanish:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
#Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)
#####Note:The names of the variables come from a column in the figvartotal.xlsx table, called VARDESCR, which are indicated in the VARMODULO column as "Geophysic"

latitud<-FALSE #Only applies if ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note:This parameter indicates if the latitude (Y) variable that comes from the DECLATITUDE column of the passport table will be used to carry out the ecogeographic characterization (as a geophysical variable)
longitud<-TRUE #S?lo aplica si ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note1:This parameter indicates if the longitude (X) variable that comes from the DECLATITUDE column of the passport table will be used to carry out the ecogeographic characterization (as a geophysical variable)
##### Note2:For DIVmapas, latitude and longitude are not found as layers in rdatamaps since they are directly obtained from the coordinates in the passport table. However, both latitude and longitude would enter as geophysical variables in the DIVmapas analyses.

#############################################
#Phenotype
#############################################

phenotip<-TRUE
#TRUE or FALSE type parameter
##### Note1: Will a phenotypic map/analysis be generated?
##### Note2: If phenotip=TRUE, the user must provide a specific table with the phenotypic characterization data. That table has a column in common with the passport table (ACCENUMB) and the rest are columns of variables called descriptors. As there are descriptors (variables) of various types and the R functions that run the analysis need to recognize them, the user must provide another additional table that indicates the nature of each variable.


phenot<-"Morfologia.txt" #Only applies if phenotip=TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: In this parameter you must indicate where the phenotypic data is and what it is called (text box)
##### Note2: in phenot you must indicate the name of the characterization table (ACCENUMB column plus columns for the other variables), adding the (.txt) extension. The user must locate this table in the CAPFITOGEN3/Pasaporte folder. If, as in this case, the table is inside a subfolder within pasaporte, the path from CAPFITOGEN3/Pasaporte to the table must be indicated... in this case Pasaporte/Morfolog?a.txt


phenotv<-"TablaNaturalezaVariables.txt" #Only applies if phenotip=TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: In this parameter you must indicate the location of the table with the nature of each variable included in the phenotypic data table.
##### Note2: phenotv is the name of the table that indicates the nature of each variable used in the phenotypic characterization and that is a column in the phenot table 

################################################
#Genotype
################################################

genotip<-TRUE
#TRUE or FALSE type parameter
##### Note1: Will a genotypic map/analysis be generated?
##### Note2: if genotip=TRUE, the user must provide a specific table with the genotypic characterization data. That table has a column in common with the passport table (ACCENUMB) and the rest are columns of variables called descriptors. This table, as in the case of the phenotypic characterization table, must be in the path CAPFITOGEN3/Pasaporte 

genot<-"AFLP.txt" #Only applies for genotip=TRUE
#Text type parameter (text that goes between quotation marks "")
##### Note1: where is the genotypic data and what is it called? (text box)
##### Note2: genot is the name of the genotypic data table, which must be found in the path CAPFITOGEN3/Pasaporte. If, as in this case, the table is inside a subfolder within pasaporte, the path from CAPFITOGEN3/Pasaporte to the table must be indicated... in this case Pasaporte/AFLP.txt

neigd<-TRUE #Only applies for genotip=TRUE
#TRUE or FALSE type parameter
##### Note1: You wish to obtain Nei's gene diversity
##### Note2: If neigd=TRUE produces an analysis of optional type and certain products will be generated within the genotypic results folder

csimilar<-5 # Only applies for genotip=TRUE
#csimilar<-1 #1=Jaccard 1901
#csimilar<-2 #2=SMC by Sokal&Michaner 1958
#csimilar<-3 #3=Sokal and Sneath
#csimilar<-4 #4=Rogers & Tanimoto 1960
#csimilar<-5 #5=Dice 1945
#csimilar<-6 #6=Hamman S9 by Gower and Legendre 1986
#csimilar<-7 #7=Ochiai 1957
#csimilar<-8 #8=Sokal and Sneath 1963
#csimilar<-9 #9=Phi by Pearson
#csimilar<-10 #10=S2 by Gower and Legendre
##### Note1: the genotypic diversity analysis requires that you define the algorithm to be used. This algorithm is defined with a number (from 1 to 10) in the csimilar parameter, according to the following options:
##### Note2: Distance from a desired coefficient (d=sqrt (1-s) where s is the coefficient of similarity)

#############################################
#Grid: The following two parameters define the structure of the diversity maps resulting from DIVmapas
#############################################

rgrid<-10
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: this parameter corresponds to the size of cells of the grid/structure in km
##### Note2: rgrid is a number and can only be: 1,5,10,50,100. Other numbers will produce errors.

buffer<-30
#Number type parameter (which will appear in blue in Rstudio)
##### Note1:Size of neighborhood area (circular buffer) in km
##### Note2:buffer is a number. This number cannot be less than rgrid, it should be at least rgrid x 1.5, and at most it can be up to 10 times the size of rgrid


#############################################
#Classic multivariate analyses: the parameters in this section can generate additional analyses and results to those generated by echogeo, phenotip and genotip
#############################################

ecogeoclus<-TRUE #Only applies for ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note: Do you want a single cluster analysis for all entries by ecogeographic characterization data?


ecogeoclustype<-"average" #only applies if ecogeoclus=TRUE
#ecogeoclustype<-"single" #nearest neighbor
#ecogeoclustype<-"complete" #furthest neighbor or compact
#ecogeoclustype<-"ward" #Ward's minimum variance method
#ecogeoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#ecogeoclustype<-"average" #average similarity (UPGMA)
#ecogeoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#ecogeoclustype<-"centroid" #geometric centroid (UPGMC)
#ecogeoclustype<-"flexible" #flexible Beta
#Text type parameter (text that goes between quotation marks "")
##### Note1: Ecogeoclustype defines the multivariate clustering algorithm to be used on the ecogeographic characterization data. The possibilities are:
##### Note2: what type of hierarchical cluster (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" or weighted average="weighted")?

ecogeopca<-TRUE #Only applies for ecogeo=TRUE
#TRUE or FALSE type parameter
##### Note: Do you want a principal component analysis for all entries by ecogeographic characterization data?

ecogeopcaxe<-5 #Only applies for ecogeopca=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note: ecogeopcaxe is a number that defines the principal components that will be analyzed in detail. The maximum number of ecogeographic variables used (bioclimv+edaphv+geophysv) must be -1. For example, if all the added variables of bioclimv+edaphv+geophysv= 20, ecogeopcaxe cannot be greater than 19.

phenoclus<-TRUE #Only applies for phenotip=TRUE
#TRUE or FALSE type parameter
##### Note: Do you want a single cluster analysis for all entries by phenotypic characterization data?

phenoclustype<-"average" #Only applies for phenoclus=TRUE
#phenoclustype<-"single" #nearest neighbor
#phenoclustype<-"complete" #furthest neighbor or compact
#phenoclustype<-"ward" #Ward's minimum variance method
#phenoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#phenoclustype<-"average" #average similarity (UPGMA)
#phenoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#phenoclustype<-"centroid" #geometric centroid (UPGMC)
#phenoclustype<-"flexible" #flexible Beta
#Text type parameter (text that goes between quotation marks "")
##### Note1: phenoclustype defines the multivariate clustering algorithm to be used on the phenotypic characterization data. The possibilities are:
##### Note2: What kind of hierarchical clustering do you want (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" or weighted average="weighted")?

phenopca<-TRUE #Only applies for phenotip=TRUE
#TRUE or FALSE type parameter
##### Note1: Do you want a principal component/coordinate analysis for all entries by ecogeographic characterization data?

phenopcaxe<-5 #only applies for phenopca=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Number of axes to extract (phenotypic analysis)
##### Note2: phenopcaxe is a number that defines the principal components that will be analyzed in detail. The maximum number must be the number of variables/descriptors that appear in the phenotypic characterization table -1. If in that table, there are 15 columns with data (variables/descriptors) apart from the ACCENUMB column, then phenopcaxe cannot be greater than 14.

phenovarq<-FALSE #Only applies for phenotip=TRUE
#TRUE or FALSE type parameter
##### Note1: Does the phenotypic characterization data contain only quantitative descriptors (variables)?
##### Note2: this is a necessary question to apply some methods in the script. To know if all the phenotypic variables/descriptors are quantitative or not, you must see in the table of nature of variables if all the variables listed there appear as quantitative (phenovarq=TRUE) or if not all are quantitative (phenovarq=FALSE)

genoclus<-TRUE #Only applies for genotip=TRUE
#TRUE or FALSE type parameter
##### Note: Do you want a single cluster analysis for all inputs by molecular characterization data (data 0/1)?

genoclustype<-"average" #Only applies if genoclus=TRUE
#genoclustype<-"single" #nearest neighbor
#genoclustype<-"complete" #furthest neighbor or compact
#genoclustype<-"ward" #Ward's minimum variance method
#genoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#genoclustype<-"average" #average similarity (UPGMA)
#genoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#genoclustype<-"centroid" #geometric centroid (UPGMC)
#genoclustype<-"flexible" #flexible Beta
#Text type parameter (text that goes between quotation marks "")
##### Note1: genoclustype defines the multivariate clustering algorithm to be used on the genotypic characterization data. The possibilities are:
##### Note2: What type of hierarchical clustering do you want (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" or weighted average="weighted")?

genopco<-TRUE #Only applies for genotip=TRUE
#TRUE or FALSE type parameter
##### Note: Do you want a principal coordinate analysis for all inputs by molecular characterization data (data 0/1)?

genopcoaxe<-5 #Only applies for genopco=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Number of axes to extract (genotypic analysis)
##### Note2: genopcoaxe is a number that defines the main coordinates that will be analyzed in detail. The maximum number must be the number of descriptors that appear in the genotypic characterization table -1. If in that table, 15 columns with data (descriptors) appear apart from the ACCENUMB column, then genopcoaxe cannot be greater than 14.

#############################################
#Matrix comparisons
#############################################

mantelt<-TRUE #Only applies if at least two of the following parameters are = TRUE: ecogeo, phenotip, genotip
#TRUE or FALSE type parameter
##### Note1: Do you want to make matrix comparisons between the different analyzed components?
##### Note2: mantelt=TRUE produces a new folder with results from Mantel's matrix correlations in the results path

mantelmeth<-"pearson" #Only applies if mantelt=TRUE
#mantelmeth<-"kendall"
#mantelmeth<-"sperman"
#Text type parameter (text that goes between quotation marks "")
##### Note: Type of correlation to use

mantelper<-999 #Only applies if mantelt=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### note1: Number of permutations to use in matrix correlations (numeric box)
##### note2: These are usually numbers between 100 and 10,000 or even more. However, a large number of permutations can cause memory errors or run times that are too long.

#############################################
#Results
#############################################
resultados<-"E:/CAPFITOGEN3/Resultados/DIVmapas"
# Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
