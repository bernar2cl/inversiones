-- =========================================================
--  CREACIÓN DE BASE DE DATOS
-- =========================================================
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'inversiones_db')
BEGIN
    CREATE DATABASE inversiones_db;
END;
GO

USE inversiones_db;
GO

-- =========================================================
--  TABLA: paises
-- =========================================================
CREATE TABLE paises (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);
GO

-- =========================================================
--  TABLA: industrias
-- =========================================================
CREATE TABLE industrias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);
GO

-- =========================================================
--  TABLA: acciones
-- =========================================================
CREATE TABLE acciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ticker VARCHAR(20),
    pais_id INT NOT NULL,
    industria_id INT NOT NULL,
    FOREIGN KEY (pais_id) REFERENCES paises(id) ON DELETE CASCADE,
    FOREIGN KEY (industria_id) REFERENCES industrias(id) ON DELETE CASCADE
);
GO

-- =========================================================
--  TABLA: relaciones_mercado
-- =========================================================
CREATE TABLE relaciones_mercado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    accion_id INT NOT NULL,
    precio_accion DECIMAL(15,2),
    cantidad_acciones DECIMAL(20,0),
    utilidad_mes_actual DECIMAL(20,0),
    utilidad_final_anterior DECIMAL(20,0),
    utilidad_mes_anterior DECIMAL(20,0),
    patrimonio_mes_actual DECIMAL(20,0),
    fecha_registro DATE DEFAULT GETDATE(),
    periodo_reportado CHAR(2) CHECK (periodo_reportado IN ('01','02','03','04','05','06','07','08','09','10','11','12')) NOT NULL,
    FOREIGN KEY (accion_id) REFERENCES acciones(id) ON DELETE CASCADE
);
GO

-- =========================================================
--  TABLA: rangos_bolsa_libro
-- =========================================================
CREATE TABLE rangos_bolsa_libro (
    id INT IDENTITY(1,1) PRIMARY KEY,
    accion_id INT NOT NULL,
    nivel VARCHAR(10) CHECK (nivel IN ('BAJO','NORMAL','ALTO')),
    valor DECIMAL(10,2),
    FOREIGN KEY (accion_id) REFERENCES acciones(id) ON DELETE CASCADE
);
GO

-- =========================================================
--  DATOS BASE
-- =========================================================
INSERT INTO paises (nombre) VALUES
('CHILE'),
('EEUU');
GO

INSERT INTO industrias (nombre) VALUES
('BANCO'),
('EMBOTELLADORA'),
('ENERGIA'),
('GAS'),
('HOLDING'),
('PROPIEDADES'),
('MATERIA PRIMA'),
('CONSUMER GOODS'),
('REAL ESTATE - REITs');
GO

INSERT INTO acciones (nombre, ticker, pais_id, industria_id) VALUES
('Banco de Chile', 'CHILE', 1, 1),
('Embotelladora Andina A', 'ANDINA-A', 1, 2),
('Embotelladora Andina B', 'ANDINA-B', 1, 2),
('Embonor B', 'EMBONOR-B', 1, 2),
('Enel Chile', 'ENELCHILE', 1, 3),
('Enel Generación Chile', 'ENELGXCH', 1, 3),
('Colbún', 'COLBUN', 1, 3),
('Lipigas', 'LIPIGAS', 1, 4),
('Nuam', 'NUAM', 1, 5),
('CF Inversiones Rentas', 'CFINRENTAS', 1, 6),
('CFI BTG Renta CA', 'CFIBTGRCA', 1, 6),
('CFI BTG Renta RA', 'CFIBTGRRA', 1, 6),
('Cenco Malls', 'CENCOMALLS', 1, 6),
('OxiQuim', 'OXIQUIM', 1, 7),
('Procter & Gamble', 'PG', 2, 8),
('Realty Income', 'O', 2, 9);
GO

-- =========================================================
--  INSERTS: rangos_bolsa_libro
-- =========================================================
--🏦 Banco de Chile
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(1, 'BAJO', 1.58),
(1, 'NORMAL', 2.36),
(1, 'ALTO', 3.06);

--🥤 Embotelladora Andina A
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(2, 'BAJO', 1.36),
(2, 'NORMAL', 2.11),
(2, 'ALTO', 3.03);

--🥤 Embotelladora Andina B
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(3, 'BAJO', 1.44),
(3, 'NORMAL', 2.33),
(3, 'ALTO', 3.61);

--🥤 Embonor B
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(4, 'BAJO', 0.71),
(4, 'NORMAL', 1.55),
(4, 'ALTO', 2.47);

--⚡ Enel Chile
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(5, 'BAJO', 0.61),
(5, 'NORMAL', 0.96),
(5, 'ALTO', 1.36);

--⚡ Enel Generación Chile
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(6, 'BAJO', 0.74),
(6, 'NORMAL', 1.33),
(6, 'ALTO', 2.29);

--💡 Colbún
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(7, 'BAJO', 0.45),
(7, 'NORMAL', 0.68),
(7, 'ALTO', 0.88);

--🔥 Lipigas
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(8, 'BAJO', 1.48),
(8, 'NORMAL', 3.15),
(8, 'ALTO', 4.44);

--🏢 Nuam
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(9, 'BAJO', 0.40),
(9, 'NORMAL', 0.73),
(9, 'ALTO', 0.92);

--🏠 CF Inversiones Rentas
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(10, 'BAJO', 0.58),
(10, 'NORMAL', 0.92),
(10, 'ALTO', 1.24);

--🏠 CFI BTG Renta CA
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(11, 'BAJO', 0.47),
(11, 'NORMAL', 0.77),
(11, 'ALTO', 1.14);

--🏠 CFI BTG Renta RA
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(12, 'BAJO', 0.68),
(12, 'NORMAL', 0.93),
(12, 'ALTO', 1.00);

--🏠 Cenco Malls
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(13, 'BAJO', 0.67),
(13, 'NORMAL', 0.86),
(13, 'ALTO', 1.00);

--⚗️ OxiQuim
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(14, 'BAJO', 0.80),
(14, 'NORMAL', 1.58),
(14, 'ALTO', 2.40);

--🇺🇸 Procter & Gamble (PG)
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(15, 'BAJO', 5.25),
(15, 'NORMAL', 10.03),
(15, 'ALTO', 19.08);

--🏢 Realty Income (O)
INSERT INTO rangos_bolsa_libro (accion_id, nivel, valor) VALUES
(16, 'BAJO', 1.38),
(16, 'NORMAL', 1.86),
(16, 'ALTO', 2.38);
GO

-- 🏦 Banco de Chile
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(1, 177.09, 101017081114, 1025440000000, 1207392000000, 990472000000, 5721839000000, '10');

-- 🥤 Embotelladora Andina A
INSERT INTO relaciones_mercado
(accion_id,  precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(2, 3650.00, 946570604, 168746694000, 234644125000, 134127397000, 1173654999000, '09');

-- 🥤 Embotelladora Andina B
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(3, 3650.00, 946570604, 168746694000, 234644125000, 134127397000, 1173654999000, '09');

-- 🥤 Embonor B
INSERT INTO relaciones_mercado
(accion_id,  precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(4, 1388.90, 510853230, 21240589000, 74284662000, 31139313000, 571732228000, '09');

-- ⚡ Enel Chile
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(5, 72.50, 69166557220, 384530000000, 191042971000, 488646000000, 5470743000000, '09');

-- ⚡ Enel Generación Chile
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(6, 484.00, 8201754580, 392079000000, 502878333000, 477672000000, 2788210000000, '09');

-- 💡 Colbún
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(7, 141.00, 17536167720, 155886000000, 244299150000, 203021000000, 3312544000000, '09');

-- 🔥 Lipigas
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(8, 7350.00, 113574515, 64378223000, 63051861000, 51263210000, 262453565000, '09');

-- 🏢 Nuam
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(9, 4960.40, 88375972, 26285258000, 1154575000000, 28648792000, 520396119000, '09');

-- 🏠 CF Inversiones Rentas
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(10, 1930.00, 290545000, 65220105000, 56861036000, 48815401000, 629005701000, '09');

-- 🏠 CFI BTG Renta CA
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(11, 25000.00, 10441013, 16650951000, 56861036000, 17135246000, 588811624000, '09');

-- 🏠 CFI BTG Renta RA
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(12, 10826.32, 8694575, 4585789000, 10728591000, 5065735000, 109577693000, '09');

-- 🏠 Cenco Malls
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(13, 2845.00, 1705831078, 63447000000, 192925399000000, 67744000000, 2876317000000, '09');

-- ⚗️ OxiQuim
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(14, 11380.00, 24886705, 6723782000, 26317615000, 5830573000, 123450649000, '09');

-- 🇺🇸 Procter & Gamble (PG)
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(15, 150.00, 2344542, 9482000, 14974000, 8246000, 52545000, '09');

-- 🏢 Realty Income (O)
INSERT INTO relaciones_mercado
(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado)
VALUES
(16, 60.32, 914306087, 450473000, 867341000, 394867000, 39363335000, '09');
GO



-- =========================================================
--  VISTA: vw_estado_accion
-- =========================================================
CREATE OR ALTER VIEW vw_estado_accion AS
SELECT
  a.id AS accion_id,
  a.nombre,
  a.ticker,
  p.nombre AS pais,
  i.nombre AS industria,
  rm.fecha_registro,
  rm.periodo_reportado,
  ROUND(rm.precio_accion * rm.cantidad_acciones, 0) AS market_cap,
  rm.precio_accion,
  rm.cantidad_acciones,
  rm.utilidad_mes_actual,
  rm.utilidad_final_anterior,
  rm.utilidad_mes_anterior,
  rm.patrimonio_mes_actual,
  (rm.utilidad_final_anterior - rm.utilidad_mes_anterior) AS utilidad_movil,
  (rm.utilidad_mes_actual + (rm.utilidad_final_anterior - rm.utilidad_mes_anterior)) AS utilidad_12m_movil,
  CASE
    WHEN (rm.utilidad_mes_actual + (rm.utilidad_final_anterior - rm.utilidad_mes_anterior)) <> 0
    THEN ROUND((rm.precio_accion * rm.cantidad_acciones) / (rm.utilidad_mes_actual + (rm.utilidad_final_anterior - rm.utilidad_mes_anterior)), 2)
  END AS precio_utilidad,
  CASE
    WHEN rm.patrimonio_mes_actual <> 0
    THEN ROUND((rm.precio_accion * rm.cantidad_acciones) / rm.patrimonio_mes_actual, 2)
  END AS valor_bolsa_libro,
  CASE
    WHEN (rm.precio_accion * rm.cantidad_acciones) <> 0
    THEN ROUND(((rm.utilidad_mes_actual + (rm.utilidad_final_anterior - rm.utilidad_mes_anterior)) / (rm.precio_accion * rm.cantidad_acciones)) * 100, 2)
  END AS utilidad_precio,
  CASE
    WHEN rm.cantidad_acciones <> 0
    THEN ROUND(rm.patrimonio_mes_actual / rm.cantidad_acciones, 2)
  END AS valor_libro_ajustado,
  ROUND(vb_bajo.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones), 2) AS valor_bajo,
  ROUND(vb_normal.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones), 2) AS valor_normal,
  ROUND(vb_alto.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones), 2) AS valor_alto,
  CASE
    WHEN rm.precio_accion < (vb_bajo.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 'PENAL SIN ARQUERO'
    WHEN rm.precio_accion >= (vb_bajo.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones))
         AND rm.precio_accion < (vb_normal.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 'COMPRA CON GANAS'
    WHEN rm.precio_accion >= (vb_normal.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones))
         AND rm.precio_accion < (vb_alto.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 'COMPRA'
    WHEN rm.precio_accion >= (vb_alto.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 'COMPRA MUY POCO'
  END AS estado,
  CASE
    WHEN rm.precio_accion < (vb_bajo.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 1
    WHEN rm.precio_accion >= (vb_bajo.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones))
         AND rm.precio_accion < (vb_normal.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 1
    WHEN rm.precio_accion >= (vb_normal.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones))
         AND rm.precio_accion < (vb_alto.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN 0
    WHEN rm.precio_accion >= (vb_alto.valor * (rm.patrimonio_mes_actual / rm.cantidad_acciones)) THEN -1
  END AS icono
FROM acciones a
JOIN paises p ON p.id = a.pais_id
JOIN industrias i ON i.id = a.industria_id
JOIN relaciones_mercado rm ON rm.accion_id = a.id
JOIN rangos_bolsa_libro vb_bajo ON vb_bajo.accion_id = a.id AND vb_bajo.nivel = 'BAJO'
JOIN rangos_bolsa_libro vb_normal ON vb_normal.accion_id = a.id AND vb_normal.nivel = 'NORMAL'
JOIN rangos_bolsa_libro vb_alto ON vb_alto.accion_id = a.id AND vb_alto.nivel = 'ALTO';
GO