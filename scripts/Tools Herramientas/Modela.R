#####################################################################
# Script  de la herramienta Modela - Modela tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2021
#####################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script s?lo con pro?sitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicaci?n de su estudio los cr?ditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M., Iriondo, J.M., Torres, M.E., Lopez, F., Phillips, J., and Kell, S. 2021. CAPFITOGEN3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. ISBN: 978-958-505-038-9 URL:  http://www.capfitogen.net/en

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#COMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LINEAS DE ESTE SCRIPT Y DESPUES HAGA CLICK EN EL BOTON "RUN". LOS RESULTADOS LOS ENCONTRAR? DONDE LO INDICO EN EL SCRIPT DE PARAMETROS

##########################################################################################################
##########################################################################################################
#Parametros
#Lectura de la tabla previa de par?metros
setwd(paste(ruta))
tablaparametros<-read.delim(paste("ModelOptions/",partablename,sep=""))
pais<-paste(tablaparametros[2,2])
pasaporte<-paste(tablaparametros[3,2])
geoqual<-as.logical(paste(tablaparametros[4,2]))
totalqual<-as.numeric(paste(tablaparametros[5,2]))
distdup<-as.numeric(paste(tablaparametros[6,2]))
temp<-paste(tablaparametros[7,2])
gcm<-paste(tablaparametros[8,2])
rcp<-as.numeric(paste(tablaparametros[9,2]))
proy<-as.numeric(paste(tablaparametros[10,2]))
resol1<-paste(tablaparametros[11,2])
variabv<-paste(tablaparametros[12,2])
if(paste(tablaparametros[13,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[13,2]))
}
if(paste(tablaparametros[14,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[14,2]))
}
if(paste(tablaparametros[15,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[15,2]))
}
if(paste(tablaparametros[16,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[16,2]))
}
if(paste(tablaparametros[17,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[17,2]))
}
if(paste(tablaparametros[18,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[18,2]))
}
if(paste(tablaparametros[19,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[19,2]))
}
if(paste(tablaparametros[20,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[20,2]))
}
if(paste(tablaparametros[21,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[21,2]))
}
if(paste(tablaparametros[22,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[22,2]))
}
if(paste(tablaparametros[23,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[23,2]))
}
if(paste(tablaparametros[24,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[24,2]))
}
if(paste(tablaparametros[25,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[25,2]))
}
if(paste(tablaparametros[26,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[26,2]))
}
if(paste(tablaparametros[27,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[27,2]))
}
if(paste(tablaparametros[28,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[28,2]))
}
if(paste(tablaparametros[29,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[29,2]))
}
if(paste(tablaparametros[30,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[30,2]))
}
if(paste(tablaparametros[31,2])!=""){
  variabv<-c(variabv,paste(tablaparametros[31,2]))
}
latitud<-as.logical(paste(tablaparametros[32,2]))
if(is.na(latitud)){
  latitud<-FALSE
}
longitud<-as.logical(paste(tablaparametros[33,2]))
if(is.na(longitud)){
  longitud<-FALSE
}
genero<-paste(tablaparametros[34,2])
especie<-paste(tablaparametros[35,2])
ausencia<-paste(tablaparametros[36,2])
pasaporteb<-paste(tablaparametros[37,2])
figs<-as.logical(paste(tablaparametros[38,2]))
pasaportec<-paste(tablaparametros[39,2])
pareps<-as.numeric(paste(tablaparametros[40,2]))
pansel<-as.numeric(paste(tablaparametros[41,2]))
pastrat<-paste(tablaparametros[42,2])
padiskmin<-as.numeric(paste(tablaparametros[43,2]))
padiskmax<-as.numeric(paste(tablaparametros[44,2]))
pasreq<-as.numeric(paste(tablaparametros[45,2]))
paelc<-paste(tablaparametros[46,2])
if(paste(tablaparametros[47,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[47,2]))
}
if(paste(tablaparametros[48,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[48,2]))
}
if(paste(tablaparametros[49,2])!=""){
  paelc<-c(paelc,paste(tablaparametros[49,2]))
}
mapaelc<-paste(tablaparametros[50,2])
statelc<-paste(tablaparametros[51,2])
modelby<-paste(tablaparametros[52,2])
dismodel<-paste(tablaparametros[53,2])
modcompl<-paste(tablaparametros[54,2])
diseval<-paste(tablaparametros[55,2])
datadiv2<-paste(tablaparametros[56,2])
modelid<-paste(tablaparametros[57,2])
modelos<-paste(tablaparametros[58,2])
if(paste(tablaparametros[59,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[59,2]))
}
if(paste(tablaparametros[60,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[60,2]))
}
if(paste(tablaparametros[61,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[61,2]))
}
if(paste(tablaparametros[62,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[62,2]))
}
if(paste(tablaparametros[63,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[63,2]))
}
if(paste(tablaparametros[64,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[64,2]))
}
if(paste(tablaparametros[65,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[65,2]))
}
if(paste(tablaparametros[66,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[66,2]))
}
if(paste(tablaparametros[67,2])!=""){
  modelos<-c(modelos,paste(tablaparametros[67,2]))
}
if(paste(tablaparametros[68,2])==""){
  modelopc<-FALSE
}
if(paste(tablaparametros[68,2])!=""){
  modelopc<-as.logical(paste(tablaparametros[68,2]))
}
if(paste(tablaparametros[69,2])==""){
  GLM<-FALSE
}
if(paste(tablaparametros[69,2])!=""){
  GLM<-as.logical(paste(tablaparametros[69,2]))
}
GLMopt<-paste(tablaparametros[70,2])
if(paste(tablaparametros[71,2])==""){
  GBM<-FALSE
}
if(paste(tablaparametros[71,2])!=""){
  GBM<-as.logical(paste(tablaparametros[71,2]))
}
GBMopt<-paste(tablaparametros[72,2])
if(paste(tablaparametros[73,2])==""){
  GAM<-FALSE
}
if(paste(tablaparametros[73,2])!=""){
  GAM<-as.logical(paste(tablaparametros[73,2]))
}
GAMopt<-paste(tablaparametros[74,2])
if(paste(tablaparametros[75,2])==""){
  CTA<-FALSE
}
if(paste(tablaparametros[75,2])!=""){
  CTA<-as.logical(paste(tablaparametros[75,2]))
}
CTAopt<-paste(tablaparametros[76,2])
if(paste(tablaparametros[77,2])==""){
  ANN<-FALSE
}
if(paste(tablaparametros[77,2])!=""){
  ANN<-as.logical(paste(tablaparametros[77,2]))
}
ANNopt<-paste(tablaparametros[78,2])
if(paste(tablaparametros[79,2])==""){
  SRE<-FALSE
}
if(paste(tablaparametros[79,2])!=""){
  SRE<-as.logical(paste(tablaparametros[79,2]))
}
SREopt<-paste(tablaparametros[80,2])
if(paste(tablaparametros[81,2])==""){
  FDA<-FALSE
}
if(paste(tablaparametros[81,2])!=""){
  FDA<-as.logical(paste(tablaparametros[81,2]))
}
FDAopt<-paste(tablaparametros[82,2])
if(paste(tablaparametros[83,2])==""){
  MARS<-FALSE
}
if(paste(tablaparametros[83,2])!=""){
  MARS<-as.logical(paste(tablaparametros[83,2]))
}
MARSopt<-paste(tablaparametros[84,2])
if(paste(tablaparametros[85,2])==""){
  RF<-FALSE
}
if(paste(tablaparametros[85,2])!=""){
  RF<-as.logical(paste(tablaparametros[85,2]))
}
RFopt<-paste(tablaparametros[86,2])
if(paste(tablaparametros[87,2])==""){
  MAXENT<-FALSE
}
if(paste(tablaparametros[87,2])!=""){
  MAXENT<-as.logical(paste(tablaparametros[87,2]))
}
MAXENTopt<-paste(tablaparametros[88,2])
modrep<-as.numeric(paste(tablaparametros[89,2]))
datadiv<-as.numeric(paste(tablaparametros[90,2]))
preval<-paste(tablaparametros[91,2])
if(paste(tablaparametros[92,2])==""){
  imporvar<-0
}
if(paste(tablaparametros[92,2])!=""){
  imporvar<-as.numeric(paste(tablaparametros[92,2]))
}
testparam<-paste(tablaparametros[93,2])
if(paste(tablaparametros[94,2])!=""){
  testparam<-c(testparam,paste(tablaparametros[94,2]))
}
if(paste(tablaparametros[95,2])!=""){
  testparam<-c(testparam,paste(tablaparametros[95,2]))
}
if(paste(tablaparametros[96,2])!=""){
  testparam<-c(testparam,paste(tablaparametros[96,2]))
}
if(paste(tablaparametros[97,2])!=""){
  testparam<-c(testparam,paste(tablaparametros[97,2]))
}
if(paste(tablaparametros[98,2])==""){
  reescal<-FALSE
}
if(paste(tablaparametros[98,2])!=""){
  reescal<-as.logical(paste(tablaparametros[98,2]))
}
if(paste(tablaparametros[99,2])==""){
  modcomp<-FALSE
}
if(paste(tablaparametros[99,2])!=""){
  modcomp<-as.logical(paste(tablaparametros[99,2]))
}
if(paste(tablaparametros[100,2])==""){
  modprop<-FALSE
}
if(paste(tablaparametros[100,2])!=""){
  modprop<-as.logical(paste(tablaparametros[100,2]))
}
if(paste(tablaparametros[101,2])==""){
  proysome<-FALSE
}
if(paste(tablaparametros[101,2])!=""){
  proysome<-as.logical(paste(tablaparametros[101,2]))
}
proytest1<-paste(tablaparametros[102,2])
proytest1u<-as.numeric(paste(tablaparametros[103,2]))
if(paste(tablaparametros[104,2])==""){
  proysome2<-FALSE
}
if(paste(tablaparametros[104,2])!=""){
  proysome2<-as.logical(paste(tablaparametros[104,2]))
}
proytest2<-paste(tablaparametros[105,2])
proytest2u<-as.numeric(paste(tablaparametros[106,2]))
if(paste(tablaparametros[107,2])==""){
  binar<-FALSE
}
if(paste(tablaparametros[107,2])!=""){
  binar<-as.logical(paste(tablaparametros[107,2]))
}
binarmet<-paste(tablaparametros[108,2])
if(paste(tablaparametros[109,2])==""){
  maskout<-FALSE
}
if(paste(tablaparametros[109,2])!=""){
  maskout<-as.logical(paste(tablaparametros[109,2]))
}
if(paste(tablaparametros[110,2])==""){
  ensamb<-FALSE
}
if(paste(tablaparametros[110,2])!=""){
  ensamb<-as.logical(paste(tablaparametros[110,2]))
}
mod2bens<-paste(tablaparametros[111,2])
tipensam<-paste(tablaparametros[112,2])
if(paste(tablaparametros[113,2])==""){
  ensamet<-FALSE
}
if(paste(tablaparametros[113,2])!=""){
  ensamet<-as.logical(paste(tablaparametros[113,2]))
}
if(paste(tablaparametros[114,2])==""){
  testparam2<-FALSE
}
if(paste(tablaparametros[114,2])!=""){
  testparam2<-as.logical(paste(tablaparametros[114,2]))
}
testparam3<-paste(tablaparametros[115,2])
if(paste(tablaparametros[116,2])!=""){
  testparam3<-c(testparam3,paste(tablaparametros[116,2]))
}
if(paste(tablaparametros[117,2])!=""){
  testparam3<-c(testparam3,paste(tablaparametros[107,2]))
}
if(paste(tablaparametros[118,2])!=""){
  testparam3<-c(testparam3,paste(tablaparametros[118,2]))
}
if(paste(tablaparametros[119,2])!=""){
  testparam3<-c(testparam3,paste(tablaparametros[119,2]))
}
if(paste(tablaparametros[120,2])==""){
  probmean<-FALSE
}
if(paste(tablaparametros[120,2])!=""){
  probmean<-as.logical(paste(tablaparametros[120,2]))
}
if(paste(tablaparametros[121,2])==""){
  probcv<-FALSE
}
if(paste(tablaparametros[121,2])!=""){
  probcv<-as.logical(paste(tablaparametros[121,2]))
}
if(paste(tablaparametros[122,2])==""){
  probci<-FALSE
}
if(paste(tablaparametros[122,2])!=""){
  probci<-as.logical(paste(tablaparametros[122,2]))
}
probalfa<-paste(tablaparametros[123,2])
if(paste(tablaparametros[124,2])==""){
  probmedian<-FALSE
}
if(paste(tablaparametros[124,2])!=""){
  probmedian<-as.logical(paste(tablaparametros[124,2]))
}
if(paste(tablaparametros[125,2])==""){
  probca<-FALSE
}
if(paste(tablaparametros[125,2])!=""){
  probca<-as.logical(paste(tablaparametros[125,2]))
}
if(paste(tablaparametros[126,2])==""){
  probmw<-FALSE
}
if(paste(tablaparametros[126,2])!=""){
  probmw<-as.logical(paste(tablaparametros[126,2]))
}
probmwd<-paste(tablaparametros[127,2])
testNAs<-paste(tablaparametros[128,2])
resultados<-paste(tablaparametros[129,2])

###########################################################################################################
#####ARRANQUE DEL SCRIPT###################################################################################
###########################################################################################################

setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.Modela.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Modela.txt", append=TRUE)
write("______Herramienta/Tool Modela________", file="Parametros.Parameters.Modela.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.Modela.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("distdup:", distdup,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("temp:", temp,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("gcm:", gcm,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("rcp:", rcp,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proy:", proy,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("variabv:", variabv,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("genero:", genero,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("especie:", especie,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("ausencia:", ausencia,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pasaporteb:", pasaporteb,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("figs:", figs,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pasaportec:", pasaportec,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pareps:", pareps,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pansel:", pansel,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pastrat:", pastrat,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("padiskmin:", padiskmin,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("padiskmax:", padiskmax,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("pasreq:", pasreq,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("paelc:", paelc,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("mapaelc:", mapaelc,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("statelc:", statelc,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modelid:", modelid,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modelos:", modelos,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modelopc:", modelopc,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GLM:", GLM,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GLMopt:", GLMopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GBM:", GBM,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GBMopt:", GBMopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GAM:", GAM,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("GAMopt:", GAMopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("CTA:", CTA,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("CTAopt:", CTAopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("ANN:", ANN,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("ANNopt:", ANNopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("SRE:", SRE,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("SREopt:", SREopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("FDA:", FDA,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("FDAopt:", FDAopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("MARS:", MARS,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("MARSopt:", MARSopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("RF:", RF,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("RFopt:", RFopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("MAXENT:", MAXENT,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("MAXENTopt:", MAXENTopt,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modrep:", modrep,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("datadiv:", datadiv,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("preval:", preval,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("imporvar:", imporvar,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("testparam:", testparam,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("reescal:", reescal,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modcomp:", modcomp,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("modprop:", modprop,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proysome:", proysome,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proytest1:", proytest1,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proytest1u:", proytest1u,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proysome2:", proysome2,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proytest2:", proytest2,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("proytest2u:", proytest2u,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("binar:", binar,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("binarmet:", binarmet,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("maskout:", maskout,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("ensamb:", ensamb,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("mod2bens:", mod2bens,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("tipensam:", tipensam,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("ensamet:", ensamet,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("testparam2:", testparam2,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("testparam3:", testparam3,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probmean:", probmean,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probcv:", probcv,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probci:", probci,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probalfa:", probalfa,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probmedian:", probmedian,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probca:", probca,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probmw:", probmw,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("probmwd:", probmwd,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("testNAs:", testNAs,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.Modela.txt", append=TRUE)

#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO Modela________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

write("1.Terminado proceso de determinaci?n de directorio de trabajo", file="Error/process_info.txt", append=TRUE)
#introducci?n tabla de lista de pa?ses y resoluciones de extracci?n a elegir y traducci?n

#Check e instalacion si a lugar
packages2<-vector()
if(system.file(package="sp")==""){
  packages2<-append(packages2,"sp")
}
if(system.file(package="raster")==""){
  packages2<-append(packages2,"raster")
}
if(system.file(package="maptools")==""){
  packages2<-append(packages2,"maptools")
}
if(system.file(package="rgdal")==""){
  packages2<-append(packages2,"rgdal")
}
if(system.file(package="dismo")==""){
  packages2<-append(packages2,"dismo")
}
if(system.file(package="cluster")==""){
  packages2<-append(packages2,"cluster")
}
if(system.file(package="ade4")==""){
  packages2<-append(packages2,"ade4")
}
if(system.file(package="labdsv")==""){
  packages2<-append(packages2,"labdsv")
}
if(system.file(package="biomod2")==""){
  packages2<-append(packages2,"biomod2")
}
if(system.file(package="plyr")==""){
  packages2<-append(packages2,"plyr")
}

#Instalar los que hagan falta
if(length(packages2)>0){
  install.packages(setdiff(packages2, rownames(installed.packages())))
}
#Carga de paquetes

library(sp)
library(raster)
library(maptools)
library(rgdal)
library(dismo)
library(cluster)
library(ade4)
library(labdsv)
library(biomod2)
library(plyr)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

#Transformaci?n pais upper to lowercase
pais<-tolower(pais)

#Check del nombre del set de capas ecogeograficas en rdatamap
#Carga del pais
loadError<-FALSE
abcd<-try(load("lista.paises.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  Paises<-read.delim("lista.paises.txt")
}
rm(abcd)
rm(loadError)

pais2<-data.frame(pais)
colnames(pais2)[1]<-"Paises"

abcd<-merge(Paises,pais2,by="Paises",all.y=TRUE)

if(is.na(abcd[1,2])){
  stop("pais parameter introduced by the user is not the expected, please check lista_paises.xlsx file for the correct option",call.=FALSE)
}
rm(abcd)
rm(pais2)

write("2.Terminado proceso de instalacion de paquetes", file="Error/process_info.txt", append=TRUE)
#activar paquetes ya instalados y necesarios

###########IntroDatos y Capas###############
#Intro data y limpieza
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE))
pasaporte<-subset(pasaporte,!is.na(DECLONGITUDE))
#Eliminaci?n entradas bajo umbral geoqual
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}

write("4.Terminado proceso de intro datos presencia", file="Error/process_info.txt", append=TRUE)


#Pasaporte sin duplicados espaciales
if (mean(pasaporte$DECLATITUDE)<23&mean(pasaporte$DECLATITUDE> -23)){
  distdup1<-distdup*0.00833
}
if ((mean(pasaporte$DECLATITUDE)>23&mean(pasaporte$DECLATITUDE)<45)|(mean(pasaporte$DECLATITUDE)< -23&mean(pasaporte$DECLATITUDE)> -45)){
  distdup1<-distdup*0.00975
}
if ((mean(pasaporte$DECLATITUDE)>45&mean(pasaporte$DECLATITUDE)<67)|(mean(pasaporte$DECLATITUDE)< -45&mean(pasaporte$DECLATITUDE)> -67)){
  distdup1<-distdup*0.0127
}
if (mean(pasaporte$DECLATITUDE)>67|mean(pasaporte$DECLATITUDE)< -67){
  distdup1<-distdup*0.02299
}
#con este distdup1 se salta de aqu? a arreglo puntos en Modelizaci?n

#Intro pa?s y resoluci?n
setwd(paste(ruta))
#Definici?n pa?s
#Evitar error por load de lista.paises.RData
loadError<-FALSE
abcd<-try(load("lista.paises.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  Paises<-read.delim("lista.paises.txt")
}
rm(abcd)
rm(loadError)

pais<-data.frame(pais)
colnames(pais)[1]<-"Paises"
pais<-merge(Paises,pais,by="Paises",all.y=TRUE)
pais<-paste(pais[1,2])
pais<-tolower(pais)
#Definici?n resoluci?n
#Condicional resol por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("resol.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  resol<-read.delim("resol.txt")
}
rm(abcd)
rm(loadError)

resol<-subset(resol,resolucion==paste(resol1))
resol<-as.character(resol[1,2])
write("5.Terminado proceso de determinar pais y resol", file="Error/process_info.txt", append=TRUE)


#############################################################
#Extracci?n sobre capas de Presente
#############################################################
#Creaci?n capas lat/long si son requeridos
if(longitud){
  long<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
  long2<-rasterToPoints(long)
  long<-rasterize(long2[,c("x","y")],long,long2[,"x"])
  names(long)<-"longitude"
  rm(long2)
}

if(latitud){
  lat<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
  lat2<-rasterToPoints(lat)
  lat<-rasterize(lat2[,c("x","y")],lat,lat2[,"y"])
  names(lat)<-"latitude"
  rm(lat2)
}

write("6.Terminado proceso de crear capas lat/long", file="Error/process_info.txt", append=TRUE)

#Resto de variables
#Condicional figvartotal por si no lo abre v?a load.RData
loadError<-FALSE
abcd<-try(load("figvartotal.RData"),silent=TRUE)
loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
if(loadError){
  figvartotal<-read.delim("figvartotal.txt")
}
rm(abcd)
rm(loadError)

variabv1<-as.data.frame(variabv)
colnames(variabv1)[1]<-"VARDESCR"
variabv1<-merge(figvartotal,variabv1, by="VARDESCR", all=FALSE)
variabv1<-as.character(variabv1[,3])
variabv1<-variabv1[order(variabv1)]


###Arreglo de un stack ?nico
#Sin lat/long
if(!latitud&!longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  expstack<-do.call("stack",explana)
  for(i in 1:length(variabv1)){
    expstack@layers[[i]]@data@names<-variabv1[i]
  }
}
#Con lat
if(latitud&!longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-lat
  expstack<-do.call("stack",explana)
  variabvx<-c(variabv1,"lat")
  for(i in 1:length(variabvx)){
    expstack@layers[[i]]@data@names<-variabvx[i]
  }
}
#Con long
if(!latitud&longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-long
  expstack<-do.call("stack",explana)
  variabvx<-c(variabv1,"long")
  for(i in 1:length(variabvx)){
    expstack@layers[[i]]@data@names<-variabvx[i]
  }
}
#Con lat/long
if(latitud&longitud){
  totvar<-length(variabv1)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv1[i],".tif",sep=""))
  }
  explana[[totvar+1]]<-long
  explana[[totvar+2]]<-lat
  expstack<-do.call("stack",explana)
  variabvx<-c(variabv1,"long","lat")
  for(i in 1:length(variabvx)){
    expstack@layers[[i]]@data@names<-variabvx[i]
  }
}
#Correccion de res y extent en soil y bioclim layers
elev<-raster(paste("rdatamaps/",pais,"/",resol,"/alt.tif",sep=""))
elevext<-extent(elev)
elevres<-res(elev)
if(vvv<=2019){
  edaph<-read.delim("edaph.txt")
  bioclim<-read.delim("bioclim.txt")
}
if(vvv>2019){
  load("edaph.RData")
  load("bioclim.RData")
}

aaa<-names(expstack)
bbb<-edaph[,"VARCODE"]
ccc<-bioclim[,"VARCODE"]
for(i in 1:length(aaa)){
  for(j in 1:length(bbb)){
    if(aaa[i]==bbb[j]){
      extent(expstack@layers[[i]])<-elevext
      res(expstack@layers[[i]])<-elevres
    }
  }
  for(k in 1:length(ccc)){
    if(aaa[i]==ccc[k]){
      extent(expstack@layers[[i]])<-elevext
      res(expstack@layers[[i]])<-elevres
    }
  }
}
#remoci?n restos
if(temp!="future"){
  rm(elev)
  rm(elevext)
  rm(elevres)
  rm(edaph)
  rm(bioclim)
  rm(aaa)
  rm(bbb)
  rm(ccc)
}
if(temp=="future"){
  rm(elev)
  rm(edaph)
  rm(bioclim)
  rm(aaa)
}
write("6.5 Terminado proceso de carga de capas y stack presente", file="Error/process_info.txt", append=TRUE)

#############################################################
#Extracci?n sobre capas de futuro
#############################################################
if(temp=="future"){  
  #Partici?n del set de var en dos grupos, bioclim  y el resto
  if(vvv<=2019){
    bioclim<-read.delim("bioclim.txt")
  }
  if(vvv>2019){
    load("bioclim.RData")
  }
  variabv3<-as.data.frame(variabv)
  colnames(variabv3)[1]<-"VARDESCR"
  variabv3<-merge(bioclim,variabv3, by="VARDESCR", all=FALSE)
  variabv3<-as.character(variabv3[,"VARDESCR"])
  variabv3<-variabv3[order(variabv3)]
  #variab3 son s?lo las variables bioclimaticas
  #eliminaci?n de estas variables bioclim en un set llamado variabv2
  variabv2<-variabv
  if(length(variabv3)>0){
    for(i in 1:length(variabv3)){
      variabv2<-subset(variabv2,variabv2!=variabv3[i])
    }
    #arreglo de varcodes para todas las var exceptio bioclim
    variabv2<-as.data.frame(variabv2)
    colnames(variabv2)[1]<-"VARDESCR"
    variabv2<-merge(figvartotal,variabv2, by="VARDESCR", all=FALSE)
    variabv2<-as.character(variabv2[,"VARCODE"])
    variabv2<-variabv2[order(variabv2)]
  }
  #Si no hay var de bioclima (que no tiene sentido queriendo proyectar futuro)
  if(!length(variabv3)>0){
    stop("You are trying to use future bioclim data but are not including any bioclim variable in the set of variables to modeling")
  }
  #arreglo de varcodes para las bioclim
  variabv3<-as.data.frame(variabv3)
  colnames(variabv3)[1]<-"VARDESCR"
  variabv3<-merge(figvartotal,variabv3, by="VARDESCR", all=FALSE)
  variabv3<-as.character(variabv3[,"VARCODE"])
  variabv3<-variabv3[order(variabv3)]
  ###Arreglo de un stack bio de futuro
  totvar<-length(variabv3)
  explana<-list()
  for(i in 1:totvar){
    explana[[i]]<-raster(paste("rdatamapsf/",pais,"/",gcm,"_",rcp,"_",proy,"/",resol,"/",variabv3[i],".tif",sep=""))
  }
  expstack1<-do.call("stack",explana)
  for(i in 1:length(variabv3)){
    expstack1@layers[[i]]@data@names<-variabv3[i]
  }
  
  ###Arreglo de un stack de suelos/geo de presente
  #Sin lat/long
  if(length(variabv2)>0){
    if(!latitud&!longitud){
      totvar<-length(variabv2)
      explana<-list()
      for(i in 1:totvar){
        explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv2[i],".tif",sep=""))
      }
      expstack2<-do.call("stack",explana)
      for(i in 1:length(variabv2)){
        expstack2@layers[[i]]@data@names<-variabv2[i]
      }
    }
    #Con lat
    if(latitud&!longitud){
      totvar<-length(variabv2)
      explana<-list()
      for(i in 1:totvar){
        explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv2[i],".tif",sep=""))
      }
      explana[[totvar+1]]<-lat
      expstack2<-do.call("stack",explana)
      variabvx<-c(variabv2,"lat")
      for(i in 1:length(variabvx)){
        expstack2@layers[[i]]@data@names<-variabvx[i]
      }
    }
    #Con long
    if(!latitud&longitud){
      totvar<-length(variabv2)
      explana<-list()
      for(i in 1:totvar){
        explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv2[i],".tif",sep=""))
      }
      explana[[totvar+1]]<-long
      expstack2<-do.call("stack",explana)
      variabvx<-c(variabv2,"long")
      for(i in 1:length(variabvx)){
        expstack2@layers[[i]]@data@names<-variabvx[i]
      }
    }
    #Con lat/long
    if(latitud&longitud){
      totvar<-length(variabv2)
      explana<-list()
      for(i in 1:totvar){
        explana[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",variabv2[i],".tif",sep=""))
      }
      explana[[totvar+1]]<-long
      explana[[totvar+2]]<-lat
      expstack2<-do.call("stack",explana)
      variabvx<-c(variabv2,"long","lat")
      for(i in 1:length(variabvx)){
        expstack2@layers[[i]]@data@names<-variabvx[i]
      }
    }
    write("7.Terminado proceso de carga de capas y stack", file="Error/process_info.txt", append=TRUE)
  }
  
  #A?adir Lat-long a stack vac?o de geo-edaph
  
  if(!length(variabv2)>0){
    if(latitud&!longitud){
      expstack2<-stack(lat)
      variabv2<-"latitude"
    }
    if(!latitud&longitud){
      expstack2<-stack(long)
      variabv2<-"longitude"
    }
    if(latitud&longitud){
      expstack2<-stack(long,lat)
      variabv2<-c("longitude","latitude")
    } 
  }
  
  ######conjunci?n de stacks cuando hay mas var que bioclim
  if(length(variabv2)>0){
    expstack1<-stack(expstack1,expstack2)
    #Aseguramiento de que layers del stack estar?n en mismo orden que stack original presente
    expstack1<-stack(expstack1@layers[order(names(expstack1))])
    rm(expstack2)
  }
  
  #####arreglo para nombres de capas iguales
  
  if(latitud&!longitud){
    variabv<-c(variabv,"latitude")
  }
  if(!latitud&longitud){
    variabv<-c(variabv,"longitude")
  }
  if(latitud&longitud){
    variabv<-c(variabv,"longitude","latitude")
  }
  if(length(variabv)!=length(expstack@layers)|length(variabv)!=length(expstack1@layers)){
    stop("The number of 'present' and 'future' variables does not match. Please check your variable selection")
  }
  #Correccion de res y extent en soil layers
  aaa<-names(expstack1)
  for(i in 1:length(aaa)){
    for(j in 1:length(bbb)){
      if(aaa[i]==bbb[j]){
        extent(expstack1@layers[[i]])<-elevext
        res(expstack1@layers[[i]])<-elevres
      }
    }
    for(k in 1:length(ccc)){
      if(aaa[i]==ccc[k]){
        extent(expstack1@layers[[i]])<-elevext
        res(expstack1@layers[[i]])<-elevres
      }
    }
  }
  rm(aaa)
  rm(bbb)
  rm(ccc)
  rm(elevext)
  rm(elevres)
}

########################################################################
########################################################################
###########Data input y Model configuration#############################
###Arreglo puntos
puntos0<-pasaporte[,c("DECLONGITUDE","DECLATITUDE")]
#SpatialPoints para BIOMOD_FormatingData
puntos<-SpatialPoints(puntos0)
#SpatialPointsDataFrame para PA por ELCmapa
puntos0<-SpatialPointsDataFrame(puntos0,pasaporte)
#Remoci?n duplis
puntos<-remove.duplicates(puntos,zero=distdup1)
puntos0<-remove.duplicates(puntos0,zero=distdup1)
write("8.Terminado proceso remoci?n duplicados espaciales", file="Error/process_info.txt", append=TRUE)
##################################################################
#Remoci?n de puntos que no extraen info
#Validaci?n de que todos los puntos extraen y no quedar?n NAs
if(testNAs){
  testNAs<-data.frame(extract(expstack,puntos))
  xxx<-vector()
  for(i in 1:nrow(testNAs)){
    if(any(is.na(testNAs[i,c(1:ncol(testNAs))]))){
      puntos<-puntos[-i,]
      puntos0<-puntos0[-i,]
      xxx<-c(xxx,puntos0$ACCENUMB[i])
    }
  }
  write.table(xxx, file = paste(resultados,"/ACCENUMBwithoutExtraction.txt",sep=""), sep = "/t", row.names = FALSE, qmethod = "double")
  rm(testNAs)
  rm(xxx)
}

##################################################################
###Arreglo input para biomod y Dismo
if(ausencia=="absence"){
  if(figs){
    setwd(paste(resultados))
    dir.create(as.vector(paste("Absences_NonEval_FIGS_",genero,"_",especie,sep="")))
    resultadosabsfigs<-paste(resultados,"/Absences_NonEval_FIGS_",genero,"_",especie,sep="")
    setwd(paste(ruta))
    #Entrada Ausencias reales
    pasaporteb<-read.delim(paste("Pasaporte/",pasaporteb,sep=""))
    pasaporteb<-subset(pasaporteb,!is.na(DECLATITUDE))
    pasaporteb<-subset(pasaporteb,!is.na(DECLONGITUDE))
    #Eliminaci?n entradas bajo umbral geoqual
    if(geoqual){
      pasaporteb<-subset(pasaporteb,TOTALQUAL100>=totalqual)
    }
    #Entrada Germoplasma sin evaluar
    pasaportec<-read.delim(paste("Pasaporte/",pasaportec,sep=""))
    pasaportec<-subset(pasaportec,!is.na(DECLATITUDE))
    pasaportec<-subset(pasaportec,!is.na(DECLONGITUDE))
    #Eliminaci?n entradas bajo umbral geoqual
    if(geoqual){
      pasaportec<-subset(pasaportec,TOTALQUAL100>=totalqual)
    }
    #Remoci?n duplicados espaciales ausencias
    puntosb<-pasaporteb[,c("DECLONGITUDE","DECLATITUDE")]
    puntosb<-SpatialPointsDataFrame(puntosb,pasaporteb)
    puntosb<-remove.duplicates(puntosb,zero=distdup1)
    #Remoci?n duplicados germo sin evaluar
    puntosc<-pasaportec[,c("DECLONGITUDE","DECLATITUDE")]
    puntosc<-SpatialPointsDataFrame(puntosc,pasaportec)
    puntosc<-remove.duplicates(puntosc,zero=distdup1)
    if(ncol(puntos0@data)!=ncol(puntosb@data)){
      stop("Number of columns from presence and absence tables does not match")
    }
    PresAbsFigs<-data.frame(rbind(puntos0@data,puntosb@data))
    PresAbs<-c(rep(1,length(puntos0)),rep(0,length(puntosb)))
    PresAbsFigs<-data.frame(PresAbsFigs,PresAbs)
    varres<-PresAbsFigs[,"PresAbs"]
    puntos<-PresAbsFigs[,c("DECLONGITUDE","DECLATITUDE")]
    #Ahora el formato BIOMOD_FormatingData
    inputs<-BIOMOD_FormatingData(varres,expstack,resp.xy=puntos,
                                 resp.name=paste(genero,especie,sep="."),na.rm=FALSE)
    #Tablas y shapefile de entrada de datos
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    #Exportaci?n
    setwd(paste(resultadosabsfigs))
    write.table(extract.table,file="extraction_table_PresAbs.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(extract.table,file="extraction_table_PresAbs.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile2,dsn=paste(resultadosabsfigs),layer="Final_extraction_PresAbs",driver="ESRI Shapefile")
    writeOGR(puntosc,dsn=paste(resultadosabsfigs),layer="points_to_be_predicted",driver="ESRI Shapefile")
    #Reporte
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
    write(paste("Data introduced"), file="input_data.txt", append=TRUE)
    origsize<-nrow(pasaporte)
    write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
    origsize<-length(puntos)
    write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
    pressize<-length(which(inputs@data.species==1))
    write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
    envarsize<-length(inputs@data.env.var)
    write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    setwd(paste(ruta))
  }
  #Si es para una modelizaci?n presencia/ausencias reales
  if(!figs){
    setwd(paste(resultados))
    dir.create(as.vector(paste("Real_Absences_",genero,"_",especie,sep="")))
    resultadosabs<-paste(resultados,"/Real_Absences_",genero,"_",especie,sep="")
    setwd(paste(ruta))
    #Entrada Ausencias reales
    pasaporteb<-read.delim(paste("Pasaporte/",pasaporteb,sep=""))
    pasaporteb<-subset(pasaporteb,!is.na(DECLATITUDE))
    pasaporteb<-subset(pasaporteb,!is.na(DECLONGITUDE))
    #Eliminaci?n entradas bajo umbral geoqual
    if(geoqual){
      pasaporteb<-subset(pasaporteb,TOTALQUAL100>=totalqual)
    }
    #Remoci?n duplicados espaciales ausencias
    puntosb<-pasaporteb[,c("DECLONGITUDE","DECLATITUDE")]
    puntosb<-SpatialPointsDataFrame(puntosb,pasaporteb)
    puntosb<-remove.duplicates(puntosb,zero=distdup1)
    #Remoci?n duplicados germo sin evaluar
    if(ncol(puntos0@data)!=ncol(puntosb@data)){
      stop("Number of columns from presence and absence tables does not match")
    }
    PresAbsReal<-data.frame(rbind(puntos0@data,puntosb@data))
    PresAbs<-c(rep(1,length(puntos0)),rep(0,length(puntosb)))
    PresAbsReal<-data.frame(PresAbsReal,PresAbs)
    varres<-PresAbsReal[,"PresAbs"]
    puntos<-PresAbsReal[,c("DECLONGITUDE","DECLATITUDE")]
    #Ahora el formato BIOMOD_FormatingData ("inputs" para la parte figs)
    inputs<-BIOMOD_FormatingData(varres,expstack,resp.xy=puntos,
                                 resp.name=paste(genero,especie,sep="."),na.rm=TRUE)
    #Tablas y shapefile de entrada de datos
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    
    #Exportaci?n
    setwd(paste(resultadosabs))
    write.table(extract.table,file="extraction_table_PresAbs.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(extract.table,file="extraction_table_PresAbs.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile2,dsn=paste(resultadosabs),layer="Final_extraction_PresAbs",driver="ESRI Shapefile")
    #Reporte
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
    write(paste("Data introduced"), file="input_data.txt", append=TRUE)
    origsize<-nrow(pasaporte)
    write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
    origsize<-length(puntos)
    write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
    pressize<-length(which(inputs@data.species==1))
    write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
    envarsize<-length(inputs@data.env.var)
    write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    setwd(paste(ruta))
  }
}

#Pseudoausencias por ELC
if(ausencia=="pseudo absence"){
  if(pastrat=="elc"){
    #Creaci?n directorio en Resultados
    setwd(paste(resultados))
    dir.create(as.vector(paste("PseudoAbsences_ELC_",genero,"_",especie,sep="")))
    resultadospaelc<-paste(resultados,"/PseudoAbsences_ELC_",genero,"_",especie,sep="")
    setwd(paste(ruta))
    
    #Introducci?n y c?lculo de cuartiles en mapa completo ELC
    mapaelc<-raster(paste("ELCmapas/",mapaelc,sep=""))
    write("8.1.Terminado carga de mapa ELC formato paquete raster", file="Error/process_info.txt", append=TRUE)
    fmapaelc<-as.data.frame(freq(mapaelc,merge=TRUE))
    colnames(fmapaelc)[1]<-"ELC_CAT"
    colnames(fmapaelc)[2]<-"Frec_celdas"
    fmapaelc<-subset(fmapaelc,!is.na(fmapaelc[,1]))
    cuartil25<-quantile(fmapaelc[,2],probs=0.25,type=3)
    cuartil50<-quantile(fmapaelc[,2],probs=0.5,type=3)
    cuartil75<-quantile(fmapaelc[,2],probs=0.75,type=3)
    tablaclas<-data.frame(nrow=1,ncol=3)
    tablaclas[1,1]<-cuartil25
    colnames(tablaclas)[1]<-"25%"
    tablaclas[1,2]<-cuartil50
    colnames(tablaclas)[2]<-"50%"
    tablaclas[1,3]<-cuartil75
    colnames(tablaclas)[3]<-"75%"
    PorcentajeELC<-vector(length=length(fmapaelc$Frec_celdas))
    sumaELC<-sum(fmapaelc$Frec_celdas)
    ClasificacionMapaELC<-vector(length=length(fmapaelc$Frec_celdas))
    for(i in 1:length(fmapaelc$Frec_celdas)){
      ClasificacionMapaELC[i]<-ifelse(fmapaelc$Frec_celdas[i]==0,"nula/null",
                                      ifelse(fmapaelc$Frec_celdas[i]>0&fmapaelc$Frec_celdas[i]<=cuartil25,"baja/low",
                                             ifelse(fmapaelc$Frec_celdas[i]<=cuartil50,"media baja/mid-low",
                                                    ifelse(fmapaelc$Frec_celdas[i]<=cuartil75,"media alta/mid-high","alta/high"))))
      PorcentajeELC[i]<-(fmapaelc$Frec_celdas[i]*100)/sumaELC
    }
    elc<-cbind(fmapaelc,PorcentajeELC,ClasificacionMapaELC)
    #Extracci?n categor?a
    BGcat<-extract(mapaelc,puntos0)
    write("8.2.Terminado extracci?n categor?a mapa ELC", file="Error/process_info.txt", append=TRUE)
    pasaporte2<-data.frame(puntos0,BGcat)
    setwd(paste(resultadospaelc))
    write.table(pasaporte2,file="Genbank_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pasaporte2,file="Genbank_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Intro de columna de categor?as
    statelc<-read.delim(paste("ELCmapas/",statelc,sep=""))
    statelc<-as.data.frame(statelc[,"ELC_CAT"])
    colnames(statelc)[1]<-"ELC_CAT"
    #Tablas de frecuencias desde pasaporte o BG
    BGfrec<-as.data.frame(table(pasaporte2[,"BGcat"]))
    colnames(BGfrec)[1]<-"ELC_CAT"
    colnames(BGfrec)[2]<-"BGfrec"
    #Asignaci?n a lista categor?as total
    statelc<-merge(statelc,BGfrec,by="ELC_CAT",all.x=TRUE)
    for (i in 1:length(statelc$BGfrec)){
      if (is.na(statelc$BGfrec[i])){
        statelc$BGfrec[i]<-0
      }
    }
    #S?lo para frecuencias diferentes a cero (no nulas), c?lculo cuartil
    FrecTotal<-subset(statelc,BGfrec>0)  
    cuartil25<-quantile(FrecTotal$BGfrec,probs=0.25,type=3)
    cuartil50<-quantile(FrecTotal$BGfrec,probs=0.5,type=3)
    cuartil75<-quantile(FrecTotal$BGfrec,probs=0.75,type=3)
    tablaclas<-data.frame(nrow=1,ncol=3)
    tablaclas[1,1]<-cuartil25
    colnames(tablaclas)[1]<-"25%"
    tablaclas[1,2]<-cuartil50
    colnames(tablaclas)[2]<-"50%"
    tablaclas[1,3]<-cuartil75
    colnames(tablaclas)[3]<-"75%"
    clasificacionBG<-vector(length=length(statelc$BGfrec))
    PorcentajeBG<-vector(length=length(statelc$BGfrec))
    sumaBG<-sum(statelc$BGfrec)
    #Asignaci?n de interpretaci?n cuartiles BG
    for(i in 1:length(statelc$BGfrec)){
      clasificacionBG[i]<-ifelse(statelc$BGfrec[i]==0,"nula/null",
                                 ifelse(statelc$BGfrec[i]>0&statelc$BGfrec[i]<=cuartil25,"baja/low",
                                        ifelse(statelc$BGfrec[i]>cuartil25&statelc$BGfrec[i]<=cuartil50,"media baja/mid-low",
                                               ifelse(statelc$BGfrec[i]>cuartil50&statelc$BGfrec[i]<=cuartil75,"media alta/mid-high","alta/high"))))
      PorcentajeBG[i]<-(statelc$BGfrec[i]*100)/sumaBG
    }
    statelc<-cbind(statelc,PorcentajeBG,clasificacionBG)
    statelc<-merge(statelc,elc,by="ELC_CAT")
    Class_BG<-vector(length=length(statelc[,1]))
    Class_ELC<-vector(length=length(statelc[,1]))
    #Asignaci?n valores num?ricos a cuartiles tanto para BG como para mapaELC
    for(i in 1:length(statelc[,1])){
      Class_BG[i]<-ifelse(statelc$clasificacionBG[i]=="nula/null",0,
                          ifelse(statelc$clasificacionBG[i]=="baja/low",1,
                                 ifelse(statelc$clasificacionBG[i]=="media baja/mid-low",2,
                                        ifelse(statelc$clasificacionBG[i]=="media alta/mid-high",3,4))))
      Class_ELC[i]<-ifelse(statelc$ClasificacionMapaELC[i]=="baja/low",1,
                           ifelse(statelc$ClasificacionMapaELC[i]=="media baja/mid-low",2,
                                  ifelse(statelc$ClasificacionMapaELC[i]=="media alta/mid-high",3,4)))
    }
    #Creaci?n mapa final ELC recategorizado por cuartiles
    statelc2<-cbind(statelc,Class_BG,Class_ELC)
    liminf<-statelc2$ELC_CAT-0.5
    limsup<-statelc2$ELC_CAT+0.5
    reclass2<-cbind(liminf,limsup,statelc2$Class_BG)
    Class_Sp<-reclassify(mapaelc,reclass2)
    setwd(paste(resultadospaelc))
    writeRaster(Class_Sp,filename="mapa_Class_Sp.grd",overwrite=T,datatype='FLT4S')
    writeRaster(Class_Sp,filename="mapa_Class_Sp.tif",overwrite=T,datatype='FLT4S')
    setwd(paste(ruta))
    #Conversi?n de mapa cuartiles a mapa zonas aptas para seleccionar PA 
    #Evitar error por load de FreqELC.RData
    loadError<-FALSE
    abcd<-try(load("FreqELC.RData"),silent=TRUE)
    loadError <- (is(abcd, 'try-error')|is(abcd,'error'))
    if(loadError){
      FreqELC<-read.delim("FreqELC.txt")
    }
    rm(abcd)
    rm(loadError)
    
    paelc1<-data.frame(paelc,rep(1,length(paelc)))
    colnames(paelc1)[1]<-"clasificacionBG"
    colnames(paelc1)[2]<-"PA_availab"
    FreqELC<-merge(FreqELC,paelc1, by="clasificacionBG", all=TRUE)
    liminf<-FreqELC$value-0.5
    limsup<-FreqELC$value+0.5
    reclass3<-cbind(liminf,limsup,FreqELC$PA_availab)
    PA_availab<-reclassify(Class_Sp,reclass3)
    #Salvar mapa reconvertido por Disponibilidad para PA
    setwd(paste(resultadospaelc))
    writeRaster(PA_availab,filename="PA_availab.grd",overwrite=T,datatype='FLT4S')
    writeRaster(PA_availab,filename="PA_availab.tif",overwrite=T,datatype='FLT4S')
    colnames(statelc)[2]<-"BGfrec/GBfreq"
    colnames(statelc)[3]<-"PorcentajeBG/GBpercentage"
    colnames(statelc)[4]<-"Clasificacion_cuartil_BG/GB_quartile_classification"
    colnames(statelc)[5]<-"FrecTotalceldas/TotalCellsFreq"
    colnames(statelc)[6]<-"Porcentaje_MapaELC/ELCmap_percentage"
    colnames(statelc)[7]<-"ELCmapa_clases-cuartil/Quartile_classes_ELCmap"
    write.table(statelc,file="Quartile_ELCmap_Classification.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(statelc,file="Quartile_ELCmap_Classification.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    puntos<-data.frame(puntos,rep(1,length(puntos)))
    colnames(puntos)[1]<-"x"
    colnames(puntos)[2]<-"y"
    colnames(puntos)[3]<-"pres_abs"
    resvar<-data.frame(randomPoints(PA_availab,pansel*pareps),rep(NA,pansel))
    colnames(resvar)[3]<-"pres_abs"
    #consolidaci?n tabla resp.var y resp.xy
    resvar<-rbind(puntos,resvar)
    resxy<-resvar[,c("x","y")]
    resvar<-resvar[,"pres_abs"]
    #Consolidaci?n tabla repeticiones PA
    patable<-list()
    for(i in 1:pareps){
      aaa<-rep(TRUE,nrow(puntos0))
      bbb<-c(1:(length(resvar)-nrow(puntos0)))
      bbb<-sample(bbb,size=pansel)
      ccc<-rep(FALSE,length(resvar)-nrow(puntos0))
      ccc[bbb]<-TRUE
      patable[[i]]<-c(aaa,ccc)
    }
    patable<-do.call("data.frame",patable)
    for (i in 1:pareps){
      colnames(patable)[i]<-paste("PA",i,sep="")
    }
    paelcfin<-data.frame(resxy,resvar,patable)
    #Creaci?n de shapefile de puntos finales (pres+pseudoabs)
    shapefile1<-SpatialPointsDataFrame(resxy, paelcfin)
    #Guardado
    setwd(paste(resultadospaelc))
    write.table(paelcfin,file="PAtable_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(paelcfin,file="PAtable_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile1,dsn=paste(resultadospaelc),layer="Presences_Pseudoabsences_ELC",driver="ESRI Shapefile")
    setwd(paste(ruta))
    
    #Ahora el BIOMOD_FormatingData con formato Random
    inputs<-BIOMOD_FormatingData(resvar,expstack,resp.xy=resxy,
                                 resp.name=paste(genero,especie,sep="."),
                                 PA.nb.rep=pareps,PA.nb.absences=pansel,
                                 PA.strategy="user.defined",PA.table=patable,
                                 na.rm=TRUE)
    
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    setwd(paste(resultadospaelc))
    write.table(extract.table,file="extraction_table_ELC.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(extract.table,file="extraction_table_ELC.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    writeOGR(shapefile2,dsn=paste(resultadospaelc),layer="Final_extraction_ELC",driver="ESRI Shapefile")
    #Creaci?n reporte
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
    write(paste("Data introduced"), file="input_data.txt", append=TRUE)
    origsize<-nrow(pasaporte)
    write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
    origsize<-length(puntos0)
    write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
    pressize<-length(which(inputs@data.species==1))
    write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
    envarsize<-length(inputs@data.env.var)
    write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
    repsize<-length(inputs@PA)
    write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
    repsize<-length(inputs@PA$PA1)
    write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
    pasize<-length(which(inputs@data.species==1))
    pasize<-(length(inputs@data.species))-(pasize)
    write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
    write(paste("Quartile(s) used to define PA:",paelc,sep=" "), file="input_data.txt", append=TRUE)
    write(paste(), file="input_data.txt", append=TRUE)
    setwd(paste(ruta))
    write("8.3.Terminado PA por ELC", file="Error/process_info.txt", append=TRUE)
  }
  
  if(pastrat!="elc"){
    #Creaci?n directorio
    setwd(paste(resultados))
    if(pastrat=="random"){
      dir.create(as.vector(paste("PseudoAbsences_Random_",genero,"_",especie,sep="")))
      resultadosparandom<-paste(resultados,"/PseudoAbsences_Random_",genero,"_",especie,sep="")
    }
    if(pastrat=="disk"){
      dir.create(as.vector(paste("PseudoAbsences_Disk_",genero,"_",especie,sep="")))
      resultadospadisk<-paste(resultados,"/PseudoAbsences_Disk_",genero,"_",especie,sep="")
    }
    if(pastrat=="sre"){
      dir.create(as.vector(paste("PseudoAbsences_SRE_",genero,"_",especie,sep="")))
      resultadospasre<-paste(resultados,"/PseudoAbsences_SRE_",genero,"_",especie,sep="")
    }
    setwd(paste(ruta))
    
    if(pastrat=="random"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   na.rm=TRUE)
    }
    if(pastrat=="disk"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   PA.dist.min=padiskmin,PA.dist.max=padiskmax,
                                   na.rm=TRUE)
    }
    if(pastrat=="sre"){
      inputs<-BIOMOD_FormatingData(puntos,expstack,resp.name=paste(genero,especie,sep="."),
                                   PA.nb.rep=pareps,PA.nb.absences=pansel,PA.strategy=pastrat,
                                   PA.sre.quant=pasreq,
                                   na.rm=TRUE)
    }
    extract.table<-data.frame(inputs@data.species,inputs@coord,inputs@data.env.var)
    shapefile2<-SpatialPointsDataFrame(inputs@coord,data.frame(inputs@data.species,inputs@data.env.var))
    
    
    write("8.2.Terminado creaci?n BIOMOD_FormatingData", file="Error/process_info.txt", append=TRUE)
    
    if(pastrat=="random"){
      setwd(paste(resultadosparandom))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Random.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Random.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadosparandom),layer="Final_extraction_Random",driver="ESRI Shapefile")
      
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
    
    if(pastrat=="disk"){
      setwd(paste(resultadospadisk))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Disk.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Disk.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadospadisk),layer="Final_extraction_Disk",driver="ESRI Shapefile")
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence sites removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste("Disk around presence sites for PA selection - from: ",padiskmin," to: ", padiskmax,"meters", sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
    if(pastrat=="sre"){
      setwd(paste(resultadospasre))
      #Tablas y shapefile
      write.table(extract.table,file="extraction_table_Sre.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(extract.table,file="extraction_table_Sre.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      writeOGR(shapefile2,dsn=paste(resultadospasre),layer="Final_extraction_Sre",driver="ESRI Shapefile")
      #Reporte
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Run (date/hour): ", date(),sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("Species name:",genero,especie,sep=" "), file="input_data.txt", append=TRUE)
      write(paste("Data introduced"), file="input_data.txt", append=TRUE)
      origsize<-nrow(pasaporte)
      write(paste("Number of original species presence sites (after GEOQUAL filtered): ",origsize,sep=""), file="input_data.txt", append=TRUE)
      origsize<-length(puntos)
      write(paste("Number of species presence removed because they are spatial duplicates: ",origsize,sep=""), file="input_data.txt", append=TRUE)
      pressize<-length(which(inputs@data.species==1))
      write(paste("Number of final species presence sites (after NA values from extraction removed): ",pressize,sep=""), file="input_data.txt", append=TRUE)
      envarsize<-length(inputs@data.env.var)
      write(paste("Number of final explanatory variables: ",envarsize,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
      write(paste("PseudoAbsence strategy: ",pastrat,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA)
      write(paste("Number of repetitions (random sampled PseudoAbsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      repsize<-length(inputs@PA$PA1)
      write(paste("Size of each repetition (presences+pseudoabsences): ",repsize,sep=""), file="input_data.txt", append=TRUE)
      pasize<-length(which(inputs@data.species==1))
      pasize<-(length(inputs@data.species))-(pasize)
      write(paste("number of pseudoabsences in each repetition: ",pasize,sep=""), file="input_data.txt", append=TRUE)
      write(paste("Quantile value (sre model) used for PA selection: ",pasreq,sep=""), file="input_data.txt", append=TRUE)
      write(paste(), file="input_data.txt", append=TRUE)
    }
  }
}
setwd(paste(ruta))
write("9.Terminado proceso de BIOMOD_FormatingData", file="Error/process_info.txt", append=TRUE)


####################################################################
############Modelizaci?n por Biomod2################################
####################################################################
if(is.na(preval)|preval=="NA"){
  preval<-NULL
}
if(!is.null(preval)){
  if(preval=="0"){
    preval<-0
  }
  if(preval=="0.25"){
    preval<-0.25
  }
  if(preval=="0.5"){
    preval<-0.5
  }
  if(preval=="0.75"){
    preval<-0.75
  }
  if(preval=="1"){
    preval<-1
  }
}
####Arreglo de las opciones de modelos######
setwd(paste(resultados))
if(modelopc){
  if(ausencia=="absence"){
    borrar<-which(modelos=="MAXENT.Phillips")
    if(length(borrar)!=0){
      modelos<-modelos[-borrar]
    }
  }
  modeloptions<-BIOMOD_ModelingOptions(GLM = NULL,GBM = NULL,GAM = NULL,CTA = NULL,ANN = NULL,SRE = NULL,FDA = NULL,MARS = NULL,RF = NULL,MAXENT.Phillips = NULL)
  #GLM
  if(GLM){
    GLMopt<-read.delim(paste(ruta,"/ModelOptions/",GLMopt,sep=""))
    #arreglo inicial del tema family
    ##if(GLMopt[5,2]!="binomial"){
    ##familia<-paste(GLMopt[5,2],"(link ='",GLMopt[6,2],"')",sep="")
    ##modeloptions<-BIOMOD_ModelingOptions(GLM = list(family = familia))
    ##}
    ##familia<-paste(GLMopt[5,2],"(link ='",GLMopt[6,2],"')",sep="")
    ##modeloptions<-BIOMOD_ModelingOptions(GLM = list(family = familia))
    #Sigue el resto de par?metros
    modeloptions@GLM$type<-paste(GLMopt[1,2])
    modeloptions@GLM$interaction.level<-as.numeric(paste(GLMopt[2,2]))
    if(paste(GLMopt[3,2])!="NULL"){
      modeloptions@GLM$myFormula<-as.formula(paste(GLMopt[3,2]))
    }
    modeloptions@GLM$test<-paste(GLMopt[4,2])
    #Se elimina el tema family anterior
    modeloptions@GLM$family$family<-paste(GLMopt[5,2])
    modeloptions@GLM$family$link<-paste(GLMopt[6,2])
    #modeloptions@GLM$family$variance<-paste(GLMopt[7,2])
    modeloptions@GLM$mustart<-as.numeric(paste(GLMopt[8,2]))
    modeloptions@GLM$control$epsilon<-as.numeric(paste(GLMopt[9,2]))
    modeloptions@GLM$control$maxit<-as.numeric(paste(GLMopt[10,2]))
    modeloptions@GLM$control$trace<-as.logical(GLMopt[11,2])
  }
  #GBM
  if(GBM){
    GBMopt<-read.delim(paste(ruta,"/ModelOptions/",GBMopt,sep=""))
    modeloptions@GBM$distribution<-paste(GBMopt[1,2])
    modeloptions@GBM$n.trees<-as.numeric(paste(GBMopt[2,2]))
    modeloptions@GBM$interaction.depth<-as.numeric(paste(GBMopt[3,2]))
    modeloptions@GBM$n.minobsinnode<-as.numeric(paste(GBMopt[4,2]))
    modeloptions@GBM$shrinkage<-as.numeric(paste(GBMopt[5,2]))
    modeloptions@GBM$bag.fraction<-as.numeric(paste(GBMopt[6,2]))
    modeloptions@GBM$train.fraction<-as.numeric(paste(GBMopt[7,2]))
    modeloptions@GBM$cv.folds<-as.numeric(paste(GBMopt[8,2]))
    modeloptions@GBM$keep.data<-as.logical(GBMopt[9,2])
    modeloptions@GBM$verbose<-as.logical(GBMopt[10,2])
    modeloptions@GBM$perf.method<-paste(GBMopt[11,2]) 
  }
  #GAM
  if(GAM){
    GAMopt<-read.delim(paste(ruta,"/ModelOptions/",GAMopt,sep=""))
    modeloptions@GAM$algo<-paste(GAMopt[1,2])
    modeloptions@GAM$type<-paste(GAMopt[2,2])
    modeloptions@GAM$k<-as.numeric(paste(GAMopt[3,2]))
    modeloptions@GAM$interaction.level<-as.numeric(paste(GAMopt[4,2]))
    if(paste(GAMopt[5,2])!="NULL"){
      modeloptions@GAM$myFormula<-as.formula(paste(GAMopt[5,2]))
    }
    modeloptions@GAM$family$family<-paste(GAMopt[6,2])
    modeloptions@GAM$family$link<-paste(GAMopt[7,2])
    modeloptions@GAM$method<-paste(GAMopt[8,2])
    if(paste(GAMopt[9,3])=="NA"){
      modeloptions@GAM$optimizer<-paste(GAMopt[9,2]) 
    }
    if(paste(GAMopt[9,3])!="NA"){
      modeloptions@GAM$optimizer<-c(paste(GAMopt[9,2]),paste(GAMopt[9,3])) 
    }
    modeloptions@GAM$select<-as.logical(GAMopt[10,2])
    if(paste(GAMopt[11,2])!="NULL"){
      modeloptions@GAM$knots<-paste(GAMopt[11,2])
    }
    if(paste(GAMopt[12,2])!="NULL"){
      modeloptions@GAM$parapen<-paste(GAMopt[12,2])
    }
    modeloptions@GAM$control$nthreads<-as.numeric(paste(GAMopt[13,2]))
    modeloptions@GAM$control$irls.reg<-as.numeric(paste(GAMopt[14,2]))
    modeloptions@GAM$control$epsilon<-as.numeric(paste(GAMopt[15,2]))
    modeloptions@GAM$control$maxit<-as.numeric(paste(GAMopt[16,2]))
    modeloptions@GAM$control$trace<-as.logical(GAMopt[17,2])
    modeloptions@GAM$control$mgcv.tol<-as.numeric(paste(GAMopt[18,2]))
    modeloptions@GAM$control$mgcv.half<-as.numeric(paste(GAMopt[19,2]))
    modeloptions@GAM$control$rank.tol<-as.numeric(paste(GAMopt[20,2]))
    modeloptions@GAM$control$nlm$ndigit<-as.numeric(paste(GAMopt[21,2]))
    modeloptions@GAM$control$nlm$gradtol<-as.numeric(paste(GAMopt[22,2]))
    modeloptions@GAM$control$nlm$stepmax<-as.numeric(paste(GAMopt[23,2]))
    modeloptions@GAM$control$nlm$steptol<-as.numeric(paste(GAMopt[24,2]))
    modeloptions@GAM$control$nlm$iterlim<-as.numeric(paste(GAMopt[25,2]))
    modeloptions@GAM$control$nlm$check.analyticals<-as.logical(GAMopt[26,2])
    modeloptions@GAM$control$optim$factr<-as.numeric(paste(GAMopt[27,2]))
    modeloptions@GAM$control$newton$conv.tol<-as.numeric(paste(GAMopt[28,2]))
    modeloptions@GAM$control$newton$maxNstep<-as.numeric(paste(GAMopt[29,2]))
    modeloptions@GAM$control$newton$maxSstep<-as.numeric(paste(GAMopt[30,2]))
    modeloptions@GAM$control$newton$maxHalf<-as.numeric(paste(GAMopt[31,2]))
    modeloptions@GAM$control$newton$use.svd<-as.logical(paste(GAMopt[32,2]))
    modeloptions@GAM$control$outerPIsteps<-as.numeric(paste(GAMopt[33,2]))
    modeloptions@GAM$control$idLinksBases<-as.logical(GAMopt[34,2])
    modeloptions@GAM$control$scalePenalty<-as.logical(GAMopt[35,2])
    modeloptions@GAM$control$keepData<-as.logical(GAMopt[36,2])
    modeloptions@GAM$control$scale.est<-paste(GAMopt[37,2])
  }
  
  #CTA
  if(CTA){
    CTAopt<-read.delim(paste(ruta,"/ModelOptions/",CTAopt,sep=""))
    modeloptions@CTA$method<-paste(CTAopt[1,2])
    modeloptions@CTA$parms<-paste(CTAopt[2,2])
    if(paste(CTAopt[3,2])!="NULL"){
      modeloptions@CTA$cost<-paste(CTAopt[3,2])
    }
    modeloptions@CTA$control$xval<-as.numeric(paste(CTAopt[4,2]))
    modeloptions@CTA$control$minbucket<-as.numeric(paste(CTAopt[5,2]))
    modeloptions@CTA$control$minsplit<-as.numeric(paste(CTAopt[6,2]))
    modeloptions@CTA$control$cp<-as.numeric(paste(CTAopt[7,2]))
    modeloptions@CTA$control$maxdepth<-as.numeric(paste(CTAopt[8,2]))
  }
  
  #ANN
  if(ANN){
    ANNopt<-read.delim(paste(ruta,"/ModelOptions/",ANNopt,sep=""))
    modeloptions@ANN$NbCV<-as.numeric(paste(ANNopt[1,2]))
    if(paste(ANNopt[2,2])!="NULL"){
      modeloptions@ANN$size<-paste(ANNopt[2,2])
    }
    if(paste(ANNopt[3,2])!="NULL"){
      modeloptions@ANN$decay<-paste(ANNopt[3,2])
    }
    modeloptions@ANN$rang<-as.numeric(paste(ANNopt[4,2]))
    modeloptions@ANN$maxit<-as.numeric(paste(ANNopt[5,2]))
  }
  
  #SRE
  if(SRE){
    SREopt<-read.delim(paste(ruta,"/ModelOptions/",SREopt,sep=""))
    modeloptions@SRE$quant<-as.numeric(paste(SREopt[1,2]))
  }
  
  #FDA
  if(FDA){
    FDAopt<-read.delim(paste(ruta,"/ModelOptions/",FDAopt,sep=""))
    modeloptions@FDA$method<-paste(FDAopt[1,2])
  }
  
  #MARS
  if(MARS){
    MARSopt<-read.delim(paste(ruta,"/ModelOptions/",MARSopt,sep=""))
    modeloptions@MARS$degree<-as.numeric(paste(MARSopt[1,2]))
    if(paste(MARSopt[2,2])!="NULL"){
      modeloptions@MARS$nk<-as.numeric(paste(MARSopt[2,2]))
    }
    modeloptions@MARS$penalty<-as.numeric(paste(MARSopt[3,2]))
    modeloptions@MARS$thresh<-as.numeric(paste(MARSopt[4,2]))
    modeloptions@MARS$prune<-as.logical(MARSopt[5,2])
  }
  
  #RF
  if(RF){
    RFopt<-read.delim(paste(ruta,"/ModelOptions/",RFopt,sep=""))
    modeloptions@RF$do.classif<-as.logical(RFopt[1,2])
    modeloptions@RF$ntree<-as.numeric(paste(RFopt[2,2]))
    if(paste(RFopt[3,2])!="default"){
      modeloptions@RF$mtry<-as.numeric(paste(RFopt[3,2]))
    }
    modeloptions@RF$nodesize<-as.numeric(paste(RFopt[4,2]))
    if(paste(RFopt[5,2])!="NULL"){
      modeloptions@RF$maxnodes<-as.numeric(paste(MARSopt[5,2]))
    }
  }
  
  #MAXENT
  if(MAXENT){
    MAXENTopt<-read.delim(paste(ruta,"/ModelOptions/",MAXENTopt,sep=""))
    modeloptions@MAXENT.Phillips$path_to_maxent.jar<-paste(ruta)
    modeloptions@MAXENT.Phillips$memory_allocated<-as.numeric(paste(MAXENTopt[2,2]))
    modeloptions@MAXENT.Phillips$maximumiterations<-as.numeric(paste(MAXENTopt[3,2]))
    modeloptions@MAXENT.Phillips$visible<-as.logical(MAXENTopt[4,2])
    modeloptions@MAXENT.Phillips$linear<-as.logical(MAXENTopt[5,2])
    modeloptions@MAXENT.Phillips$quadratic<-as.logical(MAXENTopt[6,2])
    modeloptions@MAXENT.Phillips$product<-as.logical(MAXENTopt[7,2])
    modeloptions@MAXENT.Phillips$threshold<-as.logical(MAXENTopt[8,2])
    modeloptions@MAXENT.Phillips$hinge<-as.logical(MAXENTopt[9,2])
    modeloptions@MAXENT.Phillips$lq2lqptthreshold<-as.numeric(paste(MAXENTopt[10,2]))
    modeloptions@MAXENT.Phillips$l2lqthreshold<-as.numeric(paste(MAXENTopt[11,2]))
    modeloptions@MAXENT.Phillips$hingethreshold<-as.numeric(paste(MAXENTopt[12,2]))
    modeloptions@MAXENT.Phillips$beta_threshold<-as.numeric(paste(MAXENTopt[13,2]))
    modeloptions@MAXENT.Phillips$beta_categorical<-as.numeric(paste(MAXENTopt[14,2]))
    modeloptions@MAXENT.Phillips$beta_lqp<-as.numeric(paste(MAXENTopt[15,2]))
    modeloptions@MAXENT.Phillips$beta_hinge<-as.numeric(paste(MAXENTopt[16,2]))
    modeloptions@MAXENT.Phillips$defaultprevalence<-as.numeric(paste(MAXENTopt[17,2]))
  }
  
  
  #Modelizaci?n con proporciones iguales de pres/abs en cada set de train/test
  
  #######################################################################
  #####################con opciones de modelos (usando archivos x modelo)
  #los productos autom?ticos de biomod ser?n guardados en el menor n?mero de subdirectorios
  if(any(modelos=="MAXENT.Phillips")){
    if(file.exists(paste(ruta,"/maxent.jar",sep=""))){
      setwd(paste(ruta))
    }
    if(!file.exists(paste(ruta,"/maxent.jar",sep=""))){
      stop("The required file 'maxent.jar' is not available in the 'ruta' path. Please download and locate it in this path")
    }
  }
  if(modprop){
    if(ausencia=="absence"){
      #Para datos ausencia reales
      prestrain<-round(length(which(inputs@data.species==1))*(datadiv/100))
      abstrain<-round(length(which(inputs@data.species==0))*(datadiv/100))
      tabla1<-data.frame(c(1:length(inputs@data.species)),inputs@data.species)
      colnames(tabla1)[1]<-"ID"
      tabla2<-matrix(data=FALSE,nrow=nrow(tabla1),ncol=modrep)
      for(i in 1:modrep){
        presprop<-subset(tabla1,tabla1[,2]==1)
        presprop<-sample(presprop[,1],size=prestrain)
        paprop<-subset(tabla1,tabla1[,2]==0)
        paprop<-sample(paprop[,1],size=abstrain)
        aaa<-c(presprop,paprop)
        tabla2[aaa,i]<-TRUE
      }
    }
    if(ausencia=="pseudo absence"){
      #Para datos pseudoausencia
      propor<-length(which(inputs@data.species==1))/((length(inputs@data.species)-length(which(inputs@data.species==1)))/pareps)
      prestrain<-round(length(which(inputs@data.species==1))*(datadiv/100))
      patrain<-round(((length(inputs@data.species)-length(which(inputs@data.species==1)))/pareps)*(datadiv/100))
      tabla1<-data.frame(c(1:length(inputs@data.species)),inputs@data.species,inputs@PA)
      colnames(tabla1)[1]<-"ID"
      tabla2<-matrix(data=FALSE,nrow=nrow(tabla1),ncol=pareps)
      for(i in 1:length(inputs@PA)){
        aaa<-subset(tabla1,tabla1[,2+i]=="TRUE")
        presprop<-subset(aaa,aaa[,2]==1)
        presprop<-sample(presprop[,1],size=prestrain)
        paprop<-subset(aaa,is.na(aaa[,2]))
        paprop<-sample(paprop[,1],size=patrain)
        aaa<-c(presprop,paprop)
        tabla2[aaa,i]<-TRUE
      }
      if(length(inputs@PA)!=pareps){
        stop(paste("Number of PA repetition produced (",length(inputs@PA),") does not match with the number indicated by the user (",pareps,")", 
                   ". Please check the user manual for solutions",sep=""))
      }
    }
    modelin<-
      BIOMOD_Modeling(inputs,
                      models=modelos,
                      models.options=modeloptions,
                      NbRunEval=modrep,
                      DataSplit=datadiv,
                      Prevalence=preval,
                      VarImport=imporvar,
                      models.eval.meth=testparam,
                      SaveObj=TRUE,
                      rescal.all.models=reescal,
                      do.full.models=modcomp,
                      modeling.id=modelid,
                      DataSplitTable=tabla2
      )
  }
  
  #Modelizaci?n datos sin guardar proporcionalidad pres/aus en la evaluaci?n
  if(!modprop){
    modelin<-
      BIOMOD_Modeling(inputs,
                      models=modelos,
                      models.options=modeloptions,
                      NbRunEval=modrep,
                      DataSplit=datadiv,
                      Prevalence=preval,
                      VarImport=imporvar,
                      models.eval.meth=testparam,
                      SaveObj=TRUE,
                      rescal.all.models=reescal,
                      do.full.models=modcomp,
                      modeling.id=modelid
      )
  }
}
#######################################################################
##############################sin opciones de modelos (usando defaults)

if(!modelopc){
  if(any(modelos=="MAXENT")){
    if(file.exists(paste(ruta,"/maxent.jar",sep=""))){
      setwd(paste(ruta))
    }
    if(!file.exists(paste(ruta,"/maxent.jar",sep=""))){
      stop("The required file 'maxent.jar' is not available in the 'ruta' path. Please download and locate it in this path")
    }
  }
  modeloptions<-BIOMOD_ModelingOptions(GLM = NULL,GBM = NULL,GAM = NULL,CTA = NULL,ANN = NULL,SRE = NULL,FDA = NULL,MARS = NULL,RF = NULL,MAXENT = NULL)
  #Modelizaci?n con proporciones iguales de pres/abs en cada set de train/test
  if(modprop){
    if(ausencia=="absence"){
      prestrain<-round(length(which(inputs@data.species==1))*(datadiv/100))
      abstrain<-round(length(which(inputs@data.species==0))*(datadiv/100))
      tabla1<-data.frame(c(1:length(inputs@data.species)),inputs@data.species)
      colnames(tabla1)[1]<-"ID"
      tabla2<-matrix(data=FALSE,nrow=nrow(tabla1),ncol=modrep)
      for(i in 1:modrep){
        presprop<-subset(tabla1,tabla1[,2]==1)
        presprop<-sample(presprop[,1],size=prestrain)
        paprop<-subset(tabla1,tabla1[,2]==0)
        paprop<-sample(paprop[,1],size=abstrain)
        aaa<-c(presprop,paprop)
        tabla2[aaa,i]<-TRUE
      }
    }
    if(ausencia=="pseudo absence"){
      propor<-length(which(inputs@data.species==1))/((length(inputs@data.species)-length(which(inputs@data.species==1)))/pareps)
      prestrain<-round(length(which(inputs@data.species==1))*(datadiv/100))
      patrain<-round(((length(inputs@data.species)-length(which(inputs@data.species==1)))/pareps)*(datadiv/100))
      tabla1<-data.frame(c(1:length(inputs@data.species)),inputs@data.species,inputs@PA)
      colnames(tabla1)[1]<-"ID"
      tabla2<-matrix(data=FALSE,nrow=nrow(tabla1),ncol=pareps)
      for(i in 1:length(inputs@PA)){
        aaa<-subset(tabla1,tabla1[,2+i]=="TRUE")
        presprop<-subset(aaa,aaa[,2]==1)
        presprop<-sample(presprop[,1],size=prestrain)
        paprop<-subset(aaa,is.na(aaa[,2]))
        paprop<-sample(paprop[,1],size=patrain)
        aaa<-c(presprop,paprop)
        tabla2[aaa,i]<-TRUE
      }
      if(length(inputs@PA)!=pareps){
        stop(paste("Number of PA repetition produced (",length(inputs@PA),") does not match with the number indicated by the user (",pareps,")", 
                   ". Please check the user manual for solutions",sep=""))
      }
    }
    modelin<-
      #try(
      BIOMOD_Modeling(inputs,
                      models=modelos,
                      models.options=modeloptions,
                      NbRunEval=modrep,
                      DataSplit=datadiv,
                      Prevalence=preval,
                      VarImport=imporvar,
                      models.eval.meth=testparam,
                      SaveObj=TRUE,
                      rescal.all.models=reescal,
                      do.full.models=modcomp,
                      modeling.id=modelid,
                      DataSplitTable=tabla2
                      
      )
    #,silent=TRUE) 
  }
  #Modelizaci?n datos sin guardar proporcionalidad pres/aus en la evaluaci?n
  if(!modprop){
    modelin<-
      #try(
      BIOMOD_Modeling(inputs,
                      models=modelos,
                      models.options=modeloptions,
                      NbRunEval=modrep,
                      DataSplit=datadiv,
                      Prevalence=preval,
                      VarImport=imporvar,
                      models.eval.meth=testparam,
                      SaveObj=TRUE,
                      rescal.all.models=reescal,
                      do.full.models=modcomp,
                      modeling.id=modelid
      )
    #,silent=TRUE)
  }
}
setwd(paste(ruta))
write("10.Terminado proceso de BIOMOD_Modeling", file="Error/process_info.txt", append=TRUE)
##################################################################################
#Exportar evaluaciones
setwd(paste(resultados))
dir.create(as.vector(paste("Results_Evaluation_Models_",modelid,sep="")))
resultadoseval<-paste(resultados,"/Results_Evaluation_Models_",modelid,sep="")
setwd(paste(resultadoseval))

#modeleval<-get_evaluations(modelin,as.data.frame=TRUE)
modeleval<-modelin@models.evaluation@val
modeleval<-adply(modeleval,c(5,4,3,1))
gensp<-rep(paste(genero,".",especie,sep=""),nrow(modeleval))
aaa<-as.character(modeleval[,1])
bbb<-as.character(modeleval[,2])
ccc<-as.character(modeleval[,3])
modelnames<-vector()
for(i in 1:nrow(modeleval)){
  modelnames[i]<-paste(gensp[i],aaa[i],bbb[i],ccc[i],sep="_")
}
modeleval<-data.frame(modelnames,modeleval[,4:ncol(modeleval)])
colnames(modeleval)[1]<-"Model.name"
colnames(modeleval)[2]<-"Eval.metric"

write.table(modeleval, "models_evaluation_results.xls", sep = "\t", row.names = FALSE, qmethod = "double")
write.table(modeleval, "models_evaluation_results.txt", sep = "\t", row.names = FALSE, qmethod = "double")

##################################################################################
#Exportar importancia variables
if(imporvar>0){
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Variables_importance_",modelid,sep="")))
  resultadosvari<-paste(resultados,"/Results_Variables_importance_",modelid,sep="")
  setwd(paste(resultadosvari))
  
  modelvari<-get_variables_importance(modelin)
  nmodelvari<-dimnames(modelvari)
  nmodelvari<-nmodelvari[[3]]
  
  for(i in 1:length(nmodelvari)){
    mvarit<-as.data.frame(modelvari[,,i,1])
    mvarit<-data.frame(rownames(mvarit),mvarit)
    colnames(mvarit)[1]<-"Variables"
    write.table(mvarit, paste("models_var_importance_Run",i,".xls",sep=""),sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(mvarit, paste("models_var_importance_Run",i,".txt",sep=""),sep = "\t", row.names = FALSE, qmethod = "double")
  }
  rm(modelvari)
}

###################################################################################
############## Projection ##########################################################
###################################################################################
####Selecci?n de modelos a ser proyectados
setwd(paste(ruta))
models2bproy<-"all"
if(proysome){
  if(!proysome2){
    modeleval2<-subset(modeleval,modeleval$Eval.metric==proytest1)
    modeleval2<-subset(modeleval2,modeleval2$Testing.data>=proytest1u)
    models2bproy<-as.character(modeleval2$Model.name)
    if(length(models2bproy)==0){
      stop(paste(proytest1," threshold selected 0 models. Please change values", sep=""))
    }
  }
  if(proysome2){
    modeleval2<-subset(modeleval,modeleval$Eval.metric==proytest1)
    modeleval2<-subset(modeleval2,modeleval2$Testing.data>=proytest1u)
    modeleval3<-as.character(modeleval2$Model.name)
    modeleval2<-subset(modeleval,modeleval$Eval.metric==proytest2)
    modeleval2<-subset(modeleval2,modeleval2$Testing.data>=proytest2u)
    modeleval4<-as.character(modeleval2$Model.name)
    models2bproy<-intersect(modeleval3,modeleval4)
    rm(modeleval4)
    rm(modeleval3)
    if(length(models2bproy)==0){
      stop(paste(proytest1," or ",proytest2," threshold selected 0 models. Please change values", sep=""))
    }
  }
}
###Proyecci?n para real absences - FIGS
if(ausencia=="absence"&figs){
  #Extracci?n usando el mismo biomod
  PresAbsFigs<-data.frame(puntosc)
  PresAbs<-c(rep(1,length(puntosc)))
  PresAbsFigs<-data.frame(PresAbsFigs,PresAbs)
  varres<-PresAbsFigs[,"PresAbs"]
  puntos<-PresAbsFigs[,c("DECLONGITUDE","DECLATITUDE")]
  #Ahora el formato BIOMOD_FormatingData
  inputs2<-BIOMOD_FormatingData(varres,expstack,resp.xy=puntos,
                                resp.name=paste(genero,especie,sep="."),na.rm=TRUE)
  expuntos<-inputs2@data.env.var
  if(temp=="future"){
    inputs2_1<-BIOMOD_FormatingData(varres,expstack1,resp.xy=puntos,
                                    resp.name=paste(genero,especie,sep="."),na.rm=TRUE)
    expuntos_1<-inputs2_1@data.env.var
  }
  
  expuntosxy<-inputs2@coord
  #Binarizaci?n
  if(binar){
    setwd(paste(resultados))
    proyecto2<-BIOMOD_Projection(modelin,
                                 expuntos,
                                 modelid,
                                 xy.new.env=expuntosxy,
                                 selected.models=models2bproy,
                                 binary.meth=binarmet,
                                 compress=FALSE,
                                 build.clamping.mask=maskout)
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=binarmet,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto2_1<-BIOMOD_Projection(modelin,
                                     expuntos_1,
                                     modelid2,
                                     xy.new.env=expuntosxy,
                                     selected.models=models2bproy,
                                     binary.meth=binarmet,
                                     compress=FALSE,
                                     build.clamping.mask=maskout)
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=binarmet,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
    }
  }
  if(!binar){
    setwd(paste(resultados))
    proyecto2<-BIOMOD_Projection(modelin,
                                 expuntos,
                                 modelid,
                                 xy.new.env=expuntosxy,
                                 selected.models=models2bproy,
                                 binary.meth=NULL,
                                 compress=FALSE,
                                 build.clamping.mask=maskout)
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=NULL,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto2_1<-BIOMOD_Projection(modelin,
                                     expuntos_1,
                                     modelid2,
                                     xy.new.env=expuntosxy,
                                     selected.models=models2bproy,
                                     binary.meth=NULL,
                                     compress=FALSE,
                                     build.clamping.mask=maskout)
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=NULL,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
    }
  }                           
}
####Proyecci?n s?lo si ausencia real (no figs)
if(ausencia=="absence"&!figs){
  setwd(paste(resultados))
  #Binarizaci?n
  if(binar){
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=binarmet,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=binarmet,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
    }
  }
  if(!binar){
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=NULL,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=NULL,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
    }
  }                           
}

###Proyecci?n para real absences o pseudo-absences
#Correcci?n posible valor errado de figs con pseudoabsence
if(ausencia=="pseudo absence"){
  figs<-FALSE
  if(any(modelos=="MAXENT")){
    setwd(paste(ruta))
    if(!file.exists("maxent.jar")){
      stop("In your CAPFITOGEN2 folder is not the maxent.jar file required")
    }
  }
}
#Ahora si, proyectar
if(ausencia=="pseudo absence"&!figs){
  if(!any(modelos=="MAXENT")){
    setwd(paste(resultados))
  }
  if(binar){
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=binarmet,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=binarmet,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
      
    }
  }
  if(!binar){
    proyecto<-BIOMOD_Projection(modelin,
                                expstack,
                                modelid,
                                xy.new.env=NULL,
                                selected.models=models2bproy,
                                binary.meth=NULL,
                                compress=FALSE,
                                build.clamping.mask=maskout)
    if(temp=="future"){
      modelid2<-paste(modelid,"_F",sep="")
      proyecto_1<-BIOMOD_Projection(modelin,
                                    expstack1,
                                    modelid2,
                                    xy.new.env=NULL,
                                    selected.models=models2bproy,
                                    binary.meth=NULL,
                                    compress=FALSE,
                                    build.clamping.mask=maskout)
    }  
  }
}

####Creaci?n directorio exportaci?n######
setwd(paste(resultados))
dir.create(as.vector(paste("Results_Project_raw_",modelid,sep="")))
resultadosproj1<-paste(resultados,"/Results_Project_raw_",modelid,sep="")
setwd(paste(resultadosproj1))
####Proyecci?n sobre puntos y mapas (caso figs)####
if(ausencia=="absence"&figs){
  prediccion<-proyecto2@proj
  prediccion<-adply(prediccion@val,c(2,3,4))
  prediccion<-t(prediccion)
  coordinates<-matrix(data = NA,nrow=3,ncol=2)
  coordinates<-rbind(coordinates,proyecto2@xy.coord)
  prediccion<-data.frame(coordinates,prediccion,row.names = NULL)
  write.table(prediccion, "FIGs_prediction_results.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(prediccion, "FIGs_prediction_results.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  if(temp=="future"){
    prediccion<-proyecto2_1@proj
    prediccion<-adply(prediccion@val,c(2,3,4))
    prediccion<-t(prediccion)
    coordinates<-matrix(data = NA,nrow=3,ncol=2)
    coordinates<-rbind(coordinates,proyecto2@xy.coord)
    prediccion<-data.frame(coordinates,prediccion,row.names = NULL)
    write.table(prediccion, "FIGs_prediction_Fut_results.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(prediccion, "FIGs_prediction_Fut_results.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  }
}
####Mapas de proyecci?n#####
#Mapas por modelo
estac<-proyecto@proj@val
for (i in 1:length(estac@layers)){
  aaa<-estac@layers[[i]]
  writeRaster(aaa,filename=paste(names(estac)[i],".grd",sep=""),datatype='FLT4S')
  writeRaster(aaa,filename=paste(names(estac)[i],".tif",sep=""),datatype='FLT4S')
}
#Mapas binarios
if(binar){
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Project_binar_",modelid,sep="")))
  resultadosproj2<-paste(resultados,"/Results_Project_binar_",modelid,sep="")
  setwd(paste(resultadosproj2))
  binarymap<-list()
  for(i in 1:length(binarmet)){
    if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
      binarymap[[i]]<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_",genero,".",especie,"_",binarmet[i],"bin.grd",sep=""))
    }
    if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
      binarymap[[i]]<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_",genero,".",especie,"_",binarmet[i],"bin.grd",sep=""))
    }
  }
  binarymap<-do.call("stack",binarymap)
  if(length(binarymap@layers)==length(binarmet)){
    for (i in 1:length(binarymap@layers)){
      aaa<-binarymap@layers[[i]]
      writeRaster(aaa,filename=paste(names(binarymap)[i],"_binary",binarmet[i],".grd",sep=""),overwrite=T,datatype='FLT4S')
      writeRaster(aaa,filename=paste(names(binarymap)[i],"_binary",binarmet[i],".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
  }
}
#Mapa clamping mask
if(maskout){
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Clamping_mask_",modelid,sep="")))
  resultadosproj3<-paste(resultados,"/Results_Clamping_mask_",modelid,sep="")
  setwd(paste(resultadosproj3))
  if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
    camplingmask<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_ClampingMask.grd",sep=""))
  }
  if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
    camplingmask<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_ClampingMask.grd",sep=""))
  }
  writeRaster(camplingmask,filename="Clamping_mask_map.grd",overwrite=T,datatype='FLT4S')
  writeRaster(camplingmask,filename="Clamping_mask_map.tif",overwrite=T,datatype='FLT4S')
}
if(temp=="future"){
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Project_raw_",modelid2,sep="")))
  resultadosproj1_1<-paste(resultados,"/Results_Project_raw_",modelid2,sep="")
  setwd(paste(resultadosproj1_1))
  #Mapas por modelo
  estac<-proyecto_1@proj@val
  for (i in 1:length(estac@layers)){
    aaa<-estac@layers[[i]]
    writeRaster(aaa,filename=paste(names(estac)[i],"_Fut.grd",sep=""),datatype='FLT4S')
    writeRaster(aaa,filename=paste(names(estac)[i],"_Fut.tif",sep=""),datatype='FLT4S')
  }
  #Mapas binarios
  
  if(binar){
    setwd(paste(resultados))
    dir.create(as.vector(paste("Results_Project_binar_",modelid2,sep="")))
    resultadosproj4<-paste(resultados,"/Results_Project_binar_",modelid2,sep="")
    setwd(paste(resultadosproj4))
    binarymap<-list()
    for(i in 1:length(binarmet)){
      if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
        binarymap[[i]]<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_",genero,".",especie,"_",binarmet[i],"bin.grd",sep=""))
      }
      if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
        binarymap[[i]]<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_",genero,".",especie,"_",binarmet[i],"bin.grd",sep=""))
      }
    }
    binarymap<-do.call("stack",binarymap)
    if(length(binarymap@layers)==length(binarmet)){
      for (i in 1:length(binarymap@layers)){
        aaa<-binarymap@layers[[i]]
        writeRaster(aaa,filename=paste(names(binarymap)[i],"_Fut_binary",binarmet[i],".grd",sep=""),overwrite=T,datatype='FLT4S')
        writeRaster(aaa,filename=paste(names(binarymap)[i],"_Fut_binary",binarmet[i],".tif",sep=""),overwrite=T,datatype='FLT4S')
      }
    }
  }
  #Mapa clamping mask
  if(maskout){
    setwd(paste(resultados))
    dir.create(as.vector(paste("Results_Clamping_mask_",modelid2,sep="")))
    resultadosproj5<-paste(resultados,"/Results_Clamping_mask_",modelid2,sep="")
    setwd(paste(resultadosproj5))
    if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
      camplingmask<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_ClampingMask.grd",sep=""))
    }
    if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
      camplingmask<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_ClampingMask.grd",sep=""))
    }
    writeRaster(camplingmask,filename="Clamping_mask_map_Fut.grd",overwrite=T,datatype='FLT4S')
    writeRaster(camplingmask,filename="Clamping_mask_map_Fut.tif",overwrite=T,datatype='FLT4S')
  }
}
setwd(paste(ruta))
write("11.Terminado proceso de BIOMOD_Projection", file="Error/process_info.txt", append=TRUE)

##############################################################################
##################Ensemble####################################################
##############################################################################
#Ensamblaje Ausencias y PseudoAbsences
#Arreglo para caso solo ensamblaje modelos bien evaluados
if(ensamb){
  setwd(paste(resultados))
  #Adecuaciones a par?metros de usuarios
  if(mod2bens=="best"){
    mod2bens<-models2bproy
  }
  if(ensamet){
    ensamet1<-proytest1
    ensamet2<-proytest1u
    if(proysome2){
      ensamet1<-c(proytest1,proytest2)
      ensamet2<-c(proytest1u,proytest2u)
    }
  }
  if(!ensamet){
    ensamet1<-"all"
    ensamet2<-NULL
  }
  if(testparam2){
    testparam3<-testparam
  }
  #Ensamblando
  if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
    setwd(paste(ruta))
  }
  if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
    setwd(paste(resultados))
  }
  ensamod<-BIOMOD_EnsembleModeling(
    modelin,
    chosen.models=mod2bens,
    em.by=tipensam,
    eval.metric=ensamet1,
    eval.metric.quality.threshold=ensamet2,
    models.eval.meth=testparam3,
    prob.mean=probmean,
    prob.cv=probcv,
    prob.ci=probci,
    prob.ci.alpha=probalfa,
    prob.median=probmedian,
    committee.averaging=probca,
    prob.mean.weight=probmw,
    prob.mean.weight.decay=probmwd
  )
  
  ##################################################
  #Forecasting ensembled models
  ##################################################
  ensefores<-BIOMOD_EnsembleForecasting(
    ensamod,
    projection.output=proyecto
  )
  if(ausencia=="absence"&figs){
    ensefores2<-BIOMOD_EnsembleForecasting(
      ensamod,
      projection.output=proyecto2
    )
  }
  #Forecast future
  if(temp=="future"){
    ensefores_1<-BIOMOD_EnsembleForecasting(
      ensamod,
      projection.output=proyecto_1
    )
    if(ausencia=="absence"&figs){
      ensefores2_1<-BIOMOD_EnsembleForecasting(
        ensamod,
        projection.output=proyecto2_1
      )
    }
  }
  
  
  #Exportar evaluaci?n de ensamblados
  ensemeval<-get_evaluations(ensamod,as.data.frame=TRUE)
  ensemeval<-ensemeval[,-4]
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Evaluation_Ensemble_",modelid,sep="")))
  resultadosensem1<-paste(resultados,"/Results_Evaluation_Ensemble_",modelid,sep="")
  setwd(paste(resultadosensem1))
  
  write.table(ensemeval, "ensembled_models_evaluation_results.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(ensemeval, "ensembled_models_evaluation_results.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  
  #Exportar mapas de modelos
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Ensemb_Individual_Models_",modelid,sep="")))
  resultadosensem2<-paste(resultados,"/Results_Ensemb_Individual_Models_",modelid,sep="")
  setwd(paste(resultadosensem2))
  ensenames<-get_built_models(ensamod)
  for(i in 1:length(ensenames)){
    ensemodelos<-ensefores@proj@val@layers[[i]]
    writeRaster(ensemodelos,filename=paste(ensenames[i],".grd",sep=""),overwrite=T,datatype='FLT4S')
    writeRaster(ensemodelos,filename=paste(ensenames[i],".tif",sep=""),overwrite=T,datatype='FLT4S')
  }
  #Rescate y exportaci?n de nuevo de modelo completo
  setwd(paste(resultados))
  dir.create(as.vector(paste("Results_Ensemb_Best_Model_",modelid,sep="")))
  resultadosensem3<-paste(resultados,"/Results_Ensemb_Best_Model_",modelid,sep="")
  setwd(paste(resultadosensem3))
  if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
    Ensembled.Model<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_",genero,".",especie,"_","ensemble.grd",sep=""))
  }
  if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
    Ensembled.Model<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid,"/proj_",modelid,"_",genero,".",especie,"_","ensemble.grd",sep=""))
  }
  writeRaster(Ensembled.Model,filename="Ensembled_best_Model.grd",overwrite=T,datatype='FLT4S')
  writeRaster(Ensembled.Model,filename="Ensembled_best_Model.tif",overwrite=T,datatype='FLT4S')
  setwd(paste(ruta))
  
  #Exportar tabla de predicci?n sobre germoplasma sin evaluar
  if(ausencia=="absence"&figs){
    setwd(paste(resultados))
    dir.create(as.vector(paste("Results_Ensemb_non_evaluated_germplasm")))
    resultadosensem4<-paste(resultados,"/Results_Ensemb_non_evaluated_germplasm",sep="")
    setwd(paste(resultadosensem4))
    Ensembled.Prediction<-data.frame(ensefores2@xy.coord,ensefores2@proj@val)
    write.table(Ensembled.Prediction, "ensembled_prediction_nonevaluated_germplasm.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(Ensembled.Prediction, "ensembled_prediction_nonevaluated_germplasm.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  }
  setwd(paste(ruta))
  write("12.Terminado proceso de BIOMOD_Ensemble", file="Error/process_info.txt", append=TRUE)
  
  #Exportar future
  if(temp=="future"){
    #Exportar mapas de modelos
    setwd(paste(resultados))
    dir.create(as.vector(paste("Results_Ensemb_Individual_Models_",modelid2,sep="")))
    resultadosensem5<-paste(resultados,"/Results_Ensemb_Individual_Models_",modelid2,sep="")
    setwd(paste(resultadosensem5))
    ensenames<-get_built_models(ensamod)
    for(i in 1:length(ensenames)){
      ensemodelos_1<-ensefores_1@proj@val@layers[[i]]
      writeRaster(ensemodelos_1,filename=paste(ensenames[i],".grd",sep=""),overwrite=T,datatype='FLT4S')
      writeRaster(ensemodelos_1,filename=paste(ensenames[i],".tif",sep=""),overwrite=T,datatype='FLT4S')
    }
    #Rescate y exportaci?n de nuevo de modelo completo
    setwd(paste(resultados))
    dir.create(as.vector(paste("Results_Ensemb_Best_Model_",modelid2,sep="")))
    resultadosensem6<-paste(resultados,"/Results_Ensemb_Best_Model_",modelid2,sep="")
    setwd(paste(resultadosensem6))
    if(file.exists(paste(ruta,"/",genero,".",especie,sep=""))){
      Ensembled.Model<-raster(paste(ruta,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_",genero,".",especie,"_","ensemble.grd",sep=""))
    }
    if(file.exists(paste(resultados,"/",genero,".",especie,sep=""))){
      Ensembled.Model<-raster(paste(resultados,"/",genero,".",especie,"/proj_",modelid2,"/proj_",modelid2,"_",genero,".",especie,"_","ensemble.grd",sep=""))
    }
    writeRaster(Ensembled.Model,filename="Ensembled_Fut_best_Model.grd",overwrite=T,datatype='FLT4S')
    writeRaster(Ensembled.Model,filename="Ensembled_Fut_best_Model.tif",overwrite=T,datatype='FLT4S')
    setwd(paste(ruta))
    
    #Exportar tabla de predicci?n sobre germoplasma sin evaluar
    if(ausencia=="absence"&figs){
      setwd(paste(resultados))
      dir.create(as.vector(paste("Results_Fut_Ensemb_non_evaluated_germplasm")))
      resultadosensem7<-paste(resultados,"/Results_Fut_Ensemb_non_evaluated_germplasm",sep="")
      setwd(paste(resultadosensem7))
      Ensembled.Prediction<-data.frame(ensefores2_1@xy.coord,ensefores2_1@proj@val)
      write.table(Ensembled.Prediction, "ensembled__fut_prediction_nonevaluated_germplasm.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(Ensembled.Prediction, "ensembled__fut_prediction_nonevaluated_germplasm.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    }
    setwd(paste(ruta))
    write("13.Terminado proceso de BIOMOD_Ensemble de Future", file="Error/process_info.txt", append=TRUE)
  }
} 
#Purga de temporales en wd

if(any(modelos=="MAXENT")){
  setwd(paste(resultados))
  dir.create(as.vector(paste(genero,".",especie,sep="")))
  aaa<-list.files(paste(ruta,"/",genero,".",especie,sep=""))
  setwd(paste(ruta,"/",genero,".",especie,sep=""))
  file.copy(aaa,paste(resultados,"/",genero,".",especie,sep=""),recursive = TRUE)
  unlink(paste(ruta,"/",genero,".",especie,sep=""),recursive=TRUE,force=TRUE)
}

