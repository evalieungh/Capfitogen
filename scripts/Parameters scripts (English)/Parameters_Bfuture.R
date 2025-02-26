############################################
#Bfuture 2021 parameters script
############################################
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#Note: this tool requires a folder called "world" with all its resolutions to be saved inside the rdatamaps folder 
#that is, 1x1, 5x5, 10x10 and 20x20 where their respective layers of environmental variables 1950-2000 (present time) go
#This tool connects to a server in the U. of California to download some .zip files with global layers
#this download is necessary in the local installation version of CAPFITOGEN when the user has not downloaded
#directly those layers from worldclim.org and saved them in the rdatamapsf folder

#### How to use this script: Please configure each parameter, select all the lines of this script and click the "Run" button. After that, please open the corresponding tool script and run the process 

#### For each parameter (word in black color) please assign a value or select an option.

ruta<-"C:/CAPFITOGEN3"
#Text type parameter (text that goes between quotation marks "")
#### Note: It is the path where the structure of folders and files that are necessary to run the tools is located. It is usually a folder called CAPFITOGEN3 located in the root of the main hard drive (usually c:/)

local<-TRUE
#TRUE or FALSE type parameter
##### Note: For local a value of FALSE means that the tool will download the future layers from worldclim.org, so an internet connection is necessary. A FALSE value here means that the information must have previously been downloaded from Worldclim.org and the .zip file must be located in CAPFITOGEN3/rdatamapsf
##### Note2: If local=TRUE the following parameters such as resol1, ssp, gcm and proy must match the .zip that was downloaded from Worldclim.org and that is in the rdatamapsf folder

resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#resol1<-"Celdas 1x1 km aprox (30 arc-seg)"
#Translation note: celdas means cells
#Text type parameter (text that goes between quotation marks "")
###### NOTE: resol1 means the resolution of the layers that you want to download and/or adapt. resol1 must exist as a "1x1", "5x5", "10x10" or "20x20" folder inside C:/CAPFITOGEN3/rdatamaps/nombre_pais

#ssp<-126
#ssp<-245
ssp<-370
#ssp<-585
#Number type parameter (which will appear in blue in Rstudio) 
##### Note: ssp means shared socio-economic pathways, and the only options are 126, 245, 370 and 585

#gcm<-"ACCESS-ESM1-5"
#gcm<-"BCC-CSM2-MR"
#gcm<-"CanESM5"
#gcm<-"CanESM5-CanOE"
#gcm<-"CMCC-ESM2"
#gcm<-"CNRM-CM6-1"
#gcm<-"CNRM-CM6-1-HR"
#gcm<-"CNRM-ESM2-1"
#gcm<-"EC-Earth3-Veg-LR"
#gcm<-"EC-Earth3-Veg"
#gcm<-"FIO-ESM-2-0"
#gcm<-"GFDL-ESM4"
#gcm<-"GISS-E2-1-G"
#gcm<-"GISS-E2-1-H"
#gcm<-"HadGEM3-GC31-LL"
#gcm<-"INM-CM4-8"
#gcm<-"INM-CM5-0"
#gcm<-"IPSL-CM6A-LR"
#gcm<-"MIROC-ES2L"
#gcm<-"MIROC6"
#gcm<-"MPI-ESM1-2-HR"
#gcm<-"MPI-ESM1-2-LR"
gcm<-"MRI-ESM2-0"
#gcm<-"UKESM1-0-LL"
#Text type parameter (text that goes between quotation marks "")
##### Note: gcm means global circulate models, and the only options are the ones listed above.

#proy<-2030
#proy<-2050
#proy<-2070
proy<-2090
#Number type parameter (which will appear in blue in Rstudio)
##### Note: proy indicates the periods of time (future), and the only options are 2030, 2050, 2070 and 2090

varset<-"bioclimatic_indices"
#varset<-c("monthly_min_temp","monthly_max_temp")
#varset<-"monthly_max_temp"
#varset<-"monthly_min_temp"
#varset<-"monthly_tot_prec"
#Text type parameter (text that goes between quotation marks "")
##### Note: as can be seen, it is possible to download and/or adapt future layers from a single data set (options: "bioclimatic_indices", "monthly_min_temp", "monthly_max_temp" and "monthly_tot_prec") or from several sets at the same time (using the c() function)

croplayer<-TRUE
#TRUE or FALSE type parameter
#####Note: croplayer parameter tells the tool if the downloaded layers will be cropped by country or by points (TRUE) or if they will be left uncropped (FALSE) and then they will be equal to the "world" coverage

paiscrop<-TRUE #is only important if croplayer=TRUE.
#TRUE or FALSE type parameter
#####Note: You are going to crop with the outline (boundaries) of a country or region previously saved in rdatamaps.

pais<-"Europe"
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
#pais<-"Costa Rica"
#pais<-"nordic_countries"
#pais<-"subsaharan_countries"
#etc
#Text type parameter (text that goes between quotation marks "")
##### Note: The selected country/region (the first letter usually goes in uppercase as in "Ecuador") must have the corresponding folder (with the name of the country but there it goes in lowercase as in "ecuador") in rdatamaps.
##### Note2: the name of the country must be written as it appears in the lista_paises.xlsx table, and as it appears in the "Way to write country name (pais parameter)" column
##### Note3: If you have previously used the rLayer tool and generated a set of cropped layers according to the individual needs of the user, you can enter here a name defined in the "uname" parameter to use that set of layers

pasaporte<-"Mexico.txt" #it is only required if croplayer=TRUE and paiscrop=FALSE
#Text type parameter (text that goes between quotation marks "")
##### Note: the table that is referred to as "pasaporte" must be in the CAPFITOGEN3/Pasaporte folder

geoqual<-TRUE #it is only required if croplayer=TRUE and paiscrop=FALSE
#TRUE or FALSE type parameter
##### Note: geoqual only applies if the passport table has previously been analyzed using the GEOQUAL tool and already has the "TOTALQUAL100" column

totalqual<-50 #is only required if croplayer=TRUE and paiscrop=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note: it must be a value between 0 and 100. If the value stipulated for totalqual is very high and no record in the passport table has values higher than that value in the TOTALQUAL100 column, it will surely generate an error.

cropway<-"square" #it is only required if croplayer=TRUE and paiscrop=FALSE.
#cropway<-"buffer" #it is only required if croplayer=TRUE and paiscrop=FALSE
#Text type parameter (text that goes between quotation marks "")
##### Note: If cropway="square", cropping will be done using the maximum and minimum latitude and longitude of the distribution of points that come out of passport.
#### Note: If cropway="buffer", the collection sites (coordinates) included in the passport table will be used to create a circular area around each site with a radius specified in the buffer parameter


buffer<-20 #it is only required if croplayer=TRUE and paiscrop=FALSE
#Number type parameter (which will appear in blue in Rstudio)
##### Note: the buffer parameter means the radius in km, measured from each distribution point (points that come from the passport table) which will generate a circle... the fusion of these circles will generate an area that will be used to crop future layers. If the distance indicated in the buffer is very large (in thousands) it may not be doing a crop adjusted to a distribution but a great crop covering a large area. 

#uname<-"user2" #it is only required if croplayer=TRUE and paiscrop=FALSE
uname<-"user1"
#uname<-"user3"
#Text type parameter (text that goes between quotation marks "")
##### uname will be used to name the folder that will be created within rdatamaps folder, where the downloaded and cropped layers will be stored.
##### Note: For the local version of CAPFITOGEN, only the options "user1", "user2" and "user3" are offered.
