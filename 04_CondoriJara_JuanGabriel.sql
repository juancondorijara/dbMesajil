-- CREAR LA BASE DE DATOS
CREATE DATABASE dbMesajil
GO

-- PONER EN USO LA BASE DE DATOS dbMESAJIL
USE dbMesajil
GO

-- CREAR TABLA USUARIO
CREATE TABLE USUARIO (
    IDUSU int identity(1,1) NOT NULL,
    NOMUSU varchar(50) NOT NULL,
    APEUSU varchar(50) NOT NULL,
    DIRUSU varchar(80) NOT NULL,
    DNIUSU char(8) NOT NULL,
    CELUSU char(9) NOT NULL,
    SEXUSU char(1) NOT NULL,
    TIPUSU char(1) NOT NULL,
    CODUBI char(6) NOT NULL,
    IDSUC int NOT NULL,
    ESTUSU char(1) NOT NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSU)
);
GO

-- CREAR TABLA SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int identity(1,1) NOT NULL,
    NOMSUC varchar(50) NOT NULL,
	EMASUC varchar(80) NOT NULL,
    DIRSUC varchar(80) NOT NULL,
    CELSUC char(9) NOT NULL,
    CODUBI char(6) NOT NULL,
    ESTSUC char(1) NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY (IDSUC)
);
GO

-- CREAR TABLA EQUIPO
CREATE TABLE EQUIPO (
    IDEQUI int identity(1,1) NOT NULL,
    NOMEQUI varchar(50) NOT NULL,
    MAREQUI varchar(50) NOT NULL,
    MODEQUI varchar(50) NOT NULL,
    PREEQUI decimal(10,2) NOT NULL,
    STOEQUI varchar(3) NOT NULL,
    ESTEQUI char(1) NOT NULL,
    CONSTRAINT EQUIPO_pk PRIMARY KEY (IDEQUI)
);
GO

-- CREAR TABLA UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6) NOT NULL,
    DEPUBI varchar(50) NOT NULL,
    PROUBI varchar(50) NOT NULL,
    DISUBI varchar(50) NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
);
GO

-- CREAR TABLA VENTA
CREATE TABLE VENTA (
    IDVEN int identity(1,1) NOT NULL,
    IDUSU int NOT NULL,
    FECVEN date NOT NULL,
    TOTVEN decimal(10,2) NOT NULL,
    ESTVEN char(1) NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVEN)
);
GO

-- CREAR TABLA VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int identity(1,1) NOT NULL,
    CANVENDET int NOT NULL,
    SUBVENDET decimal(10,2) NOT NULL,
    IDEQUI int NOT NULL,
    IDVEN int NOT NULL,
    ESTVENDET char(1) NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENDET)
);
GO

-- Relacionar la tabla USUARIO - UBIGEO
ALTER TABLE USUARIO
ADD CONSTRAINT FK_USUARIO_UBIGEO
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI)
GO

-- Relacionar la tabla SUCURSAL - UBIGEO
ALTER TABLE SUCURSAL
ADD CONSTRAINT FK_SUCURSAL_UBIGEO
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI)
GO

-- Relacionar la tabla USUARIO - SUCURSAL
ALTER TABLE USUARIO
ADD CONSTRAINT FK_USUARIO_SUCURSAL
FOREIGN KEY (IDSUC) REFERENCES SUCURSAL (IDSUC)
GO

-- Relacionar la tabla VENTA - USUARIO
ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_USUARIO
FOREIGN KEY (IDUSU) REFERENCES USUARIO (IDUSU)
GO

-- Relacionar la tabla VENTA_DETALLE - VENTA
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT FK_VENTA_DETALLE_VENTA
FOREIGN KEY (IDVEN) REFERENCES VENTA (IDVEN)
GO

-- Relacionar la tabla VENTA_DETALLE - EQUIPO
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT FK_VENTA_DETALLE_EQUIPO
FOREIGN KEY (IDEQUI) REFERENCES EQUIPO (IDEQUI)
GO


-- INSERTAR REGISTROS DE UBIGEO
INSERT INTO UBIGEO
(CODUBI, DEPUBI, PROUBI, DISUBI)
VALUES
('110201','ICA','CHINCHA','CHINCHA ALTA'),
('110202','ICA','CHINCHA','ALTO LARAN'),
('110203','ICA','CHINCHA','CHAVIN'),
('110204','ICA','CHINCHA','CHINCHA BAJA'),
('110205','ICA','CHINCHA','EL CARMEN'),
('110206','ICA','CHINCHA','GROCIO PRADO'),
('110207','ICA','CHINCHA','PUEBLO NUEVO'),
('110208','ICA','CHINCHA','SAN JUAN DE YANAC'),
('110209','ICA','CHINCHA','SAN PEDRO DE HUACARPANA'),
('110210','ICA','CHINCHA','SUNAMPE'),
('110211','ICA','CHINCHA','TAMBO DE MORA'),
('150101','LIMA','LIMA','LIMA'),
('150102','LIMA','LIMA','ANCON'),
('150103','LIMA','LIMA','ATE'),
('150104','LIMA','LIMA','BARRANCO'),
('150105','LIMA','LIMA','BREÑA'),
('150106','LIMA','LIMA','CARABAYLLO'),
('150107','LIMA','LIMA','CHACLACAYO'),
('150108','LIMA','LIMA','CHORRILLOS'),
('150109','LIMA','LIMA','CIENEGUILLA'),
('150110','LIMA','LIMA','COMAS'),
('150111','LIMA','LIMA','EL AGUSTINO'),
('150112','LIMA','LIMA','INDEPENDENCIA'),
('150113','LIMA','LIMA','JESUS MARIA'),
('150114','LIMA','LIMA','LA MOLINA'),
('150115','LIMA','LIMA','LA VICTORIA'),
('150116','LIMA','LIMA','LINCE'),
('150117','LIMA','LIMA','LOS OLIVOS'),
('150118','LIMA','LIMA','LURIGANCHO'),
('150119','LIMA','LIMA','LURIN'),
('150120','LIMA','LIMA','MAGDALENA DEL MAR'),
('150121','LIMA','LIMA','MAGDALENA VIEJA'),
('150122','LIMA','LIMA','MIRAFLORES'),
('150123','LIMA','LIMA','PACHACAMAC'),
('150124','LIMA','LIMA','PUCUSANA'),
('150125','LIMA','LIMA','PUENTE PIEDRA'),
('150126','LIMA','LIMA','PUNTA HERMOSA'),
('150127','LIMA','LIMA','PUNTA NEGRA'),
('150128','LIMA','LIMA','RIMAC'),
('150129','LIMA','LIMA','SAN BARTOLO'),
('150130','LIMA','LIMA','SAN BORJA'),
('150131','LIMA','LIMA','SAN ISIDRO'),
('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),
('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),
('150134','LIMA','LIMA','SAN LUIS'),
('150135','LIMA','LIMA','SAN MARTIN DE PORRES'),
('150136','LIMA','LIMA','SAN MIGUEL'),
('150137','LIMA','LIMA','SANTA ANITA'),
('150138','LIMA','LIMA','SANTA MARIA DEL MAR'),
('150139','LIMA','LIMA','SANTA ROSA'),
('150140','LIMA','LIMA','SANTIAGO DE SURCO'),
('150141','LIMA','LIMA','SURQUILLO'),
('150142','LIMA','LIMA','VILLA EL SALVADOR'),
('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),
('150201','LIMA','BARRANCA','BARRANCA'),
('150202','LIMA','BARRANCA','PARAMONGA'),
('150203','LIMA','BARRANCA','PATIVILCA'),
('150204','LIMA','BARRANCA','SUPE'),
('150205','LIMA','BARRANCA','SUPE PUERTO'),
('150301','LIMA','CAJATAMBO','CAJATAMBO'),
('150302','LIMA','CAJATAMBO','COPA'),
('150303','LIMA','CAJATAMBO','GORGOR'),
('150304','LIMA','CAJATAMBO','HUANCAPON'),
('150305','LIMA','CAJATAMBO','MANAS'),
('150401','LIMA','CANTA','CANTA'),
('150402','LIMA','CANTA','ARAHUAY'),
('150403','LIMA','CANTA','HUAMANTANGA'),
('150404','LIMA','CANTA','HUAROS'),
('150405','LIMA','CANTA','LACHAQUI'),
('150406','LIMA','CANTA','SAN BUENAVENTURA'),
('150407','LIMA','CANTA','SANTA ROSA DE QUIVES'),
('150501','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),
('150502','LIMA','CAÑETE','ASIA'),
('150503','LIMA','CAÑETE','CALANGO'),
('150504','LIMA','CAÑETE','CERRO AZUL'),
('150505','LIMA','CAÑETE','CHILCA'),
('150506','LIMA','CAÑETE','COAYLLO'),
('150507','LIMA','CAÑETE','IMPERIAL'),
('150508','LIMA','CAÑETE','LUNAHUANA'),
('150509','LIMA','CAÑETE','MALA'),
('150510','LIMA','CAÑETE','NUEVO IMPERIAL'),
('150511','LIMA','CAÑETE','PACARAN'),
('150512','LIMA','CAÑETE','QUILMANA'),
('150513','LIMA','CAÑETE','SAN ANTONIO'),
('150514','LIMA','CAÑETE','SAN LUIS'),
('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),
('150516','LIMA','CAÑETE','ZUÑIGA'),
('150601','LIMA','HUARAL','HUARAL'),
('150602','LIMA','HUARAL','ATAVILLOS ALTO'),
('150603','LIMA','HUARAL','ATAVILLOS BAJO'),
('150604','LIMA','HUARAL','AUCALLAMA'),
('150605','LIMA','HUARAL','CHANCAY'),
('150606','LIMA','HUARAL','IHUARI'),
('150607','LIMA','HUARAL','LAMPIAN'),
('150608','LIMA','HUARAL','PACARAOS'),
('150609','LIMA','HUARAL','SAN MIGUEL DE ACOS'),
('150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),
('150611','LIMA','HUARAL','SUMBILCA'),
('150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),
('150701','LIMA','HUAROCHIRI','MATUCANA'),
('150702','LIMA','HUAROCHIRI','ANTIOQUIA'),
('150703','LIMA','HUAROCHIRI','CALLAHUANCA'),
('150704','LIMA','HUAROCHIRI','CARAMPOMA'),
('150705','LIMA','HUAROCHIRI','CHICLA'),
('150706','LIMA','HUAROCHIRI','CUENCA'),
('150707','LIMA','HUAROCHIRI','HUACHUPAMPA'),
('150708','LIMA','HUAROCHIRI','HUANZA'),
('150709','LIMA','HUAROCHIRI','HUAROCHIRI'),
('150710','LIMA','HUAROCHIRI','LAHUAYTAMBO'),
('150711','LIMA','HUAROCHIRI','LANGA'),
('150712','LIMA','HUAROCHIRI','LARAOS'),
('150713','LIMA','HUAROCHIRI','MARIATANA'),
('150714','LIMA','HUAROCHIRI','RICARDO PALMA'),
('150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),
('150716','LIMA','HUAROCHIRI','SAN ANTONIO'),
('150717','LIMA','HUAROCHIRI','SAN BARTOLOME'),
('150718','LIMA','HUAROCHIRI','SAN DAMIAN'),
('150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),
('150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),
('150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),
('150722','LIMA','HUAROCHIRI','SAN MATEO'),
('150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),
('150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),
('150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),
('150726','LIMA','HUAROCHIRI','SANGALLAYA'),
('150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),
('150728','LIMA','HUAROCHIRI','SANTA EULALIA'),
('150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),
('150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),
('150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),
('150732','LIMA','HUAROCHIRI','SURCO'),
('150801','LIMA','HUAURA','HUACHO'),
('150802','LIMA','HUAURA','AMBAR'),
('150803','LIMA','HUAURA','CALETA DE CARQUIN'),
('150804','LIMA','HUAURA','CHECRAS'),
('150805','LIMA','HUAURA','HUALMAY'),
('150806','LIMA','HUAURA','HUAURA'),
('150807','LIMA','HUAURA','LEONCIO PRADO'),
('150808','LIMA','HUAURA','PACCHO'),
('150809','LIMA','HUAURA','SANTA LEONOR'),
('150810','LIMA','HUAURA','SANTA MARIA'),
('150811','LIMA','HUAURA','SAYAN'),
('150812','LIMA','HUAURA','VEGUETA'),
('150901','LIMA','OYON','OYON'),
('150902','LIMA','OYON','ANDAJES'),
('150903','LIMA','OYON','CAUJUL'),
('150904','LIMA','OYON','COCHAMARCA'),
('150905','LIMA','OYON','NAVAN'),
('150906','LIMA','OYON','PACHANGARA'),
('151001','LIMA','YAUYOS','YAUYOS'),
('151002','LIMA','YAUYOS','ALIS'),
('151003','LIMA','YAUYOS','AYAUCA'),
('151004','LIMA','YAUYOS','AYAVIRI'),
('151005','LIMA','YAUYOS','AZANGARO'),
('151006','LIMA','YAUYOS','CACRA'),
('151007','LIMA','YAUYOS','CARANIA'),
('151008','LIMA','YAUYOS','CATAHUASI'),
('151009','LIMA','YAUYOS','CHOCOS'),
('151010','LIMA','YAUYOS','COCHAS'),
('151011','LIMA','YAUYOS','COLONIA'),
('151012','LIMA','YAUYOS','HONGOS'),
('151013','LIMA','YAUYOS','HUAMPARA'),
('151014','LIMA','YAUYOS','HUANCAYA'),
('151015','LIMA','YAUYOS','HUANGASCAR'),
('151016','LIMA','YAUYOS','HUANTAN'),
('151017','LIMA','YAUYOS','HUAÑEC'),
('151018','LIMA','YAUYOS','LARAOS'),
('151019','LIMA','YAUYOS','LINCHA'),
('151020','LIMA','YAUYOS','MADEAN'),
('151021','LIMA','YAUYOS','MIRAFLORES'),
('151022','LIMA','YAUYOS','OMAS'),
('151023','LIMA','YAUYOS','PUTINZA'),
('151024','LIMA','YAUYOS','QUINCHES'),
('151025','LIMA','YAUYOS','QUINOCAY'),
('151026','LIMA','YAUYOS','SAN JOAQUIN'),
('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS'),
('151028','LIMA','YAUYOS','TANTA'),
('151029','LIMA','YAUYOS','TAURIPAMPA'),
('151030','LIMA','YAUYOS','TOMAS'),
('151031','LIMA','YAUYOS','TUPE'),
('151032','LIMA','YAUYOS','VIÑAC'),
('151033','LIMA','YAUYOS','VITIS');
GO

-- INSERTAR REGISTROS DE SUCURSAL
INSERT INTO SUCURSAL
(NOMSUC, EMASUC, DIRSUC, CELSUC, CODUBI, ESTSUC)
VALUES
('Lima - Compuplaza (Tienda 107)', 'tienda107@mesajilhnos.com', 'Av. Garcilaso de la Vega 1249 – Tienda 107 – Lima', '934934276', '150101', 'A'),
('Lima - Garcilaso (Tienda 213)', 'ventas@mesajil.com', 'Av. Garcilaso de la Vega 1261- Tienda 213 – Lima', '998192606', '150101', 'A'),
('Lima Centro', 'ventas@mesajil.com', 'Jr. Camaná 1127 Lima – Cercado', '998475645', '150101', 'A'),
('San Isidro', 'tiendasi@mesajilhnos.com', 'Av. República de Colombia 130 – 136 -San Isidro', '983472621', '150131', 'A'),
('La Molina', 'tiendalamolina@mesajilhnos.com', 'Av. Javier Prado Este 5940 – La Molina', '934926818', '150114', 'A'),
('Miraflores - Compupalace (Tienda 2107)', 'ventas@mesajil.com', 'Av. Petit Thouars 5356 – Tienda 2107-2108 – Miraflores', '989347622', '150122', 'A'),
('Miraflores - Compupalace (Tienda 1073)', 'showroomhp@mesajilhnos.com', 'Av. Petit Thouars 5356 – Tienda 1073- Miraflores', '998143568', '150122', 'A'),
('Miraflores - Compupalace (Tienda 1112)', 'tienda1112@mesajilhnos.com', 'Av. Petit Thouars 5356 – Tienda 1112- Miraflores', '932457821', '150122', 'A');
GO

-- INSERTAR REGISTROS DE USUARIO
INSERT INTO USUARIO
(NOMUSU, APEUSU, DIRUSU, DNIUSU, CELUSU, SEXUSU, TIPUSU, CODUBI, IDSUC, ESTUSU)
VALUES
('Juan Gabriel', 'Condori Jara', 'Nuevo Hualcara Mz:K Lt:3', '49896785', '940460321', 'M', 'A', '150501', '3', 'A'),
('Sergio Danilo', 'Flores Tadeo', 'San Vicente Mz:J Lt:5', '48694756', '948695767', 'M', 'J', '150502', '4', 'A'),
('Josue Miguel', 'Alarcon Asto', 'Santa Rosa Mz:T Lt:7', '50402968', '998475645', 'M', 'V', '150503', '3', 'A'),
('Maria Daniela', 'Díaz Romero', 'Imperial Mz:C Lt:9', '51503821', '903489256', 'F', 'C', '150504', '4', 'A'),
('Diego Alvaro', 'Galvez Quispe', 'Las Malvinas Mz:V Lt:2', '48039847', '919803481', 'M', 'A', '150505', '5', 'A'),
('Lucia Dayana', 'Cuzcano Cuya', 'Santa Rosa Mz:E Lt:4', '49684565', '989347622', 'F', 'J', '150506', '6', 'A'),
('Victor Raúl', 'Quispe Manturano', 'San Luis Mz:G Lt:6', '50694762', '998143568', 'M', 'V', '150507', '7', 'A'),
('Sofia Carmen', 'Huamán Vásquez', 'San Antonio Mz:R Lt:3', '51492857', '932457821', 'F', 'C', '150508', '8', 'A'),
('Kevin Rodrigo', 'Guerra Cáceres', 'Nuevo Imperial Mz:F Lt:6', '52958732', '998436512', 'M', 'A', '150509', '4', 'A'),
('Brayan Enrique', 'Vicente Manrique', 'Mala Mz:N Lt:8', '49487956', '956734563', 'M', 'V', '150510', '3', 'A');
GO

-- INSERTAR REGISTROS DE EQUIPO
INSERT INTO EQUIPO
(NOMEQUI, MAREQUI, MODEQUI, PREEQUI, STOEQUI, ESTEQUI)
VALUES
('Laptop', 'HP', 'ProBook 450 G7', '4448.85', '30', 'A'),
('Adaptador', 'Astro', 'HDMI a óptico', '157.61', '50', 'A'),
('Impresora', 'HP', 'LaserJet Pro M428fdw', '1735.65', '35', 'A'),
('Router', 'ASUS', 'RT-AX82U', '1316.70', '45', 'A'),
('Mouse', 'Microsoft', 'Souris Bluetooth', '71.82', '55', 'A'),
('Audifono', 'Corsair', 'HS35 Stereo', '179.55', '40', 'A'),
('Laptop', 'Lenovo', 'Ideapad 3 14IIL05', '1991.01', '35', 'A'),
('Microfono', 'BLUE', 'YETI Nano', '418.95', '40', 'A'),
('Teclado', 'Antryx', 'MK750 Switch Blue', '175.56', '50', 'A'),
('Tablet', 'Samsung', 'Galaxy Tab-A', '578.55', '35', 'A');
GO

-- INSERTAR REGISTROS DE VENTA
INSERT INTO VENTA
(IDUSU, FECVEN, TOTVEN, ESTVEN)
VALUES
('3', '2021-07-09', '4448.85', 'A'),
('4', '2021-07-10', '1157.61', 'A'),
('7', '2021-07-08', '1765.65', 'A'),
('8', '2021-07-09', '1516.70', 'A'),
('10', '2021-07-10', '1856.82', 'A');
GO

-- INSERTAR REGISTROS DE VENTA_DETALLE
INSERT INTO VENTA_DETALLE
(CANVENDET, SUBVENDET, IDEQUI, IDVEN, ESTVENDET)
VALUES
('1', '873.00', '2', '1', 'A'),
('3', '576.00', '5', '2', 'A'),
('1', '654.00', '2', '3', 'A'),
('4', '778.00', '8', '4', 'A'),
('2', '664.00', '9', '5', 'A');
GO


-- Reporte de los clientes más frecuencia en el último mes
CREATE VIEW vClientesMes
AS 
SELECT
    V.IDVEN AS 'ID de Venta',
	FORMAT(V.FECVEN, 'd', 'es_ES') AS 'Fecha de Venta',
    U.NOMUSU AS 'Nombre del Cliente',
    U.APEUSU AS 'Apellido del Cliente'
FROM VENTA AS V
    INNER JOIN USUARIO AS U ON
    V.IDUSU = U.IDUSU
WHERE 
    MONTH(V.FECVEN) = 07
AND
    U.ESTUSU = 'A'
GO

-- Reporte de los equipos más vendidos en el ultimo mes
CREATE VIEW vEquiposMes
AS 
SELECT
    V.IDVEN AS 'ID de Venta',
	VD.IDVENDET AS 'ID de Venta Detalle',
	FORMAT(V.FECVEN, 'd', 'es_ES') AS 'Fecha de Venta',
    E.NOMEQUI AS 'Nombre del Equipo'
FROM VENTA_DETALLE AS VD
    INNER JOIN VENTA AS V ON
    VD.IDVEN = V.IDVEN
    INNER JOIN EQUIPO AS E ON 
    VD.IDEQUI = E.IDEQUI
WHERE
    MONTH(V.FECVEN) = 07
AND
    E.ESTEQUI = 'A'
GO

-- Reporte de los clientes y equipos a los que se ha realizado una venta con su detalle de cantidad
CREATE VIEW vClientesYEquipos
AS 
SELECT
    V.IDVEN AS 'ID de Venta',
    VD.IDVENDET AS 'ID de Venta Detalle',
	U.NOMUSU AS 'Nombre del Cliente',
	U.APEUSU AS 'Apellido del Cliente',
	E.NOMEQUI AS 'Nombre del Equipo',
	VD.CANVENDET AS 'Cantidad'
FROM VENTA_DETALLE AS VD
    INNER JOIN VENTA AS V ON
    VD.IDVEN = V.IDVEN
    INNER JOIN USUARIO AS U ON
    V.IDUSU = U.IDUSU
	INNER JOIN EQUIPO AS E ON
    VD.IDEQUI = E.IDEQUI
WHERE 
    U.ESTUSU = 'A'
AND
    E.ESTEQUI = 'A'
GO


-- Procedimiento Almacenado para insertar VENTA (cabecera)
CREATE PROCEDURE spInsertVenta
    (
        @idUsuario INT,
        @fechaVenta DATE,
        @totalVenta DECIMAL(10,2),
		@estadoVenta CHAR(1)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO VENTA
                    (IDUSU, FECVEN, TOTVEN, ESTVEN)
                VALUES
                    (UPPER(@idUsuario), @fechaVenta, @totalVenta, @estadoVenta) 
                IF @idUsuario = '3' OR @idUsuario = '4' OR @idUsuario = '7' OR @idUsuario = '8' OR @idUsuario = '10'
                    COMMIT TRAN
                ELSE
                    ROLLBACK TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'No se ha registrado la venta' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END 
GO


-- Procedimiento almacenado para insertar el DETALLE de venta
CREATE PROCEDURE spInsertVentaDetalle
    (
        @cantidadEquipo INT,
		--@subtotalDetalle DECIMAL(10,2),
        @idEquipo INT,
		--@idVenta INT,
		@estadoDetalle CHAR(1)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
            BEGIN TRAN
            DECLARE @idVenta INT
			DECLARE @subtotalDetalle DECIMAL(10,2)
            DECLARE @stockEquipo INT
            DECLARE @precioEquipo DECIMAL(10,2)
            DECLARE @totalVenta DECIMAL(10,2)
            DECLARE @stockActual INT
            SET @idVenta = (SELECT MAX(V.IDVEN) FROM VENTA AS V)
			SET @subtotalDetalle = (SELECT SUM(E.PREEQUI * @cantidadEquipo) FROM EQUIPO AS E)
            SET @stockEquipo = (SELECT EQUIPO.STOEQUI FROM EQUIPO WHERE EQUIPO.IDEQUI=@idEquipo)
            SET @precioEquipo = (SELECT EQUIPO.PREEQUI FROM EQUIPO WHERE EQUIPO.IDEQUI=@idEquipo)
            SET @totalVenta = @cantidadEquipo * @precioEquipo
            SET @stockActual = @stockEquipo - @cantidadEquipo
			SET @estadoDetalle = 'A'
                INSERT INTO VENTA_DETALLE
                (CANVENDET, SUBVENDET, IDEQUI, IDVEN, ESTVENDET)
                VALUES
                (@cantidadEquipo, @subtotalDetalle, @idEquipo, @idVenta, @estadoDetalle)
                IF (@stockEquipo >= @cantidadEquipo)
                    UPDATE EQUIPO
                    SET EQUIPO.STOEQUI = (EQUIPO.STOEQUI - @cantidadEquipo)
                    WHERE EQUIPO.IDEQUI = @idEquipo
                    ROLLBACK TRAN
                COMMIT TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'No se ha registrado el DETALLE de venta' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END 
GO
