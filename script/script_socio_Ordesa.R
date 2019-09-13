## Leer los datos

## Importante!! 
ordesa <- read.csv(file="AQUI LA RUTA COMPLETA DONDE TENGAS LOS DATOS",
                   header = TRUE, 
                   sep = ",")
# Un ejemplo 
ordesa <- read.csv(file = "/Users/Tomatito/curso/datos/ordesa_ord.csv",
         header=TRUE, sep=",")

# Explorar la estructura de los datos
head(ordesa)
str(ordesa)

# Seleccionar los valles de interés
dosvalles <- subset(ordesa, valle != "TEN")
str(dosvalles)

# Cargar paquete
# install.packages("ggplot2")
library("ggplot2")
ggplot(dosvalles, 
       aes(x=year, y=Habitantes, colour = Municipio)) +
  geom_point() + facet_wrap(~valle, scales="free_y") + geom_line()
         

# Calcular las tendencias de la población a nivel de Municipio
library("trend")
#install.packages("trend")

# Ver los muinicipios que hay 
unique(dosvalles$Municipio)
# levels(dosvalles$Municipio)

# Crear subconjunto de datos por Municipio
bielsa <- subset(dosvalles, Municipio == "Bielsa")
# Computamos la tendencia MannKendall 
mk_bielsa <- mk.test(bielsa$Habitantes)

# Ver la estructura 
str(mk_bielsa)

# Obtener el valor del tau y el p.valor 
tau_bielsa <- mk_bielsa$estimates[3]
pvalue_bielsa <- mk_bielsa$p.value

# ... 
# Esto habría que repetirlo para todos los municipios... pero existen  
# otras formas mas eficientes de hacerlo. Utilizando tidyverse
# Aqui un enlace muy interesante y completo https://r4ds.had.co.nz/ 

library("tidyverse")
# install.packages("tidyverse")
tendsMK_valles <- 
  ordesa %>% 
  group_by(valle,Municipio) %>% 
  summarise(tendMK= mk.test(Habitantes)$estimates[3], 
            pvalue = mk.test(Habitantes)$p.value) %>% 
  as.data.frame()

# Gráfico 
ggplot(tendsMK_valles)+geom_point(aes(x=valle,y=tendMK))

## Comparación municipios dentro y fuera 
# Seleccionar valles 
tendsMK <- subset(tendsMK_valles, valle != "TEN")
tendsMK <- tendsMK_valles %>% filter(valle != "TEN")

# Ajustar un modelo lineal (comparación entre sitios)
m1 <- lm(tendMK~valle, data=tendsMK)

# Evaluar modelo
summary(m1)

# Plot de Diagnóstico del Modelo 
# Este comando que viene ahora permite dividir 
# la pantalla de salida de los gráficos en 4 partes para una 
# mejor visualización
par(mfrow=c(2,2)) 

plot(m1)

# El siguiente comando reestablece la pantalla
dev.off() 

# Si quisiera obtener una tabla de ANOVA clásica
anova(m1)


# Gráfico de medias 
plotMeans(tendsMK$tendMK,tendsMK$valle)

# Otros gráficos de interés (Gracias Vicente!!)
ggplot(ordesa,aes(x=year,y=Habitantes,color=Municipio)) +
  geom_point() + 
  facet_wrap(~valle,scales = "free_y") + 
  geom_line() + 
  theme_bw() 

# ggplot(datse2,aes(x=year,y=Habitantes,color=Municipio))+
#   geom_point()+facet_wrap(~valle,scales = "free_y")+geom_line()





