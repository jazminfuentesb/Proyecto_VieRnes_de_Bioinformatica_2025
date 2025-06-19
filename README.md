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
* `plot_pregunta1_conc_vs_uptake.png`: Gráfico de dispersión generado para la Pregunta 1.
* `plot_pregunta2_uptake_by_type.png`: Boxplot generado para la Pregunta 2.
* `plot_pregunta3_barras_uptake_by_treatment_type.png`: Gráfico de barras de promedios para la Pregunta 3.
* `plot_pregunta3_boxplot_uptake_by_treatment_type.png`: Boxplot con facetas para la Pregunta 3.
* Video Explicativo: .

## 5. Requisitos (Paquetes de R)

Para replicar este análisis, se requiere tener instaladas las siguientes librerías de R:

* `ggplot2`
* `dplyr`
* `rmdformats` (para el formato del reporte)

## 6. Autor

Jazmín Fuentes Becerril

## 7. Fecha del Proyecto

18 de junio de 2025

## 8. Agradecimientos

La realización de este proyecto y el análisis de datos presentado fue posible gracias a las habilidades y conocimientos adquiridos durante las valiosas sesiones de "**VieRnes de Bioinformática**". Este espacio ha sido fundamental para desarrollar una comprensión práctica y sólida en el manejo de R y su aplicación en la bioinformática, permitiendo la ejecución de este ejercicio de manera integral y eficiente.

Un especial y sincero agradecimiento a la **Dra. Evelia Lorena Coss Navarrete**, cuyo liderazgo y visión son clave para impulsar cursos y programas como "VieRnes de Bioinformática", generando así nuevas y significativas oportunidades de aprendizaje en el campo de la bioinformática. Su compromiso es una inspiración para el desarrollo de futuras generaciones de profesionales.
