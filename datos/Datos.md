# Datos

## Medidas biométricas de Roble melojo (*Quercus pyrenaica*) en Sierra Nevada.

Se trata de un conjunto de datos procedente de muestreos de estructura
de los robledales en dos poblaciones de Sierra Nevada, una en cara norte
(Robledal de San Juan, *SJ*) y otra en cara sur (Robledal de Cáñar,
*CA*) (Pérez-Luque et al. 2015)En cada uno de estos robledales se
llevaron a cabo transectos de 30 x 10 metros distribuidos al azar.
Dendro de cada transecto se anotaron y midieron todos los individuos de
roble. Se midieron la altura (*h*, m) y el diámetro (*d*, cm; DBH para
pies \> 2 cm diámetro). Para cada pié se estimó la biomasa aérea (*w*,
kg) y radicular (*wr*, kg) utilizando las ecuaciones para la especie
desarrolladas por (Ruiz-Peinado et al. 2012).

La siguiente tabla muestra un aspecto de los
datos.

|    id | date       | sp  |      lat |      long |  d | id\_transect | elev | loc |    h |          w |     wr |
| ----: | :--------- | :-- | -------: | --------: | -: | :----------- | ---: | :-- | ---: | ---------: | -----: |
| 23812 | 2012-09-10 | Qpy | 36.95995 | \-3.42277 | 14 | P007         | 1793 | CA  | 5.50 | 28.1358000 | 28.028 |
| 23813 | 2012-09-10 | Qpy | 36.95995 | \-3.42277 |  4 | P007         | 1793 | CA  | 2.23 |  0.7984758 |  2.288 |
| 23814 | 2012-09-10 | Qpy | 36.95995 | \-3.42277 | 18 | P007         | 1793 | CA  | 5.70 | 48.2014800 | 46.332 |

Este conjunto de datos está en
[`./datos/biomass_pyrenaica.csv`](../datos/biomass_pyrenaica.csv)

## Precipitación acumulada (año hidrológico) en estaciones meteorológicas de Sierra Nevada.

Dataset de precipitación acumulada durante el año hidrológico (oct-sep)
recogida por 28 estaciones meteorológicas en el entorno de Sierra Nevada
(fuente AEMET) en el período 1950-2017.

Este conjunto de datos está en
[`./datos/cummulated_precSN.csv`](../datos/cummulated_precSN.csv)

La siguiente tabla muestra un aspecto de los datos.

| hyear | csum\_mean |  csum\_sd |  csum\_se | n |
| ----: | ---------: | --------: | --------: | -: |
|  1950 |   146.4000 |  67.21009 |  67.21009 | 6 |
|  1951 |   648.9000 |  65.05382 |  65.05382 | 2 |
|  1952 |   729.2167 | 356.45087 | 356.45087 | 6 |

Se muestra el valor promedio de precipitación acumulada para cada año
(`csum_mean`), así como el error típico (`csum_se`) y la desviación
estándar (`csum_sd`).

# Referencias

<div id="refs" class="references">

<div id="ref-PerezLuqueetal2015DatasetMIGRAME">

Pérez-Luque, A. J., R. Zamora, F. J. Bonet, and R. Pérez-Pérez. 2015.
Dataset of MIGRAME Project (Global Change, Altitudinal Range Shift and
Colonization of Degraded Habitats in Mediterranean Mountains). PhytoKeys
56:61–81.

</div>

<div id="ref-RuizPeinadoGertrudixetal2012BiomassModels">

Ruiz-Peinado, R., G. Montero, and M. Del Rio. 2012. Biomass models to
estimate carbon stocks for hardwood tree species. Forest Systems 21:42.

</div>

</div>
