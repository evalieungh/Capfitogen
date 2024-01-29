#############################################
#ELCmapas 2024 parameters script
#############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### for each parameter (word in black color) please assign a value or select an option

ruta<-"C:\\Users\\hmpar\\OneDrive\\Documents\\GitHub\\Capfitogen"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

#pais<-"ecuador"
#pais<-"colombia"
#pais<-"spain"
#pais<-"united_states"
#pais<-"argentina"
#pais<-"bolivia"
#pais<-"brasil"
#pais<-"chile"
#pais<-"norway"
#pais<-"canada"
#pais<-"mesoamerica"
#pais<-"tunisia"
#pais<-"nordic_countries"
#pais<-"ne_africa"
#pais<-"world"
pais<-"user1"
##### Note: The selected country/region must have the corresponding folder in rdatamaps.
##### Note2: the name of the country must be written as it appears in rdatamaps folder 
##### Note3: If you have previously used the rLayer tool and generated a set of cropped layers according to the individual needs of the user, you can enter here a name defined in the "uname" parameter to use that set of layers

metodo<-"kmeansbic"
#metodo<-"medoides"
#metodo<-"elbow"
#metodo<-"calinski"
#metodo<-"ssi"
#metodo<-"bic"
#Text type parameter (text that goes between quotation marks "")
##### Note: This parameter tells the tool the type of algorithm that will be used to determine the optimal number of clusters for each component (bioclimatic, geophysical, edaphic), which affects the final number of categories of the ELC map.

iterat<-10 #Only applies if metodo="Calinski" or "ssi"
#Number type parameter (which will appear in blue in Rstudio)
##### Note: This parameter is specific to the ssi or calisnki algorithms that determine clusters (metodo parameter) and indicates the number of iterations that will be used by these methods to calculate the optimal number of clusters.

#resol1<-"1x1"
resol1<-"5x5"
#resol1<-"10x10"
#resol1<-"20x20"
#Text type parameter (text that goes between quotation marks "")
###### Note1: This parameter indicates the resolution at which you want to extract ecogeographic information
###### Note2: resol1 means the resolution of the ecogeographic layers that will be used to extract information for each point. resol1 must exist as a "1x1", "5x5", "10x10" or "20x20" folder inside rdatamaps/nombre_pais


bioclimv<-c("bio_1","bio_11","bio_17","bio_6")
###Complete list of bioclimatic variables, for more information see the table of variables and their corresponding descriptions in English and Spanish:
#bioclimv<-c("bio_1","bio_2","bio_3","bio_4","bio_5","bio_6","bio_7","bio_8","bio_9","bio_10","bio_11","bio_12","bio_13","bio_14","bio_15","bio_16","bio_17","bio_18","bio_19")
###List of the 19 BIOCLIM variables
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)

edaphv<-c("t_bulk_dens","t_cecsol","t_oc_dens","t_ph_kcl")
#edaphv<-c("t_awc1","t_awc2","t_awc3","t_awcts","depth_rock","r_horizon","t_bulk_dens","t_cecsol","t_clay_cont","t_coarse_frag","t_oc_dens","t_oc_stock","t_oc_cont","t_ph_hox","t_ph_kcl","sodicity","t_silt_cont","t_sand_cont","t_soilwater_cap")
###Complete list of SOILGRIDS edaphic variables for topsoil conditions (more modern), for more information see the table of variables and their corresponding descriptions in English and Spanish:
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)

geophysv<-c("alt","wind_annual","srad_annual")
#geophysv<-c("alt","aspect","slope","wind_1","wind_7","wind_annual","srad_1","srad_7","srad_annual")
###Complete list of geophysical variables, for more information see the table of variables and their corresponding descriptions in English and Spanish:
###Text type parameter (text that goes between quotation marks ""), of multiple type (you can select more than one option, including all the options in quotation marks, separated by commas and everything within a pair of parentheses preceded by the letter c)

latitud<-TRUE
#TRUE or FALSE type parameter
##### Note:This parameter indicates whether the latitude (X) variable will be taken into account as a variable in the geophysical component for the creation of the ELC map. Keep in mind that using the latitude and longitude parameters (TRUE) in the creation of an ELC map will produce more spatially aggregated ecogeographic units (something usually pursued)

longitud<-TRUE
#TRUE or FALSE type parameter
##### Note:This parameter indicates whether the longitude (Y) variable will be taken into account as a variable in the geophysical component for the creation of the ELC map. Keep in mind that using the latitude and longitude parameters (TRUE) in the creation of an ELC map will produce more spatially aggregated ecogeographic units (something usually pursued)
##### Note2:Latitude and longitude are not found as layers in rdatamaps since they are directly obtained from the centroids of the cells that make up the work area.

maxg<-5
#Number type parameter (which will appear in blue in Rstudio)
##### Note1: This numeric parameter tells the tool the maximum number of clusters per component that will be allowed. Therefore, this number is a factor that the algorithm selected in the metodo parameter will take into account to limit the optimal number of clusters per component.
##### Note2: Very high numbers (greater than 8) can allow some algorithms to determine high numbers of optimal clusters per component, which will eventually generate an ELC map with too many categories (>100). Too many categories on an ELC map can be undesirable (depending on the case).

#############################################
#Results
#############################################
resultados<-"C:\\Users\\hmpar\\OneDrive\\Documents\\GitHub\\Capfitogen\\Results\\Melothria\\ELCmapasNew"
#Text type parameter (text that goes between quotation marks "")
# Note: Path of a folder (existing) where the results will be saved
