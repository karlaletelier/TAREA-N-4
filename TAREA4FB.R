## usando Fenty Bauty  extraeremos nombres de productos y sus precios##
#Primer paso extraer nombres de productos Fenty Beauty#
FentyBeauty<- "https://www.fentybeauty.com/"
FentyBeauty<- read_html(FentyBeauty)
FentyBeauty_Productos<- html_nodes(FentyBeauty,".product-tile")
FentyBeauty_Productos<-html_text(FentyBeauty_Productos)
#Limpiamos el texto#
FentyBeauty_Productos<- gsub("\n","",FentyBeauty_Productos)
FentyB<- strsplit(FentyBeauty_Productos,"    ")[]
FentyB<- tolower(FentyB)
unlistFentyB<- unlist(FentyB)

tablaFentyB<-(unlistFentyB)
tablaFentyB<- table(tablaFentyB)
tablaFentyB
#Realizaremos un Data Frame#
DF_fentybeauty<- as.data.frame(tablaFentyB)
#Amacenamos nuestra informacion de productos en un archivo csv#
write.csv(DF_fentybeauty, file="Fenty_Beauty.csv")

#Procedemos a extraer los precios de los productos fenty Beauty

FentyBeautyPrice <- html_nodes(FentyBeauty,".product-sales-price")
FentyBeautyPrice <- html_text(FentyBeautyPrice)
#Limpiamos el texto
FentyBeautyPrice<- gsub("\n","",FentyBeautyPrice)
FentyBeautyPrice<- gsub("\\$","US$",FentyBeautyPrice)
FentyBeautyPrice

FentyBP<- strsplit(FentyBeautyPrice," ")[]
FentyBP<- tolower(FentyBP)
unlistFentyBP<- unlist(FentyBP)

tablaFentyBP<-(unlistFentyBP)
tablaFentyBP<- table(tablaFentyBP)
tablaFentyBP
#Creamos una Data Frame
DF_fentybeautyP<- as.data.frame(tablaFentyBP)
#Almacenamos tabla de precio en un archivo CSV
write.csv(DF_fentybeautyP, file="Fenty_BeautyP.csv")

