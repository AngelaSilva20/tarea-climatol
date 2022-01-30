#TAREA ADICIONAL

library(climatol)

#NIVEL 1 
## 1. Generar un diagrama de Walter y Lieth con la data de datcli, este debe llevar de título “Estación Campo
#de Marte”, a una altitud de 80 msnm durante el año 2017, con los meses simbolizados por números. Las
#temperaturas deberán visualizarse de color verde; las precipitaciones, en naranja; los meses de congelación
#segura, en azul y los de congelación probable, en celeste. No trazar una línea suplementaria de
#precipitación.

data(datcli) 
diagwl(datcli, "Estacion campo de marte", 80, "2017", mlab="xd", pcol = "orange", tcol = "green", pfcol="lightblue", sfcol = "blue", shem=FALSE, p3line = T)

## 2. Recrea minuciosamente el siguiente diagrama de la rosa de los vientos (pista: col=rainbow(8)).
data(windfr)
rosavent(windfr,fnum=6,fint=2,flab=1,ang=3*pi/8,col=rainbow(8),uni="km/s")

#NIVEL 2 
## 3. Convertir la data diaria de tmax en una data de medias mensuales. Posteriormente, homogeneizar dichos
#datos mensuales con una normalización por estandarización y gráficos de medias anuales y correcciones
#aplicadas en el análisis exploratorio de datos (utilizar dos decimales).

data(tmax)

#Exportamos archivos del database de R a nuestro equipo:
write.table(dat,"Tmax_2001-2003.dat", row.names=F, col.names=F)
write.table(est.c, "Tmax_2001-2003.est", row.names=F, col.names=F)

homogen('Tmax',2001,2003,nm=0, std=2,ndec=3,gp=3,expl=TRUE)

## 4. Recortar la data mensual de Ptest desde 1965 hasta 2005. Homogeneizar dicha data mediante clústers
#o áreas rectangulares, con un ancho de superposición de 0, mediante una estandarización y con gráficos
#de totales anuales en el análisis exploratorio de datos. Mostrar las medias de las series homogeneizadas
#en un archivo Excel que, además, mencione los totales anuales y los datos de la latitud, longitud y nombre
#de cada estación (utilizar dos decimales).

data(Ptest)

#recortar la data desde 1965 - 2005:
write.table(dat,'Ptest_1951-2010.dat',row.names=F,col.names=F)
write.table(est.c,'Ptest_1951-2010.est',row.names=F,col.names=F)
datsubset('Ptest', 1951, 2010, 1965, 2005, 1)
read.table("Ptest_1965-2005.dat")

#homogenizamos por clusters o areas rectangulares
dim(dat)<-c(720, 20)
write(dat[1:720,1:20],'Ptest_1965-2005.dat')
write.table(est.c[1:12,1:5],'Ptest_1965-2005.est',row.names=FALSE,col.names=FALSE)
homogsplit('Ptest', 1965, 2005, 0,0,std=3, nm=0, ndec=2, gp=4)




#NIVEL 3 
## 5. Con la data homogenizada del ejercicio anterior (si no se ha realizado, iniciar homogeneizando tal cual
#se menciona en el ejercicio 4) plotear un gráfico de calor con las medias de precipitación mensual de
#acuerdo con la latitud y longitud, este debe abarcar desde el punto 2.1°E 39.1°N hasta el punto 3.5°E
#40°N, con una separación de 0.001 entre líneas. Además, debe tener un título principal y etiquetado en
#ambos ejes. Adicionalmente, plotear un mapa de la zona del mundo en cuestión encima de dicho gráfico
#(use col=rainbow(100)).

data(Ptest)
save(dah,dat,est.c,ini,ndec,ne,nd,nei,nm,std,x,file='Ptest_1965-2005.rda')
grilla<-expand.grid(x=seq(2.1,3.5,0.001),y=seq(39.1,40.0,0.001))
library(sp)
coordinates(grilla)<-~ x+y
# dahgrid('Ptest', 1965, 2005, grid = grilla)








