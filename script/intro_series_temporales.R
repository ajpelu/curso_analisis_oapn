# Cargar los paquetes necesarios 
library("trend")
# install.packages("trend")

clima <- read.csv(here::here("/datos/temp_guadarrama.csv"), 
                  header=TRUE, sep=";")
# Camnbiar nombre de la segunda variable 
names(clima)[2] <- "YEAR"

# Seleccionar datos de la estacion Navacerrada 
navacerrada <- subset(clima, NOMBRE == "NAVACERRADA,PUERTO")

# Seleccionar variables
tmin <- navacerrada[, c("YEAR", "TM_MIN")]

# Crear un objeto de tipo ts 
tmin.ts <- ts(data = tmin$TM_MIN, 
              start = min(tmin$YEAR),
              end = max(tmin$YEAR))

tmin.ts

# Gráfica 
plot(tmin.ts)

# Crear nueva serie especificando la frecuencia 
tmin.ts2 <- ts(data = tmin$TM_MIN, 
               start = min(tmin$YEAR),
               end = max(tmin$YEAR),
               frequency = 12)

tmin.ts2

# Gráfica 
plot(tmin.ts2)


# Gráfica de los valores de toda la serie agrupados por meses
boxplot(tmin.ts2~cycle(tmin.ts2), xlab="Mes", ylab="Temp. min.")



dd <- decompose(tmin.ts2)
dd



##############################################################################
## Alisados exponenciales 
# Leer datos 
ordesa <- read.csv(file=here::here("datos/ordesa_ord.csv"))

# analizar la estructura del archivo de datos
str(ordesa)

# Seleccionar un municipio 
panticosa <- subset(ordesa, Municipio == "Panticosa")

# Ver las primeras filas 
head(panticosa)

# Explorar la evolucion de la poblacion
plot(y = panticosa$Habitantes, x= panticosa$year, 
     xlab = "Año", ylab= "Habitantes")
lines(y = panticosa$Habitantes, x= panticosa$year)


# Crear un objeto de clase ts 
panticosa_ts <- ts(data = panticosa$Habitantes, 
                   start= min(panticosa$year), 
                   end = max(panticosa$year))

# Alisado exponencial 
# Si tienes dudas ?HoltWinters
panticosa_holt <- HoltWinters(panticosa_ts, gamma=FALSE)

panticosa_holt

# Grafico 
plot(panticosa_holt, ylab="Población", xlab="Tiempo", main="")
labs <- c("Valores observados", "Valores predichos")
legend("topleft", lty=c(1,1), col=c("black", "red"), legend=labs)

# Predecir valores futuros (5 años)
panticosa_pred <- predict(panticosa_holt, n.ahead=5,
                          prediction.interval = TRUE)
panticosa_pred 

# Gráfico
plot(panticosa_holt, panticosa_pred, 
     main="", xlab = "Año", ylab="Habitantes")

legend("topleft", lty=rep(1,3), col=c("black", "red", "blue"), 
       legend=c("Valores observados", "Valores predichos", "IC de las predicciones"))




##############################################################################
# Análisis de tendencias 

plot(y = panticosa$Habitantes, x= panticosa$year, 
     xlab = "Año", ylab= "Habitantes")
lines(y = panticosa$Habitantes, x= panticosa$year)

# Calcular test de Mann-Kendall
panticosa_mk <- mk.test(panticosa$Habitantes)
panticosa_mk

# Estimación de la tasa de cambio
panticosa_sen <- sens.slope(panticosa$Habitantes)
panticosa_sen 









