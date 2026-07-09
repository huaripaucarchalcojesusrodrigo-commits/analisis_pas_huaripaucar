# Análisis del efecto del tratamiento A sobre la presión arterial

**Autor:** Jesus Rodrigo Huaripaucar Chalco

## Descripción

Este proyecto forma parte de la práctica de sistematización y tiene como finalidad organizar un análisis estadístico reproducible utilizando R y GitHub.

Se evalúa el efecto del tratamiento A sobre la presión arterial sistólica (PAS) en pacientes con hipertensión mediante un modelo de regresión lineal, ajustando por variables clínicas y demográficas.

---

## Objetivo

Determinar si el tratamiento A reduce significativamente la presión arterial sistólica (PAS) en comparación con el tratamiento B, controlando por:

- Edad
- Sexo
- Índice de masa corporal (IMC)
- Colesterol
- Tabaquismo
- Diabetes

---

## Conjunto de datos

El conjunto de datos corresponde a pacientes con hipertensión arterial.

Variables incluidas:

- tratamiento
- pas
- edad
- sexo
- imc
- colesterol
- fumador
- diabetes

---

## Estructura del proyecto

```
analisis_pas_huaripaucar/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── outputs/
│   ├── figures/
│   └── tables/
│
├── scripts/
│   ├── 01_limpieza.R
│   └── 03_modelo_regresion.R
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## Scripts

### 01_limpieza.R

- Importa los datos.
- Revisa valores perdidos.
- Limpia la base de datos.
- Guarda la base procesada.

### 03_modelo_regresion.R

- Ajusta un modelo de regresión lineal.
- Estima el efecto del tratamiento.
- Exporta la tabla de coeficientes.

---

## Resultados esperados

El análisis permitirá:

- Evaluar el efecto del tratamiento.
- Obtener los coeficientes del modelo.
- Generar resultados reproducibles.

---

## Cómo ejecutar

1. Abrir el proyecto en RStudio.
2. Ejecutar `01_limpieza.R`.
3. Ejecutar `03_modelo_regresion.R`.
4. Revisar los resultados generados.

---

## Herramientas utilizadas

- R
- RStudio
- Git
- GitHub
- tidyverse
- broom

---

## Licencia

Este proyecto se distribuye bajo la licencia MIT.