############################################
#GEOQUAL 2021 parameters script
############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
# Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta"
# Note2: this table must not have been analyzed by the GEOQUAL tool before and must have the number and name of columns indicated by the format found in the path "X:/CAPFITOGEN3/Formatos_Formats/Espanol/Formatos GEOQUAL"

precision<-"alta"
#Text type parameter (text that goes between quotation marks "")
# Note1: this parameter defines what quality of coast maps will be used to determine if a point (collection site) falls in the sea and if so, how far it is from the coast.
# Note2: In slow processors or with low capacity and memory, you should take into account that "precision<-"alta" means a high consumption of resources and a longer process.

local<-TRUE
#TRUE or FALSE type parameter
# Note1: In this parameter you must indicate whether you will ask the tool to create the LOCALQUAL criterion to calculate the final quality value (TOTALQUAL/TOTALQUAL100)
# Note2: Remember that TOTALQUAL or TOTALQUAL100 are calculated under three criteria, which are LOCALQUAL (where the description of the locality that comes from the coordinates is compared to that provided in the passport data), SUITQUAL (how appropriate the site is for plant growth) and COORQUAL (intrinsic quality of the site's georeferencing).


#############################################
#Results
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/GEOQUAL"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
