# 🚙 Project Cars Data Engineering

Este repositorio contiene el código y la documentación de un proyecto integral de ingeniería de datos centrado en el procesamiento, transformación y modelado de conjuntos de datos masivos de ventas de vehículos (extraídos de Kaggle). 

El objetivo principal es construir un pipeline ETL robusto, tolerante a fallos, que lleve **1,93 millones de registros** desde su estado crudo hasta un modelo dimensional optimizado, resolviendo problemas de memoria RAM y codificación de caracteres mediante computación distribuida.

## 🏗️ Arquitectura de Datos

El flujo de procesamiento sigue una arquitectura por capas (Medallion Architecture) para garantizar la calidad y escalabilidad de los datos:

* **Capa RAW (Cruda):** Almacenamiento de los datos crudos extraídos de las fuentes originales sin ningún tipo de alteración (`vehicles.csv`, `car_sales_data_2018_10.csv`, `all_regions.csv`).
* **Capa STAGING (Transformación):** Fase intermedia donde se ejecutan los scripts distribuidos de limpieza, descarte de registros malformados, normalización de caracteres en cirílico, estandarización de formatos y persistencia en formato columnar.
* **Capa Analítica:** La capa final donde los datos limpios se estructuran en un modelo dimensional listo para ser consultado por herramientas de Business Intelligence (BI) o mediante consultas SQL.

## 📊 Modelo Dimensional (Esquema en Estrella)

Para facilitar el análisis del mercado vehicular, la capa analítica está estructurada bajo un modelo de Esquema en Estrella (Star Schema):

* **Tabla de Hechos (Fact Table):** `fact_eventos_vehiculos` contiene las métricas cuantitativas y transaccionales (precio, kilometraje).
* **Tablas de Dimensiones (Dimension Tables):** Contienen los atributos descriptivos que dan contexto a los hechos:
  * `dim_vehiculo` (Clave subrogada, marca, modelo, año, transmisión).
  * `dim_tiempo` (Fecha de transacción, mes, año, trimestre).

## 🛠️ Tecnologías y Herramientas

* **Lenguaje:** Python 3.10+
* **Entorno de Desarrollo:** Google Colab / Jupyter Notebooks
* **Procesamiento Distribuido (ETL):** Apache Spark 4.0.4 (`pyspark`)
* **Almacenamiento Optimizado:** Apache Parquet (Compresión Snappy)
* **Modelado:** SQL (PostgreSQL Dialect)
* **Control de Versiones:** Git y GitHub

## 📂 Estructura del Repositorio

El proyecto se organiza en las siguientes carpetas lógicas:

```text
Project_Cars_Data_Engineering/
├── ANALYTICS/               # Scripts SQL y modelos de Data Warehousing
│   └── database_cars.sql
├── RAW/                     # Zona de aterrizaje y scripts ETL
│   ├── ing_datos_proyecto.ipynb  # Motor de procesamiento en PySpark
    └── car_sales_data_2018_10.csv # Dataset transaccional (20 MB)
├── STAGING/                 # Archivos intermedios limpios y persistencia Parquet
├── README.md                # Documentación del proyecto
└── Manual de Programacion y Código.pdf # Documentación oficial del código y pipeline
