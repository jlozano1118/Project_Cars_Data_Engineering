-- -----------------------------------------------------
-- Creación de Tablas de Dimensiones
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS dim_vehiculo (
  id_vehiculo INT PRIMARY KEY,
  marca VARCHAR(100),
  modelo VARCHAR(100),
  anio_fabricacion INT,
  estado_condicion VARCHAR(50),
  tipo_combustible VARCHAR(50),
  transmision VARCHAR(50),
  tipo_carroceria VARCHAR(50),
  color VARCHAR(50),
  cilindros VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dim_ubicacion (
  id_ubicacion INT PRIMARY KEY,
  region VARCHAR(100),
  estado_provincia VARCHAR(100),
  ciudad_localidad VARCHAR(100),
  latitud FLOAT,
  longitud FLOAT
);

CREATE TABLE IF NOT EXISTS dim_tiempo (
  id_tiempo INT PRIMARY KEY,
  fecha_completa DATE,
  anio INT,
  mes INT,
  dia_semana VARCHAR(20),
  trimestre VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dim_comercial (
  id_comercial INT PRIMARY KEY,
  vendedor VARCHAR(150),
  cliente VARCHAR(150)
);

-- -----------------------------------------------------
-- Creación de la Tabla de Hechos
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_eventos_vehiculos (
  id_evento INT PRIMARY KEY COMMENT 'Llave Primaria',
  id_vehiculo INT,
  id_tiempo INT,
  id_ubicacion INT,
  id_comercial INT,
  precio FLOAT,
  kilometraje FLOAT,
  tasa_comision FLOAT,
  comision_ganada FLOAT,
  
  -- Definición de Relaciones (Llaves Foráneas)
  CONSTRAINT fk_fact_vehiculo 
    FOREIGN KEY (id_vehiculo) 
    REFERENCES dim_vehiculo (id_vehiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    
  CONSTRAINT fk_fact_tiempo 
    FOREIGN KEY (id_tiempo) 
    REFERENCES dim_tiempo (id_tiempo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    
  CONSTRAINT fk_fact_ubicacion 
    FOREIGN KEY (id_ubicacion) 
    REFERENCES dim_ubicacion (id_ubicacion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    
  CONSTRAINT fk_fact_comercial 
    FOREIGN KEY (id_comercial) 
    REFERENCES dim_comercial (id_comercial)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);