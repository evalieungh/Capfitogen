#############################################
#Mcompare 2021 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

rutapresent<-"C:/CAPFITOGEN3/Modela/Results_Project_raw_Arachis"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where you can find the map of the predicted model with present bioclimatic data.
#### Note: Use slash (/) before backslash (\) to separate each part of the path.

modelpresent<-"Arachis.hypogaea_PA2_RUN2_RF.tif"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the name of the raster map of the predicted model with present bioclimatic data.
#### Note: You must add the extension of the map to the file name, it can be a .tif or .grd map.

binarizedp<-FALSE
#TRUE or FALSE type parameter
##### Note: Is the map of the predicted model with present bioclimatic data binarized?
##### Note: Binarized means that the original (raw) prediction values of the model, that usually range from 0 to 1000, were binarized through a threshold that serves as a cutoff point. Below this point the value of the binarized map is zero and above it the value is one.
##### Note: Mcompare can also work with non-binarized maps.

binarthresp<-306 #Only applies if binarizedp=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note: binarthresp must be a number between 1 and 999. It usually comes from the cutoff value of the model assessment table by ROC, Kappa, TSS, etc.

rutaigual<-FALSE
#TRUE or FALSE type parameter
##### Note: rutaigual specifies whether the maps of the predicted models with present and future bioclimatic data are in the same folder (on the same path) or not. TRUE= both maps are in the same folder.

rutafuture<-"C:/CAPFITOGEN3/Modela/Results_Project_raw_Arachis_F" #Only applies if rutaigual=TRUE
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where you can find the map of the predicted model with future bioclimatic data.
#### Note: Use slash (/) before backslash (\) to separate each part of the path.

modelfuture<-"Arachis.hypogaea_PA2_RUN2_RF_Fut.tif"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the name of the map of the predicted model with future bioclimatic data.
#### Note: You must add the extension of the map to the file name, it can be a .tif or .grd map.

binarizedf<-FALSE
#TRUE or FALSE type parameter
##### Note: Is the map of the predicted model with future bioclimatic data binarized?
##### Note: Binarized means that the original (raw) prediction values of the model, that usually range from 0 to 1000, were binarized through a threshold that serves as a cutoff point. Below this point the value of the binarized map is zero and above it the value is one.

binarthresf<-306 #Only applies if binarizedf=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note: binarthresf must be a number between 1 and 999. It usually comes from the cutoff value of the model assessment table by ROC, Kappa, TSS, etc.

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
# Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta"
# Note2: This table has the same structure as other passport tables. It may have already been analyzed using the GEOQUAL tool

geoqual<-TRUE
#TRUE or FALSE type parameter
# Note: Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)

totalqual<-50 #Only applies if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
##### Note2: It must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

distdup<-1
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This numerical parameter indicates the distance threshold under which you consider that two collection sites in fact represent the same population (expressed in km)
##### Note2: A very high number in distdup can significantly reduce the number of accessions in the analysis

#############################################
#Results
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/Mcompare"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
