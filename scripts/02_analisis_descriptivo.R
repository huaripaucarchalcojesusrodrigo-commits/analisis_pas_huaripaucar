# ============================================================
# 02_analisis_descriptivo.R
# Análisis descriptivo y visualización de los datos
# Autor: Jesus Rodrigo Huaripaucar Chalco
# ============================================================

# Cargar librerías
library(tidyverse)

# ------------------------------------------------------------
# Leer los datos procesados
# ------------------------------------------------------------
datos <- read_csv("data/processed/pacientes_clean.csv")

# ------------------------------------------------------------
# Resumen general
# ------------------------------------------------------------
summary(datos)

# ------------------------------------------------------------
# Estadísticas descriptivas de variables numéricas
# ------------------------------------------------------------
estadisticas <- datos %>%
  summarise(
    n = n(),
    edad_media = mean(edad, na.rm = TRUE),
    edad_sd = sd(edad, na.rm = TRUE),
    
    pas_media = mean(pas, na.rm = TRUE),
    pas_sd = sd(pas, na.rm = TRUE),
    
    imc_media = mean(imc, na.rm = TRUE),
    imc_sd = sd(imc, na.rm = TRUE),
    
    colesterol_media = mean(colesterol, na.rm = TRUE),
    colesterol_sd = sd(colesterol, na.rm = TRUE)
  )

print(estadisticas)

# Guardar tabla descriptiva
write_csv(
  estadisticas,
  "outputs/tables/estadisticas_descriptivas.csv"
)

# ------------------------------------------------------------
# Frecuencia por sexo
# ------------------------------------------------------------
tabla_sexo <- datos %>%
  count(sexo)

print(tabla_sexo)

write_csv(
  tabla_sexo,
  "outputs/tables/frecuencia_sexo.csv"
)

# ------------------------------------------------------------
# Frecuencia por tratamiento
# ------------------------------------------------------------
tabla_tratamiento <- datos %>%
  count(tratamiento)

print(tabla_tratamiento)

write_csv(
  tabla_tratamiento,
  "outputs/tables/frecuencia_tratamiento.csv"
)

# ------------------------------------------------------------
# Histograma de PAS
# ------------------------------------------------------------
grafico_pas <- ggplot(datos,
                      aes(x = pas)) +
  geom_histogram(
    bins = 20,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Distribución de la presión arterial sistólica",
    x = "PAS",
    y = "Frecuencia"
  ) +
  theme_minimal()

ggsave(
  "outputs/figures/histograma_pas.png",
  grafico_pas,
  width = 7,
  height = 5
)

# ------------------------------------------------------------
# Boxplot de PAS por tratamiento
# ------------------------------------------------------------
grafico_box <- ggplot(datos,
                      aes(x = tratamiento,
                          y = pas,
                          fill = tratamiento)) +
  geom_boxplot() +
  labs(
    title = "PAS según tratamiento",
    x = "Tratamiento",
    y = "Presión arterial sistólica"
  ) +
  theme_minimal()

ggsave(
  "outputs/figures/boxplot_pas_tratamiento.png",
  grafico_box,
  width = 7,
  height = 5
)

# ------------------------------------------------------------
# Fin del script
# ------------------------------------------------------------