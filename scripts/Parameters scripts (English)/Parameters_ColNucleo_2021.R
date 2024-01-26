##############################################
#ColNucleo 2021 parameters script
##############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)


#############################################
#Passport with GEOQUAL
#############################################

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL_ColNucleo.txt"
#Text type parameter (text that goes between quotation marks "")
# Note: this text file must be in the Pasaporte folder, which in turn is a folder within "ruta"
# Note: this table has the same structure as other passport tables. It may have already been analyzed using the GEOQUAL tool


geoqual<-TRUE
#TRUE or FALSE type parameter
# Does the passport have the GEOQUAL evaluation (4 additional variables on the right side of the table?)
# Threshold allowed for GEOQUAL (values equal to or greater than the one indicated for the TOTALQUAL parameter)
# Note: applying geoqual=TRUE when the passport table has not been analyzed by the GEOQUAL tool or the table referenced in the pasaporte parameter does not have a TOTALQUAL100 column with valid values will generate an error

totalqual<-60 #Applies only if geoqual=TRUE
#Number type parameter (which will appear in blue in Rstudio)
# Note: it must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

#############################################
#ELC map
#############################################
mapaelc<-"mapa_elc_ecuador.grd"
#Text type parameter (text that goes between quotation marks "")
#Note1: what is the name of the ELC map obtained by previously using the ELC mapas tool? (.grd and .gri files that must always be in the CAPFITOGEN3/ELCmapas folder) (text box)
#Note2: this tool requires a previously obtained ecogeographic map of territory characterization (ELC), that comes from the ELCmapas tool

statelc<-"Estadist_ELC_ecuador.txt"
#Text type parameter (text that goes between quotation marks "")
#Note: What is the name of the table that contains the ELC map statistics? .txt file obtained by previously using the ELC mapas tool that accompanies the map (it will always be in the "ELCmapas" folder) (text box)

#############################################
#Duplicate removal
#############################################

distdup<-0
#Number type parameter (which will appear in blue in Rstudio)
#Note1: Distance threshold (in km) under which it is considered that two collection sites in fact represent the same population
#Note2: distdup cannot be less than zero and cannot be an extremely high number as it would make all the points to be actually duplicated and the analysis would be run for a single point.

#############################################
#Caracteristics of the core collection
#############################################
#Percentage (%) of the total collection that will define the size (number of entries) of the core collection 
porcol<-10
#Number type parameter (which will appear in blue in Rstudio)
# Note: value that must be between 0 and 100

estratcol<-"P" #Proportional
#estratcol<-"C" #Uniform
#estratcol<-"L" #Logarithmic
#Text type parameter (text that goes between quotation marks "")
# Note: Allocation strategy for the formation of the core collection, only valid options: C, P, L

availab<-FALSE
#TRUE o FALSE type parameter
# Note: if availab=TRUE, the passport table must have a column called AVAILAB on the right with YES/NO/NA values. If not, an error will be generated
# Note2: Do you want to use the AVAILAB (entry availability) field to select what entries would be appropriate to be part of the core collection?

#############################################
#Results
#############################################
resultados<-"C:/CAPFITOGEN3/Resultados/ColNucleo"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
