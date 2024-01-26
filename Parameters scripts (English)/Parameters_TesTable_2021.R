#############################################
#TesTable 2021 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

#### NOTE: Remember that the analysis of data input tables performed by this tool is automatically saved in the "Pasaporte" folder, where the table of the "pasaporte" parameter is located

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

tiptable<-"Pasaporte"
#tiptable<-"FuentesExternas"
#tiptable<-"Fenotipo"
#tiptable<-"Genotipo"
#tiptable<-"NaturalezaVariables"
# Text type parameter (text that goes between quotation marks "")
#### Note1: The tiptable parameter tells the TesTable tool the type of table to be checked for errors or if the required format is missing.
#### Note2: It is highly recommended that the user creates their tables from the model tables offered in the path X:/CAPFITOGEN/Formatos_Formats English/Espa?ol

pasaporte<-"PasaporteOriginalEvaluadoGEOQUAL.txt"
#Text type parameter (text that goes between quotation marks "")
#### Note1: this text file must be in the Pasaporte folder, which in turn is a folder that is inside "ruta" (usually X:/CAPFITOGEN/)
#### Note2: this is the table that TesTable will check

access<-198
#Number type parameter (which will appear in blue in Rstudio)
#### Note1: Using the "access" parameter, the TesTable tool is told the number of records (rows) that the table defined in "pasaporte" has, without including the table header.
#### Note2: the number of records/rows/accessions can be defined for a passport, external sources, phenotype or genotype table. If it is a table of nature of variables, it corresponds to the number of variables this table contains.

geoqual<-FALSE #Only applies if tiptable="Pasaporte" or tiptable="FuentesExternas"
#TRUE or FALSE type parameter
#### Note1: This parameter tells the tool if the passport or external source tables have information on the quality of the georeferencing of the collection/observation sites (SUITQUAL, COORQUAL, LOCALQUAL, TOTALQUAL and TOTALQUAL100 columns were obtained for passport tables or TOTALQUAL100 for of external source tables).

availab<-FALSE #Only applies if tiptable="Pasaporte"
#TRUE or FALSE type parameter
#### Note1: This parameter tells the tool if the passport table has information on the availability of accessions (AVAILAB column on the right side of the table).
#### Note2: This type of tables with information on availability can be used in tools such as Representa or Complementa

fixthem<-TRUE
#TRUE or FALSE type parameter
#### Note1: This parameter tells TesTable if the user wants (TRUE) or not (FALSE) a copy of the table that is being checked with automatic correction of detected errors.
#### Note2: The fact that the user indicates fixthem=TRUE does not imply that the original table will be replaced or rewritten

nmark<-1 #Only applies to phenotype or genotype tables (tiptable="Fenotipo" or tiptable="Genotipo")
#Number type parameter (which will appear in blue in Rstudio)
#### Note1: the nmark parameter tells TesTable the number of markers or descriptors or variables that the phenotypic or genotypic characterization table contains.
#### Note2: The number of markers/descriptors/variables in the genotype/phenotype tables is obtained by counting the number of columns in the table minus one, which is the first column that corresponds to ACCENUMB, or the accession identification code.

phenot<-"NatVarMorfologia.txt" #Only applies when tiptable="NaturalezaVariables"
#Text type parameter (text that goes between quotation marks "")
#### Note1: In "phenot" enter the name of the table that contains the phenotypic information referenced by the table 'NaturalezaVariables' that you want to analyze. Remember that this, like the rest of the tables, must be stored in the 'Pasaporte' folder. Don't forget to include the extension (.txt).
#### Note2: With this information, the TesTable tool will ensure that the phenotypic characterization table contains the correct number of columns (descriptors) and that its name matches the name indicated in the table of the nature of variables.
