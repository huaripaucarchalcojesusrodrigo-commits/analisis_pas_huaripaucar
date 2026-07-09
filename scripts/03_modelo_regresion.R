library(tidyverse)
library(broom)

# Leer datos procesados
datos <- read_csv("data/processed/pacientes_clean.csv")

# Modelo de regresión lineal
modelo <- lm(
  pas ~ tratamiento + edad + sexo +
    imc + colesterol + fumador + diabetes,
  data = datos
)

# Tabla de coeficientes
tabla_coef <- tidy(modelo, conf.int = TRUE)

# Guardar resultados
write_csv(
  tabla_coef,
  "outputs/tables/coeficientes.csv"
)