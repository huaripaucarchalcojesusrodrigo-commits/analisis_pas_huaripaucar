# ==========================================================
# 02_limpieza.R
# Limpieza y preparación de los datos
# Autor: Jesus Rodrigo Huaripaucar Chalco
# ==========================================================

# ----------------------------------------------------------
# Cargar librerías
# ----------------------------------------------------------
library(tidyverse)

# ----------------------------------------------------------
# Leer datos
# ----------------------------------------------------------
datos <- read_csv("data/raw/pacientes.csv")

# ----------------------------------------------------------
# Inspección inicial
# ----------------------------------------------------------
glimpse(datos)
summary(datos)

# ----------------------------------------------------------
# Verificar valores perdidos
# ----------------------------------------------------------
colSums(is.na(datos))

# ----------------------------------------------------------
# Eliminar registros con valores faltantes
# ----------------------------------------------------------
datos_clean <- datos %>%
  drop_na()

# ----------------------------------------------------------
# Verificar registros duplicados
# ----------------------------------------------------------
sum(duplicated(datos_clean))

# Eliminar duplicados si existen
datos_clean <- datos_clean %>%
  distinct()

# ----------------------------------------------------------
# Convertir variables categóricas a factor
# ----------------------------------------------------------
datos_clean <- datos_clean %>%
  mutate(
    tratamiento = factor(tratamiento),
    sexo = factor(sexo),
    fumador = factor(fumador),
    diabetes = factor(diabetes)
  )

# ----------------------------------------------------------
# Verificar estructura final
# ----------------------------------------------------------
str(datos_clean)

# ----------------------------------------------------------
# Guardar base de datos limpia
# ----------------------------------------------------------
write_csv(
  datos_clean,
  "data/processed/pacientes_clean.csv"
)

# ----------------------------------------------------------
# Mensaje final
# ----------------------------------------------------------
cat("\n=====================================\n")
cat("Limpieza completada correctamente.\n")
cat("Archivo generado:\n")
cat("data/processed/pacientes_clean.csv\n")
cat("=====================================\n")