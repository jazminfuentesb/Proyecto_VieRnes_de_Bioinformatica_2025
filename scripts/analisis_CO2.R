# Proyecto de VieRnes de Informática
# Jazmín Fuentes Becerril 
# Fecha: 18 de junio de 2025

# --- 0. Configuración Inicial del Proyecto ---
# Limpiar el entorno de trabajo para empezar limpio
rm(list = ls())

# --- 1. Carga de Paquetes Necesarios ---

# Programación defensiva: Verificar e instalar paquetes si no están presentes
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)

# ¡Nuevo! Para DataExplorer
if (!requireNamespace("DataExplorer", quietly = TRUE)) {
  install.packages("DataExplorer")
}
library(DataExplorer)

# --- 2. Elegir dataset a ocupar ---

# Ver datasets precargados de R
data()

# El dataset a utilizar será "CO2"

# Cargando el dataset
data("CO2")

# Exploración del dataset
cat("--- Vista Previa del Dataset ---\n")
print(head(CO2))

# Muestra la estructura de todas las variables
cat("\n--- Estructura del Dataset ---\n")
str(CO2)

# Proporciona un resumen estadístico clave para cada variable
cat("\n--- Resumen Estadístico del Dataset ---\n")
summary(CO2)

# Data Explorer

# Visualización de valores perdidos
plot_missing(CO2)

# Histograma de variables numéricas
plot_histogram(CO2)

# Gráficos de barras de variables categóricas
plot_bar(CO2)

# Generar el reporte completo en la subcarpeta deseada
create_report(CO2, 
              output_file = "DataExplorer_Reporte.html", # Tu nombre de archivo deseado
              output_dir = "reports/results", # Ruta anidada
              report_title = "Reporte Exploratorio del Dataset CO2") # Tu título para el reporte


# --- 3. Planteamiento y Análisis de Preguntas ---

# Preguntas

# --- Pregunta 1: Análisis de la relación entre Concentración de CO2 y Absorción de CO2 ---

# ¿Cómo se relaciona la concentración de CO2 (conc) con la absorción
# de CO2 (uptake) en las plantas?

# Análisis estadístico: Calcular la correlación entre conc y uptake
# La correlación de Pearson mide la fuerza y dirección de una relación lineal.
# ¡CORRECCIÓN AQUÍ: La columna es 'uptake', no 'CO2uptake'!
correlacion_conc_uptake <- cor(CO2$conc, CO2$uptake)
cat("\n--- Correlación entre Concentración de CO2 y Absorción de CO2 ---\n")
print(paste("La correlación de Pearson es:", round(correlacion_conc_uptake, 2)))

# Programación defensiva: Verificar si hay valores NA antes de calcular la correlación
if (any(is.na(CO2$conc)) || any(is.na(CO2$uptake))) {
  warning("¡Atención! Se encontraron valores NA en 'conc' o 'uptake'. La correlación se calculó excluyendo NA.")
}

# Visualización: Diagrama de dispersión con línea de tendencia
# Usaremos ggplot2, que se incluyó en la carga de paquetes
plot_pregunta1 <- ggplot(CO2, aes(x = conc, y = uptake)) +
  geom_point(aes(color = Type, shape = Treatment), alpha = 0.7) + # Puntos coloreados por 'Type' y forma por 'Treatment'
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") + # Línea de tendencia lineal
  labs(
    title = "Relación entre Concentración de CO2 y Absorción de CO2",
    x = "Concentración de CO2 (ppm)",
    y = "Absorción de CO2 (µmol/m²s)",
    caption = paste("Correlación de Pearson:", round(correlacion_conc_uptake, 2)),
    color = "Tipo de Planta",
    shape = "Tratamiento"
  ) +
  theme_minimal() + # Un tema limpio para el gráfico
  theme(plot.title = element_text(hjust = 0.5)) # Centrar el título

print(plot_pregunta1)

# Programación defensiva: Asegurarse de que la carpeta 'results' exista
if (!dir.exists("results")) {
  dir.create("results")
  message("Carpeta 'results/' creada.")
}

# Guardar gráfico en carpeta "results"
ggsave("results/plot_pregunta1_conc_vs_uptake.png", plot = plot_pregunta1, width = 8, height = 6, dpi = 300)


# --- Pregunta 2: Análisis de la absorción promedio de CO2 por tipo de planta ---

# ¿Existe una diferencia en la absorción promedio de CO2 (uptake) entre los
# diferentes tipos de plantas (Type)?

# Análisis estadístico: Calcular el promedio de 'uptake' por 'Type'
# Usaremos dplyr para agrupar y resumir
promedio_uptake_por_tipo <- CO2 %>%
  group_by(Type) %>%
  summarise(
    media_uptake = mean(uptake, na.rm = TRUE), # na.rm = TRUE para manejar NAs si los hubiera
    desviacion_estandar_uptake = sd(uptake, na.rm = TRUE),
    conteo = n()
  )
cat("\n--- Absorción Promedio de CO2 por Tipo de Planta ---\n")
print(promedio_uptake_por_tipo)

# Programación defensiva: Verificar si 'Type' es un factor
if (!is.factor(CO2$Type)) {
  CO2$Type <- as.factor(CO2$Type)
  message("La variable 'Type' fue convertida a factor para un mejor análisis categórico.")
}

# Visualización: Diagrama de cajas (Boxplot) para comparar la distribución de uptake por Type
plot_pregunta2 <- ggplot(CO2, aes(x = Type, y = uptake, fill = Type)) +
  geom_boxplot() + # Diagrama de cajas para mostrar distribución y mediana
  labs(
    title = "Absorción de CO2 por Tipo de Planta",
    x = "Tipo de Planta",
    y = "Absorción de CO2 (µmol/m²s)",
    fill = "Tipo de Planta"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

print(plot_pregunta2)

# Guardar gráfico en carpeta "results"
ggsave("results/plot_pregunta2_uptake_by_type.png", plot = plot_pregunta2, width = 7, height = 5, dpi = 300)


# --- Pregunta 3: Análisis del efecto del Tratamiento y Tipo de Planta en la Absorción de CO2 ---

# ¿Cómo afecta el tratamiento de refrigeración (Treatment) la absorción de CO2
# (uptake), y este efecto es diferente entre los tipos de plantas (Type)?

# Análisis estadístico: Calcular promedios de 'uptake' por 'Treatment' y 'Type'
promedio_uptake_por_tratamiento_y_tipo <- CO2 %>%
  group_by(Type, Treatment) %>%
  summarise(
    media_uptake = mean(uptake, na.rm = TRUE),
    .groups = 'drop' # Esto es bueno para que el resultado no sea un tibble agrupado
  )
cat("\n--- Absorción Promedio de CO2 por Tratamiento y Tipo de Planta ---\n")
print(promedio_uptake_por_tratamiento_y_tipo)

# Programación defensiva: Verificar si 'Treatment' es un factor
if (!is.factor(CO2$Treatment)) {
  CO2$Treatment <- as.factor(CO2$Treatment)
  message("La variable 'Treatment' fue convertida a factor para un mejor análisis categórico.")
}

# Visualización: Diagrama de barras o de violín/cajas con facetas o interacción
# Opción 1: Diagrama de barras de promedios con la interacción en el eje X
plot_pregunta3_barras <- ggplot(promedio_uptake_por_tratamiento_y_tipo,
                                aes(x = paste(Type, Treatment, sep = "\n"), y = media_uptake, fill = Type)) +
  geom_bar(stat = "identity", position = "dodge") + # 'identity' porque ya son promedios
  labs(
    title = "Absorción Promedio de CO2 por Tipo de Planta y Tratamiento",
    x = "Tipo de Planta y Tratamiento",
    y = "Absorción Promedio de CO2 (µmol/m²s)",
    fill = "Tipo de Planta"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

print(plot_pregunta3_barras)

# Opción 2: Diagrama de cajas/violín con facetas por 'Type' o 'Treatment' para ver distribuciones
plot_pregunta3_boxplot <- ggplot(CO2, aes(x = Treatment, y = uptake, fill = Treatment)) +
  geom_boxplot() +
  facet_wrap(~ Type) + # Separa el gráfico por cada 'Type' de planta
  labs(
    title = "Distribución de Absorción de CO2 por Tratamiento y Tipo de Planta",
    x = "Tratamiento",
    y = "Absorción de CO2 (µmol/m²s)",
    fill = "Tratamiento"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

print(plot_pregunta3_boxplot)


# Guardar gráfico de barras
ggsave("results/plot_pregunta3_barras_uptake_by_treatment_type.png", plot = plot_pregunta3_barras, width = 8, height = 6, dpi = 300)
# Guardar gráfico de boxplot con facetas
ggsave("results/plot_pregunta3_boxplot_uptake_by_treatment_type.png", plot = plot_pregunta3_boxplot, width = 9, height = 5, dpi = 300)


