# Análisis de Absorción de CO2 en Plantas: Demostración de Habilidades en Bioinformática con R

## 1. Introducción al Proyecto

Este repositorio alberga el proyecto final desarrollado como parte del curso "VieRnes de Bioinformática". El proyecto consiste en un análisis exploratorio del dataset `CO2`, un conjunto de datos clásico en R que contiene mediciones sobre la absorción de dióxido de carbono por plantas bajo diferentes condiciones.

El objetivo principal es investigar cómo factores como la concentración de CO2, el tipo de planta y un tratamiento de refrigeración impactan la tasa de absorción de CO2. Este análisis no solo busca obtener conclusiones biológicas relevantes, sino también servir como una demostración integral de las habilidades y buenas prácticas adquiridas a lo largo del curso.

## 2. Objetivos del Análisis

El presente estudio se enfoca en responder a las siguientes preguntas de investigación:

* **Relación Concentración-Absorción:** ¿Cómo se relaciona la concentración de CO2 en el ambiente (`conc`) con la tasa de absorción de CO2 (`uptake`) en las plantas?
* **Influencia del Tipo de Planta:** ¿Existen diferencias significativas en la absorción promedio de CO2 (`uptake`) entre los diferentes tipos de plantas (`Type`) presentes en el dataset (Quebec vs. Mississippi)?
* **Efecto de Tratamiento e Interacción:** ¿Cómo afecta un tratamiento de refrigeración (`Treatment`) a la absorción de CO2 (`uptake`), y este efecto es uniforme o varía entre los distintos tipos de plantas?

## 3. Propósito Educativo: Demostrando lo Aprendido en "VieRnes de Bioinformática"

Este proyecto ha sido concebido para aplicar y consolidar los conocimientos y habilidades adquiridos durante el curso "VieRnes de Bioinformática". Específicamente, este repositorio y el análisis presentado demuestran competencia en:

* **Manipulación y Exploración de Datos:** Uso eficiente de `dplyr` para la transformación y resumen de datos, y técnicas para la exploración inicial de datasets.
* **Programación Defensiva:** Implementación de cheques y validaciones para garantizar la robustez del código (ej., verificación de instalación de paquetes, manejo de NAs, conversión de tipos de variables).
* **Visualización de Datos:** Creación de gráficos informativos y estéticamente agradables utilizando `ggplot2` para ilustrar las relaciones y patrones en los datos.
* **Buenas Prácticas de Codificación:** Adherencia a convenciones de estilo, uso de comentarios claros y estructuración lógica del código.
* **Documentación y Reportes Reproducibles:** Generación de un informe dinámico y reproducible utilizando R Markdown, lo que permite integrar código, resultados y texto explicativo en un único documento. El uso del formato `rmdformats::downcute` mejora la presentación final del reporte.

## 4. Estructura del Repositorio

Este repositorio contiene los siguientes archivos principales:

* `Análisis-de-CO2-en-Plantas---Proyecto-de-VieRnes-de-Bioinformática.Rmd`: El código fuente en R Markdown del reporte.
* `Análisis-de-CO2-en-Plantas---Proyecto-de-VieRnes-de-Bioinformática.html`: El reporte final compilado en formato HTML.
* `reports/results/DataExplorer_Reporte.html`: Reporte detallado de exploración de datos generado por `DataExplorer` (ver sección 5).
* `plot_pregunta1_conc_vs_uptake.png`: Gráfico de dispersión generado para la Pregunta 1.
* `plot_pregunta2_uptake_by_type.png`: Boxplot generado para la Pregunta 2.
* `plot_pregunta3_barras_uptake_by_treatment_type.png`: Gráfico de barras de promedios para la Pregunta 3.
* `plot_pregunta3_boxplot_uptake_by_treatment_type.png`: Boxplot con facetas para la Pregunta 3.
* Video Explicativo: .

## 5. Reporte Detallado de Exploración de Datos (`DataExplorer_Reporte.html`)

Adicionalmente al análisis principal, este proyecto incluye un reporte HTML exhaustivo generado automáticamente por el paquete `DataExplorer`. Este reporte proporciona una visión rápida y completa del dataset `CO2`, abarcando:

* **Estructura del Dataset:** Resumen de dimensiones y tipos de variables.
* **Valores Faltantes:** Identificación y visualización de datos ausentes.
* **Estadísticas Descriptivas:** Resúmenes numéricos para variables cuantitativas y frecuencias para categóricas.
* **Análisis de Distribuciones:** Histogramas para variables numéricas y gráficos de barras para categóricas.
* **Análisis de Relaciones:** Mapas de correlación entre variables numéricas y gráficos bivariados.

Este reporte se encuentra ubicado en la ruta `reports/results/DataExplorer_Reporte.html` dentro de este repositorio y es un complemento valioso para la comprensión inicial del conjunto de datos.

## 6. Generación del Reporte Principal

El reporte principal de este proyecto, `Análisis-de-CO2-en-Plantas---Proyecto-de-VieRnes-de-Bioinformática.html`, se genera a partir del archivo fuente `Análisis-de-CO2-en-Plantas---Proyecto-de-VieRnes-de-Bioinformática.Rmd` utilizando R Markdown. Este proceso integra el código R, los resultados del análisis y el texto explicativo en un documento dinámico y reproducible. El estilo visual del reporte se define mediante el formato `rmdformats::downcute`.

Para generar el reporte, se requiere tener R y el paquete `rmarkdown` instalados. El proceso se realiza en RStudio, presionando el botón "Knit" o ejecutando el comando `rmarkdown::render("Análisis-de-CO2-en-Plantas---Proyecto-de-VieRnes-de-Bioinformática.Rmd")` en la consola de R.

## 7. Requisitos (Paquetes de R)

Para replicar este análisis y generar los reportes, se requiere tener instaladas las siguientes librerías de R:

* `ggplot2`
* `dplyr`
* `rmdformats` (para el formato del reporte principal)
* `DataExplorer` (para el reporte detallado de exploración de datos)

## 8. Autor

Jazmín Fuentes Becerril

## 9. Fecha del Proyecto

18 de junio de 2025

## 10. Agradecimientos

La realización de este proyecto y el análisis de datos presentado fue posible gracias a las habilidades y conocimientos adquiridos durante las valiosas sesiones de **VieRnes de Bioinformática en el LIIGH-UNAM (2025), específicamente en su edición 2025, parte 3**. Este programa ha sido fundamental para desarrollar una comprensión práctica y sólida en el manejo de R y su aplicación en la bioinformática, permitiendo la ejecución de este ejercicio de manera integral y eficiente.

Un especial y sincero agradecimiento a la **Dra. Evelia Coss**, cuyo liderazgo y visión son clave para impulsar cursos y programas como "VieRnes de Bioinformática", generando así nuevas y significativas oportunidades de aprendizaje en el campo de la bioinformática. Su compromiso es una inspiración para el desarrollo de futuras generaciones de profesionales.
