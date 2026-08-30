# 🚗 Project Cars Data Engineering

Este repositorio contiene el código y la documentación de un proyecto integral de ingeniería de datos centrado en el procesamiento, transformación y modelado de conjuntos de datos de ventas y alquileres de vehículos (extraídos de Kaggle). El objetivo principal es construir un pipeline ETL robusto que lleve los datos desde su estado original hasta un modelo dimensional optimizado para el análisis de negocio.

## 🏗️ Arquitectura de Datos

El flujo de procesamiento sigue una arquitectura por capas para garantizar la calidad y escalabilidad de los datos:

*   **Capa Raw:** Almacenamiento de los datos crudos extraídos de las fuentes originales sin ningún tipo de alteración.
*   **Capa de Transformación (Staging):** Fase intermedia donde se ejecutan los scripts de limpieza, manejo de valores nulos, estandarización de formatos y validación de tipos de datos.
*   **Capa Analítica:** La capa final donde los datos limpios se estructuran en un modelo dimensional listo para ser consultado por herramientas de Business Intelligence (BI) o mediante consultas SQL.

## 📊 Modelo Dimensional (Esquema en Estrella)

Para facilitar el análisis de los alquileres y las ventas de vehículos, la capa analítica está estructurada bajo un modelo de **Esquema en Estrella** (Star Schema):

*   **Tabla de Hechos (Fact Table):** Contiene las métricas cuantitativas y transaccionales (por ejemplo, registros de ventas, contratos de alquiler, ingresos).
*   **Tablas de Dimensiones (Dimension Tables):** Contienen los atributos descriptivos que dan contexto a los hechos:
    *   `Dim_Vehiculo` (Marca, modelo, especificaciones, año).
    *   `Dim_Tiempo` (Fecha de transacción, mes, año, trimestre).
    *   `Dim_Cliente` (Datos demográficos y de contacto estandarizados).
    *   `Dim_Sucursal/Ubicacion` (Puntos de venta o alquiler).

## 🛠️ Tecnologías y Herramientas

*   **Lenguaje:** Python
*   **Entorno de Desarrollo:** Google Colab
*   **Procesamiento y ETL:** Pandas / NumPy
*   **Modelado:** SQL / Conceptos de Data Warehousing
*   **Control de Versiones:** Git y GitHub

## 📂 Estructura del Repositorio

\`\`\`text
Project_Cars_Data_Engineering/
│
├── data/
│   ├── raw/               # Datasets originales de Kaggle (ventas y alquileres)
│   └── analytical/        # Datos procesados listos para el esquema en estrella
│
├── notebooks/             
│   ├── 01_data_extraction.ipynb    # Extracción y exploración inicial
│   ├── 02_etl_transformations.ipynb # Limpieza y transformaciones en Pandas
│   └── 03_star_schema_model.ipynb  # Construcción del modelo dimensional
│
├── src/                   # Scripts de Python con funciones ETL reutilizables
│
├── README.md              # Documentación del proyecto
└── requirements.txt       # Dependencias del proyecto
\`\`\`

## 🚀 Cómo Ejecutar el Proyecto

1.  **Clonar el repositorio:**
    \`\`\`bash
    git clone https://github.com/jlozano1118/Project_Cars_Data_Engineering.git
    cd Project_Cars_Data_Engineering
    \`\`\`

2.  **Instalar las dependencias:**
    Asegúrate de tener Python instalado y ejecuta:
    \`\`\`bash
    pip install -r requirements.txt
    \`\`\`

3.  **Ejecutar los pipelines:**
    *   Si utilizas Google Colab, puedes subir la carpeta `notebooks/` y ejecutar las celdas secuencialmente para replicar el proceso ETL, asegurándote de cargar los datasets correspondientes en la carpeta `data/raw/`.
