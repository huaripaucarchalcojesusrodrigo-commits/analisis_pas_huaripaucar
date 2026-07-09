library(tidyverse)
library(broom)

datos <- read_csv("data/processed/pacientes_clean.csv")

modelo <- lm(
  pas ~ tratamiento +
    edad +
    sexo +
    imc +
    colesterol +
    fumador +
    diabetes,
  data=datos
)

resultado <- tidy(modelo)

write_csv(
  resultado,
  "outputs/tables/resultados_regresion.csv"
)

summary(modelo)