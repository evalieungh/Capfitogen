#############################################
#SelecVIF 2021 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#An Excel file with the required form for this tool is located in the "ModelOptions" folder (CAPFITOGEN/ModelOptions)

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

#SelecVIF only has two parameters to complete in Rstudio. The rest of the parameters are filled in an excel table, which when ready is saved as a text file (txt) that must be located in the path X:/CAPFITOGEN/ModelOptions, and whose name must be defined in the partablename parameter
ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

partablename<-"TableParametersSelecVIF_Example.txt"
#Text type parameter (text that goes between quotation marks "")
#### Note: this name corresponds to the name of the table (including the .txt extension) in text format, that contains all the parameters that configure the SelecVIF tool
