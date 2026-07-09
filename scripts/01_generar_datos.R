# ==========================================================
# 01_generar_datos.R
# Generación de datos ficticios
# ==========================================================

library(tidyverse)

set.seed(123)

n <- 200

datos <- tibble(
  tratamiento = sample(c("A","B"), n, replace = TRUE),
  edad = round(rnorm(n,60,10)),
  sexo = sample(c("Masculino","Femenino"), n, replace = TRUE),
  imc = round(rnorm(n,28,4),1),
  colesterol = round(rnorm(n,210,35)),
  fumador = sample(c("Si","No"), n, replace = TRUE),
  diabetes = sample(c("Si","No"), n, replace = TRUE)
)

datos$pas <- round(
  160 -
    ifelse(datos$tratamiento=="A",10,0) +
    0.45*datos$edad +
    0.7*datos$imc +
    rnorm(n,0,8)
)

write_csv(datos,"data/raw/pacientes.csv")