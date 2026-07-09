library(tidyverse)

# Leer datos originales
datos_raw <- read_csv("data/raw/pacientes.csv")

# Limpieza de datos
datos_clean <- datos_raw %>%
  mutate(
    sexo = factor(sexo, labels = c("Hombre", "Mujer")),
    fumador = factor(fumador, labels = c("No", "Sí")),
    diabetes = factor(diabetes, labels = c("No", "Sí")),
    tratamiento = factor(tratamiento, labels = c("B", "A"))
  ) %>%
  filter(!is.na(pas))

# Guardar datos procesados
write_csv(
  datos_clean,
  "data/processed/pacientes_clean.csv"
)