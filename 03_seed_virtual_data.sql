-- =====================================================================
-- ALQUICOCHES Y CARRIVENTAS - DATOS DE EJEMPLO (MySQL 8.0)
-- =====================================================================

USE bd_alquicoches_carriventas;

-- ---------------------------------------------------------------------
-- 1. SUCURSALES
-- ---------------------------------------------------------------------
INSERT INTO sucursal (id_sucursal, nombre, ciudad, direccion, telefono) VALUES
(1, 'Sede Aeropuerto Palonegro', 'Bucaramanga', 'Km 11 Via Giron, Aeropuerto Palonegro', '+57 607 6810001'),
(2, 'Sede Bogota Centro', 'Bogota', 'Carrera 7 # 32-16', '+57 601 3450002'),
(3, 'Sede Medellin El Poblado', 'Medellin', 'Calle 10 # 36-45', '+57 604 4440003'),
(4, 'Sede Cali Granada', 'Cali', 'Avenida 9N # 15-20', '+57 602 6660004'),
(5, 'Sede Cartagena Bocagrande', 'Cartagena', 'Avenida San Martin # 8-30', '+57 605 6550005');

-- ---------------------------------------------------------------------
-- 2. PERSONAS
-- ---------------------------------------------------------------------
INSERT INTO persona (id_persona, primer_nombre, segundo_nombre, apellidos, email, fecha_creacion) VALUES
(1, 'Carlos', 'Andres', 'Ramirez Gomez', 'carlos.ramirez@correo.com', '2025-03-12 09:15:00'),
(2, 'Maria', 'Fernanda', 'Lopez Torres', 'maria.lopez@correo.com', '2025-04-02 10:30:00'),
(3, 'Juan', 'Sebastian', 'Perez Rojas', 'juan.perez@correo.com', '2025-05-18 14:00:00'),
(4, 'Laura', 'Valentina', 'Castro Diaz', 'laura.castro@correo.com', '2025-06-07 11:45:00'),
(5, 'Andres', 'Felipe', 'Mejia Ortiz', 'andres.mejia@correo.com', '2025-07-21 16:20:00'),
(6, 'Sofia', NULL, 'Herrera Vargas', 'sofia.herrera@correo.com', '2025-08-09 09:00:00'),
(7, 'Daniela', 'Alejandra', 'Moreno Silva', 'daniela.moreno@correo.com', '2025-09-14 13:10:00'),
(8, 'Luis', 'Eduardo', 'Martinez Cardenas', 'luis.martinez@constructoraandes.com', '2025-10-03 08:30:00'),
(9, 'Camila', 'Andrea', 'Suarez Pena', 'camila.suarez@correo.com', '2025-11-11 17:05:00'),
(10, 'Miguel', 'Angel', 'Ruiz Salazar', 'miguel.ruiz@correo.com', '2025-12-01 10:10:00'),
(11, 'Ana', 'Maria', 'Jimenez Bravo', 'ana.jimenez@correo.com', '2026-01-15 12:00:00'),
(12, 'Jorge', 'Ivan', 'Duarte Nunez', 'jorge.duarte@correo.com', '2026-02-20 15:40:00'),
(13, 'John', 'Michael', 'Smith Anderson', 'john.smith@usmail.com', '2026-08-20 19:25:00'),
(14, 'Patricia', 'Elena', 'Villamizar Cruz', 'patricia.villamizar@alquicoches.com', '2019-02-01 08:00:00'),
(15, 'Ricardo', 'Alonso', 'Quintero Ardila', 'ricardo.quintero@alquicoches.com', '2020-06-15 08:00:00'),
(16, 'Natalia', 'Carolina', 'Gomez Rincon', 'natalia.gomez@alquicoches.com', '2021-01-10 08:00:00'),
(17, 'Sebastian', NULL, 'Arango Zapata', 'sebastian.arango@alquicoches.com', '2021-03-22 08:00:00'),
(18, 'Hector', 'Fabio', 'Mendoza Ruiz', 'hector.mendoza@alquicoches.com', '2020-09-01 08:00:00'),
(19, 'Valeria', 'Ximena', 'Ospina Cuesta', 'valeria.ospina@alquicoches.com', '2022-02-14 08:00:00'),
(20, 'Oscar', 'Dario', 'Pinzon Barrera', 'oscar.pinzon@alquicoches.com', '2019-07-08 08:00:00'),
(21, 'Wilson', 'Javier', 'Cardenas Lozano', 'wilson.cardenas@alquicoches.com', '2020-11-23 08:00:00'),
(22, 'Jhon', 'Edison', 'Restrepo Molina', 'jhon.restrepo@alquicoches.com', '2022-05-30 08:00:00'),
(23, 'Fabian', 'Camilo', 'Rodriguez Pena', 'fabian.rodriguez@alquicoches.com', '2021-08-16 08:00:00'),
(24, 'Edwin', 'Alexander', 'Caceres Mora', 'edwin.caceres@alquicoches.com', '2020-04-27 08:00:00'),
(25, 'Rosa', 'Elena', 'Padilla Marrugo', 'rosa.padilla@alquicoches.com', '2023-01-09 08:00:00'),
(26, 'Diana', 'Marcela', 'Acevedo Pardo', 'diana.acevedo@alquicoches.com', '2022-10-17 08:00:00'),
(27, 'Camilo', 'Andres', 'Bernal Soto', 'camilo.bernal@alquicoches.com', '2023-03-06 08:00:00'),
(28, 'Gustavo', 'Adolfo', 'Herrera Leal', 'gustavo.herrera@alquicoches.com', '2021-12-01 08:00:00'),
(29, 'Mario', NULL, 'Ibarra Salcedo', 'mario.ibarra@alquicoches.com', '2020-02-18 08:00:00'),
(30, 'Alberto', 'Jose', 'Mora Quintana', 'alberto.mora@alquicoches.com', '2022-08-22 08:00:00');

-- ---------------------------------------------------------------------
-- 3. TELEFONOS
-- ---------------------------------------------------------------------
INSERT INTO telefono_persona (id_telefono, id_persona, numero, tipo, es_principal) VALUES
(1, 1, '+57 3001112233', 'MOVIL', 1), (2, 1, '+57 607 6451122', 'FIJO', 0), (3, 1, '+57 3109998877', 'EMERGENCIA', 0),
(4, 2, '+57 3012223344', 'MOVIL', 1), (5, 3, '+57 3023334455', 'MOVIL', 1), (6, 3, '+57 601 2345678', 'TRABAJO', 0),
(7, 4, '+57 3034445566', 'MOVIL', 1), (8, 5, '+57 3045556677', 'MOVIL', 1), (9, 5, '+57 3205554433', 'EMERGENCIA', 0),
(10, 6, '+57 3056667788', 'MOVIL', 1), (11, 7, '+57 3067778899', 'MOVIL', 1), (12, 7, '+57 604 3216549', 'FIJO', 0),
(13, 8, '+57 3078889900', 'MOVIL', 1), (14, 8, '+57 607 6300100', 'TRABAJO', 0), (15, 9, '+57 3089990011', 'MOVIL', 1),
(16, 10, '+57 3090001122', 'MOVIL', 1), (17, 11, '+57 3101112200', 'MOVIL', 1), (18, 12, '+57 3112223311', 'MOVIL', 1),
(19, 13, '+1 3055550199', 'MOVIL', 1), (20, 13, '+57 3128889900', 'TRABAJO', 0), (21, 14, '+57 3134445500', 'MOVIL', 1),
(22, 15, '+57 3145556600', 'MOVIL', 1), (23, 15, '+57 607 6810010', 'TRABAJO', 0), (24, 16, '+57 3156667700', 'MOVIL', 1),
(25, 17, '+57 3167778800', 'MOVIL', 1), (26, 18, '+57 3178889900', 'MOVIL', 1), (27, 19, '+57 3189990000', 'MOVIL', 1),
(28, 20, '+57 3190001111', 'MOVIL', 1), (29, 23, '+57 3201112222', 'MOVIL', 1), (30, 24, '+57 3212223333', 'MOVIL', 1),
(31, 25, '+57 3223334444', 'MOVIL', 1), (32, 26, '+57 3234445555', 'MOVIL', 1), (33, 27, '+57 3245556666', 'MOVIL', 1),
(34, 28, '+57 3256667777', 'MOVIL', 1);

-- ---------------------------------------------------------------------
-- 4. DOCUMENTOS
-- ---------------------------------------------------------------------
INSERT INTO documento_persona (id_documento, id_persona, tipo_documento, categoria_licencia, numero_documento, pais_emision, fecha_emision, fecha_vencimiento, activo) VALUES
(1, 1, 'CEDULA', NULL, '1098100001', 'Colombia', '2008-05-14', NULL, 1),
(2, 2, 'CEDULA', NULL, '1098100002', 'Colombia', '2009-03-20', NULL, 1),
(3, 3, 'CEDULA', NULL, '1098100003', 'Colombia', '2010-07-01', NULL, 1),
(4, 4, 'CEDULA', NULL, '1098100004', 'Colombia', '2011-09-12', NULL, 1),
(5, 5, 'CEDULA', NULL, '1098100005', 'Colombia', '2007-11-30', NULL, 1),
(6, 6, 'CEDULA', NULL, '1098100006', 'Colombia', '2012-02-05', NULL, 1),
(7, 7, 'CEDULA', NULL, '1098100007', 'Colombia', '2013-06-18', NULL, 1),
(8, 8, 'CEDULA', NULL, '1098100008', 'Colombia', '2005-08-22', NULL, 1),
(9, 9, 'CEDULA', NULL, '1098100009', 'Colombia', '2014-01-27', NULL, 1),
(10, 10, 'CEDULA', NULL, '1098100010', 'Colombia', '2006-04-09', NULL, 1),
(11, 11, 'CEDULA', NULL, '1098100011', 'Colombia', '2015-10-15', NULL, 1),
(12, 12, 'CEDULA_EXTRANJERIA', NULL, '000345678', 'Colombia', '2022-08-01', '2032-08-01', 1),
(13, 13, 'PASAPORTE', NULL, 'X4455901', 'Estados Unidos', '2021-06-10', '2031-06-09', 1),
(14, 14, 'CEDULA', NULL, '1098100014', 'Colombia', '2004-03-03', NULL, 1),
(15, 15, 'CEDULA', NULL, '1098100015', 'Colombia', '2008-12-12', NULL, 1),
(16, 16, 'CEDULA', NULL, '1098100016', 'Colombia', '2010-05-25', NULL, 1),
(17, 17, 'CEDULA', NULL, '1098100017', 'Colombia', '2011-08-08', NULL, 1),
(18, 18, 'CEDULA', NULL, '1098100018', 'Colombia', '2003-01-19', NULL, 1),
(19, 19, 'CEDULA', NULL, '1098100019', 'Colombia', '2012-11-02', NULL, 1),
(20, 20, 'CEDULA', NULL, '1098100020', 'Colombia', '2002-06-30', NULL, 1),
(21, 21, 'CEDULA', NULL, '1098100021', 'Colombia', '2004-09-17', NULL, 1),
(22, 22, 'CEDULA', NULL, '1098100022', 'Colombia', '2009-02-28', NULL, 1),
(23, 23, 'CEDULA', NULL, '1098100023', 'Colombia', '2005-10-10', NULL, 1),
(24, 24, 'CEDULA', NULL, '1098100024', 'Colombia', '2001-07-07', NULL, 1),
(25, 25, 'CEDULA', NULL, '1098100025', 'Colombia', '2013-04-14', NULL, 1),
(26, 26, 'CEDULA', NULL, '1098100026', 'Colombia', '2014-12-21', NULL, 1),
(27, 27, 'CEDULA', NULL, '1098100027', 'Colombia', '2015-03-09', NULL, 1),
(28, 28, 'CEDULA', NULL, '1098100028', 'Colombia', '2000-05-05', NULL, 1),
(29, 29, 'CEDULA', NULL, '1098100029', 'Colombia', '2003-08-13', NULL, 1),
(30, 30, 'CEDULA', NULL, '1098100030', 'Colombia', '2006-11-26', NULL, 1),
(31, 1, 'LICENCIA_CONDUCCION', 'B1', 'LC-68001-000031', 'Colombia', '2018-04-10', '2028-04-10', 1),
(32, 2, 'LICENCIA_CONDUCCION', 'B1', 'LC-68001-000032', 'Colombia', '2019-06-15', '2029-06-15', 1),
(33, 3, 'LICENCIA_CONDUCCION', 'B1', 'LC-68001-000033', 'Colombia', '2020-01-20', '2030-01-20', 1),
(34, 4, 'LICENCIA_CONDUCCION', 'B1', 'LC-11001-000034', 'Colombia', '2017-09-05', '2027-09-05', 1),
(35, 5, 'LICENCIA_CONDUCCION', 'C1', 'LC-68001-000035', 'Colombia', '2016-11-11', '2026-12-31', 1),
(36, 6, 'LICENCIA_CONDUCCION', 'B1', 'LC-05001-000036', 'Colombia', '2021-02-02', '2031-02-02', 1),
(37, 7, 'LICENCIA_CONDUCCION', 'B1', 'LC-11001-000037', 'Colombia', '2022-07-19', '2032-07-19', 1),
(38, 8, 'LICENCIA_CONDUCCION', 'C1', 'LC-68001-000038', 'Colombia', '2019-03-30', '2029-03-30', 1),
(39, 9, 'LICENCIA_CONDUCCION', 'B1', 'LC-76001-000039', 'Colombia', '2020-10-10', '2030-10-10', 1),
(40, 10, 'LICENCIA_CONDUCCION', 'B1', 'LC-68001-000040', 'Colombia', '2015-02-10', '2025-02-10', 0),
(41, 11, 'LICENCIA_CONDUCCION', 'B1', 'LC-76001-000041', 'Colombia', '2021-08-08', '2031-08-08', 1),
(42, 12, 'LICENCIA_CONDUCCION', 'B1', 'LC-13001-000042', 'Colombia', '2022-09-09', '2032-09-09', 1),
(43, 13, 'LICENCIA_CONDUCCION', 'CLASS-C', 'FL-D4455-9012', 'Estados Unidos', '2020-05-01', '2028-05-01', 1),
(44, 15, 'LICENCIA_CONDUCCION', 'B1', 'LC-68001-000044', 'Colombia', '2017-12-12', '2027-12-12', 1),
(45, 23, 'LICENCIA_CONDUCCION', 'C2', 'LC-11001-000045', 'Colombia', '2018-01-15', '2028-01-15', 1),
(46, 24, 'LICENCIA_CONDUCCION', 'C1', 'LC-68001-000046', 'Colombia', '2019-02-25', '2029-02-25', 1),
(47, 25, 'LICENCIA_CONDUCCION', 'C2', 'LC-13001-000047', 'Colombia', '2020-03-03', '2030-03-03', 1),
(48, 28, 'LICENCIA_CONDUCCION', 'C1', 'LC-05001-000048', 'Colombia', '2017-06-06', '2027-06-06', 1),
(49, 30, 'LICENCIA_CONDUCCION', 'C1', 'LC-76001-000049', 'Colombia', '2018-10-20', '2028-10-20', 1);

-- ---------------------------------------------------------------------
-- 5. CLIENTES
-- ---------------------------------------------------------------------
INSERT INTO cliente (id_persona, fecha_registro, nivel_fidelidad) VALUES
(1, '2025-03-12', 'ORO'), (2, '2025-04-02', 'PLATA'), (3, '2025-05-18', 'ESTANDAR'), (4, '2025-06-07', 'PLATA'),
(5, '2025-07-21', 'ORO'), (6, '2025-08-09', 'ESTANDAR'), (7, '2025-09-14', 'PLATINO'), (8, '2025-10-03', 'CORPORATIVO'),
(9, '2025-11-11', 'ESTANDAR'), (10, '2025-12-01', 'ESTANDAR'), (11, '2026-01-15', 'ESTANDAR'), (12, '2026-02-20', 'PLATA'),
(13, '2026-08-20', 'ESTANDAR'), (15, '2026-10-30', 'ESTANDAR');

-- ---------------------------------------------------------------------
-- 6. CARGOS
-- ---------------------------------------------------------------------
INSERT INTO cargo (id_cargo, nombre, area_operativa, responsabilidades, salario_base, porcentaje_comision) VALUES
(1, 'Administrador de Sucursal', 'ADMINISTRACION', 'Dirige la sucursal, aprueba descuentos y supervisa al personal.', 6500000.00, 0.00),
(2, 'Asesor de Mostrador', 'MOSTRADOR_ALQUILER', 'Atiende clientes, crea contratos de alquiler, revisa documentos y registra pagos.', 2200000.00, 2.50),
(3, 'Ejecutivo de Ventas', 'VENTAS', 'Comercializa vehiculos nuevos y usados, gestiona traspasos y financiacion.', 2800000.00, 4.50),
(4, 'Inspector de Patio', 'MOSTRADOR_ALQUILER', 'Recibe vehiculos devueltos, verifica odometro y reporta danos o multas.', 1900000.00, 0.50),
(5, 'Tecnico de Taller', 'MANTENIMIENTO_TALLER', 'Realiza mantenimientos, reparaciones y alistamiento de vehiculos.', 2400000.00, 0.00),
(6, 'Chofer Profesional', 'CONDUCCION_LOGISTICA', 'Conduce para clientes y traslada vehiculos entre sucursales.', 2100000.00, 1.50),
(7, 'Agente de Atencion al Cliente', 'ATENCION_CLIENTE', 'Gestiona tickets de asistencia en ruta, quejas, facturacion y garantias.', 1800000.00, 0.00);

-- ---------------------------------------------------------------------
-- 7. EMPLEADOS
-- ---------------------------------------------------------------------
INSERT INTO empleado (id_persona, id_cargo, id_sucursal, fecha_contratacion, estado_laboral) VALUES
(14, 1, 1, '2019-02-01', 'ACTIVO'), (15, 2, 1, '2020-06-15', 'ACTIVO'), (16, 3, 2, '2021-01-10', 'ACTIVO'),
(17, 3, 3, '2021-03-22', 'ACTIVO'), (18, 4, 1, '2020-09-01', 'ACTIVO'), (19, 4, 4, '2022-02-14', 'ACTIVO'),
(20, 5, 1, '2019-07-08', 'ACTIVO'), (21, 5, 2, '2020-11-23', 'ACTIVO'), (22, 5, 3, '2022-05-30', 'INCAPACIDAD'),
(23, 6, 2, '2021-08-16', 'ACTIVO'), (24, 6, 1, '2020-04-27', 'ACTIVO'), (25, 6, 5, '2023-01-09', 'ACTIVO'),
(26, 7, 1, '2022-10-17', 'ACTIVO'), (27, 7, 2, '2023-03-06', 'ACTIVO'), (28, 6, 3, '2021-12-01', 'VACACIONES'),
(29, 2, 4, '2020-02-18', 'RETIRADO'), (30, 6, 4, '2022-08-22', 'SUSPENDIDO');

-- ---------------------------------------------------------------------
-- 8. TURNOS
-- ---------------------------------------------------------------------
INSERT INTO turno_empleado (id_turno, id_empleado, id_sucursal, inicio_turno, fin_turno) VALUES
(1, 15, 1, '2026-11-09 07:00:00', '2026-11-09 15:00:00'), (2, 15, 1, '2026-11-10 07:00:00', '2026-11-10 15:00:00'),
(3, 18, 1, '2026-11-10 22:00:00', '2026-11-11 06:00:00'), (4, 26, 1, '2026-11-11 08:00:00', '2026-11-11 17:00:00'),
(5, 16, 2, '2026-11-11 08:00:00', '2026-11-11 17:00:00'), (6, 27, 2, '2026-11-11 13:00:00', '2026-11-11 21:00:00'),
(7, 21, 2, '2026-11-11 07:00:00', '2026-11-11 16:00:00'), (8, 23, 3, '2026-11-11 06:00:00', '2026-11-11 18:00:00'),
(9, 17, 3, '2026-11-12 09:00:00', '2026-11-12 18:00:00'), (10, 20, 1, '2026-11-12 07:00:00', '2026-11-12 16:00:00'),
(11, 19, 4, '2026-11-12 08:00:00', '2026-11-12 16:00:00'), (12, 25, 5, '2026-11-12 09:00:00', '2026-11-12 17:00:00'),
(13, 14, 1, '2026-11-12 08:00:00', '2026-11-12 17:00:00');

-- ---------------------------------------------------------------------
-- 9. PERFIL DE CHOFER
-- ---------------------------------------------------------------------
INSERT INTO perfil_chofer (id_empleado, id_doc_licencia, tarifa_diaria_servicio, estado_disponibilidad, calificacion_promedio) VALUES
(23, 45, 120000.00, 'EN_RUTA', 4.80), (24, 46, 110000.00, 'DISPONIBLE', 4.50),
(25, 47, 130000.00, 'DISPONIBLE', 4.95), (28, 48, 100000.00, 'DESCANSO', 4.20), (30, 49, 100000.00, 'INACTIVO', 3.60);

-- ---------------------------------------------------------------------
-- 10. CATEGORIAS DE VEHICULO
-- ---------------------------------------------------------------------
INSERT INTO categoria_vehiculo (id_categoria, nombre, tarifa_diaria, deposito_garantia) VALUES
(1, 'Economico', 120000.00, 500000.00), (2, 'Sedan', 180000.00, 800000.00), (3, 'SUV', 280000.00, 1500000.00),
(4, 'Camioneta 4x4', 380000.00, 2000000.00), (5, 'Premium', 550000.00, 3000000.00);

-- ---------------------------------------------------------------------
-- 11. TARIFAS DE TEMPORADA
-- ---------------------------------------------------------------------
INSERT INTO tarifa_temporada (id_tarifa_temp, id_categoria, nombre_temporada, fecha_inicio, fecha_fin, tarifa_diaria_especial) VALUES
(1, 1, 'Semana Santa 2026', '2026-03-29', '2026-04-05', 150000.00), (2, 2, 'Semana Santa 2026', '2026-03-29', '2026-04-05', 230000.00),
(3, 3, 'Semana Santa 2026', '2026-03-29', '2026-04-05', 350000.00), (4, 2, 'Vacaciones Mitad de Anio 2026', '2026-06-15', '2026-07-19', 220000.00),
(5, 3, 'Vacaciones Mitad de Anio 2026', '2026-06-15', '2026-07-19', 320000.00), (6, 4, 'Vacaciones Mitad de Anio 2026', '2026-06-15', '2026-07-19', 440000.00),
(7, 3, 'Puente Festivo Octubre 2026', '2026-10-10', '2026-10-12', 310000.00), (8, 1, 'Fin de Anio 2026', '2026-12-15', '2027-01-10', 190000.00),
(9, 2, 'Fin de Anio 2026', '2026-12-15', '2027-01-10', 280000.00), (10, 3, 'Fin de Anio 2026', '2026-12-15', '2027-01-10', 400000.00),
(11, 4, 'Fin de Anio 2026', '2026-12-15', '2027-01-10', 560000.00), (12, 5, 'Fin de Anio 2026', '2026-12-15', '2027-01-10', 780000.00),
(13, 1, 'Festivo Noviembre 2026', '2026-11-16', '2026-11-16', 150000.00);

-- ---------------------------------------------------------------------
-- 12. VEHICULOS
-- ---------------------------------------------------------------------
INSERT INTO vehiculo (vin, placa, marca, modelo, anio, kilometraje_actual, modalidad_flota, precio_lista_venta, estado_operativo, id_categoria, id_sucursal_actual) VALUES
('RNLT2023ABU000001', 'FXA101', 'Renault', 'Kwid', 2023, 14200, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 1, 1),
('CHVR2022ABU000002', 'FXB202', 'Chevrolet', 'Spark GT', 2022, 22100, 'MIXTO', 32000000.00, 'DISPONIBLE', 1, 1),
('MAZD2023ABU000003', 'GHT303', 'Mazda', 'Mazda 2 Sedan', 2023, 18500, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 2, 2),
('TYTA2022ABU000004', 'GJK404', 'Toyota', 'Corolla', 2022, 41300, 'MIXTO', 58000000.00, 'DISPONIBLE', 2, 2),
('KMHK2021ABU000005', 'HLM505', 'Kia', 'Cerato', 2021, 52300, 'MIXTO', 54000000.00, 'DISPONIBLE', 2, 3),
('TYTA2024ABU000006', 'HNP606', 'Toyota', 'Corolla Cross', 2024, 8100, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 3, 1),
('MAZD2023ABU000007', 'JKR707', 'Mazda', 'CX-30', 2023, 9400, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 3, 2),
('RNLT2022ABU000008', 'JLS808', 'Renault', 'Duster', 2022, 27000, 'MIXTO', 61000000.00, 'DISPONIBLE', 3, 4),
('TYTA2023ABU000009', 'KMT909', 'Toyota', 'Hilux', 2023, 31000, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 4, 3),
('CHVR2021ABU000010', 'KNV010', 'Chevrolet', 'D-Max', 2021, 64000, 'SOLO_VENTA', 96000000.00, 'DISPONIBLE', 4, 5),
('BMWZ2024ABU000011', 'LPW111', 'BMW', '320i', 2024, 5200, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 5, 2),
('NSSN2022ABU000012', 'LRX212', 'Nissan', 'Versa', 2022, 33800, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 2, 5),
('SZKU2022ABU000013', 'MBY313', 'Suzuki', 'Swift', 2022, 40100, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 1, 4),
('HYUN2023ABU000014', 'MCZ414', 'Hyundai', 'Tucson', 2023, 12000, 'MIXTO', 95000000.00, 'DISPONIBLE', 3, 5),
('MAZD2020ABU000015', 'NDA515', 'Mazda', 'Mazda 3', 2020, 78500, 'SOLO_VENTA', 52000000.00, 'DISPONIBLE', 2, 1),
('KMHK2022ABU000016', 'NEB616', 'Kia', 'Sportage', 2022, 45600, 'MIXTO', 72000000.00, 'DISPONIBLE', 3, 1),
('CHVR2024ABU000017', 'NFC717', 'Chevrolet', 'Tracker', 2024, 15400, 'SOLO_ALQUILER', NULL, 'DISPONIBLE', 3, 3),
('VWGN2023ABU000018', 'NGD818', 'Volkswagen', 'T-Cross', 2023, 20800, 'MIXTO', 88000000.00, 'DISPONIBLE', 3, 2);

-- ---------------------------------------------------------------------
-- 13. ASEGURADORAS
-- ---------------------------------------------------------------------
INSERT INTO aseguradora (id_aseguradora, nit, nombre, telefono_asistencia, email_contacto) VALUES
(1, '900100200-1', 'Seguros Andina S.A.', '018000111001', 'reclamos@segurosandina.example'),
(2, '900200300-2', 'Aseguradora Cordillera', '018000111002', 'siniestros@cordillera.example'),
(3, '900300400-3', 'Proteccion Vial S.A.', '018000111003', NULL),
(4, '900400500-4', 'Seguros del Caribe Sur', '018000111004', 'atencion@caribesur.example');

-- ---------------------------------------------------------------------
-- 14. POLIZAS
-- ---------------------------------------------------------------------
INSERT INTO poliza_vehiculo (id_poliza, vin_vehiculo, id_aseguradora, numero_poliza, tipo_poliza, fecha_inicio, fecha_vencimiento, costo_prima, deducible_pactado, activa) VALUES
(1, 'RNLT2023ABU000001', 1, 'SOAT-26-0001', 'SOAT', '2026-02-01', '2027-01-31', 520000.00, 0.00, 1),
(2, 'CHVR2022ABU000002', 2, 'SOAT-26-0002', 'SOAT', '2026-01-01', '2026-12-31', 540000.00, 0.00, 1),
(3, 'MAZD2023ABU000003', 3, 'SOAT-26-0003', 'SOAT', '2026-01-01', '2026-12-31', 610000.00, 0.00, 1),
(4, 'TYTA2022ABU000004', 4, 'SOAT-26-0004', 'SOAT', '2026-01-01', '2026-12-31', 610000.00, 0.00, 1),
(5, 'KMHK2021ABU000005', 1, 'SOAT-26-0005', 'SOAT', '2026-01-01', '2026-12-31', 600000.00, 0.00, 1),
(6, 'TYTA2024ABU000006', 2, 'SOAT-26-0006', 'SOAT', '2026-01-10', '2027-01-09', 780000.00, 0.00, 1),
(7, 'MAZD2023ABU000007', 3, 'SOAT-26-0007', 'SOAT', '2026-01-01', '2026-12-31', 760000.00, 0.00, 1),
(8, 'RNLT2022ABU000008', 4, 'SOAT-26-0008', 'SOAT', '2026-01-01', '2026-12-31', 740000.00, 0.00, 1),
(9, 'TYTA2023ABU000009', 1, 'SOAT-26-0009', 'SOAT', '2026-02-01', '2027-01-31', 900000.00, 0.00, 1),
(10, 'CHVR2021ABU000010', 2, 'SOAT-26-0010', 'SOAT', '2026-01-01', '2026-12-31', 880000.00, 0.00, 1),
(11, 'BMWZ2024ABU000011', 3, 'SOAT-26-0011', 'SOAT', '2026-02-15', '2027-02-14', 950000.00, 0.00, 1),
(12, 'NSSN2022ABU000012', 4, 'SOAT-26-0012', 'SOAT', '2026-03-01', '2027-02-28', 590000.00, 0.00, 1),
(13, 'SZKU2022ABU000013', 1, 'SOAT-26-0013', 'SOAT', '2026-01-01', '2026-12-31', 500000.00, 0.00, 1),
(14, 'HYUN2023ABU000014', 2, 'SOAT-26-0014', 'SOAT', '2026-05-01', '2027-04-30', 770000.00, 0.00, 1),
(15, 'MAZD2020ABU000015', 3, 'SOAT-26-0015', 'SOAT', '2026-01-01', '2026-12-31', 580000.00, 0.00, 1),
(16, 'KMHK2022ABU000016', 4, 'SOAT-24-0016', 'SOAT', '2024-11-20', '2025-11-19', 720000.00, 0.00, 0),
(17, 'CHVR2024ABU000017', 1, 'SOAT-26-0017', 'SOAT', '2026-01-05', '2027-01-04', 730000.00, 0.00, 1),
(18, 'VWGN2023ABU000018', 2, 'SOAT-26-0018', 'SOAT', '2026-01-01', '2026-12-31', 750000.00, 0.00, 1),
(19, 'RNLT2023ABU000001', 1, 'SOAT-25-0001', 'SOAT', '2025-02-01', '2026-01-31', 500000.00, 0.00, 0),
(20, 'SZKU2022ABU000013', 1, 'SOAT-25-0013', 'SOAT', '2025-01-01', '2025-12-31', 480000.00, 0.00, 0),
(21, 'TYTA2024ABU000006', 2, 'TR-26-0006', 'TODO_RIESGO', '2026-01-10', '2027-01-09', 4200000.00, 1500000.00, 1),
(22, 'MAZD2023ABU000007', 3, 'TR-26-0007', 'TODO_RIESGO', '2026-01-01', '2026-12-31', 3900000.00, 1500000.00, 1),
(23, 'BMWZ2024ABU000011', 3, 'TR-26-0011', 'TODO_RIESGO', '2026-02-15', '2027-02-14', 9800000.00, 3000000.00, 1),
(24, 'NSSN2022ABU000012', 4, 'TR-26-0012', 'TODO_RIESGO', '2026-03-01', '2027-02-28', 3100000.00, 1200000.00, 1),
(25, 'TYTA2023ABU000009', 1, 'TR-26-0009', 'TODO_RIESGO', '2026-02-01', '2027-01-31', 6500000.00, 2000000.00, 1),
(26, 'MAZD2023ABU000003', 3, 'TR-26-0003', 'TODO_RIESGO', '2026-01-01', '2026-12-31', 3300000.00, 1000000.00, 1),
(27, 'CHVR2024ABU000017', 1, 'TR-26-0017', 'TODO_RIESGO', '2026-01-05', '2027-01-04', 4000000.00, 1500000.00, 1),
(28, 'HYUN2023ABU000014', 2, 'TR-26-0014', 'TODO_RIESGO', '2026-05-01', '2027-04-30', 4600000.00, 1800000.00, 1),
(29, 'TYTA2024ABU000006', 2, 'RC-26-0006', 'RESPONSABILIDAD_CIVIL', '2026-01-10', '2027-01-09', 900000.00, 0.00, 1),
(30, 'BMWZ2024ABU000011', 3, 'RC-26-0011', 'RESPONSABILIDAD_CIVIL', '2026-02-15', '2027-02-14', 1200000.00, 0.00, 1),
(31, 'NSSN2022ABU000012', 4, 'RC-26-0012', 'RESPONSABILIDAD_CIVIL', '2026-03-01', '2027-02-28', 850000.00, 0.00, 1);

-- ---------------------------------------------------------------------
-- 15. ORDENES DE MANTENIMIENTO
-- ---------------------------------------------------------------------
INSERT INTO orden_mantenimiento (id_mantenimiento, vin_vehiculo, id_empleado_tecnico, id_sucursal_taller, fecha_ingreso, fecha_salida, km_ingreso, tipo_mantenimiento, costo_mano_obra, costo_repuestos, descripcion, estado_orden) VALUES
(1, 'RNLT2023ABU000001', 20, 1, '2026-06-01 08:00:00', '2026-06-01 16:00:00', 13100, 'PREVENTIVO', 120000.00, 180000.00, 'Cambio de aceite, filtros y revision de frenos.', 'COMPLETADO'),
(2, 'TYTA2022ABU000004', 21, 2, '2026-09-15 09:00:00', '2026-09-18 17:00:00', 40900, 'ALISTAMIENTO_VENTA', 450000.00, 1250000.00, 'Alistamiento para venta: pulida, cambio de pastillas y revision general.', 'COMPLETADO'),
(3, 'MAZD2020ABU000015', 20, 1, '2026-10-10 08:00:00', '2026-10-14 15:00:00', 77900, 'ALISTAMIENTO_VENTA', 380000.00, 900000.00, 'Alistamiento para venta: lavado de motor, llantas y tapiceria.', 'COMPLETADO'),
(4, 'TYTA2024ABU000006', 20, 1, '2026-09-26 08:30:00', NULL, 9020, 'REPARACION_SINIESTRO', 1400000.00, 6400000.00, 'Reparacion de frontal por colision (parachoques, farola y capo).', 'EN_PROCESO'),
(5, 'TYTA2023ABU000009', 22, 3, '2026-10-20 08:00:00', NULL, 32850, 'CORRECTIVO', 600000.00, 2100000.00, 'Falla en caja de cambios reportada al devolver el vehiculo.', 'EN_PROCESO'),
(6, 'KMHK2022ABU000016', 20, 1, '2026-11-18 08:00:00', NULL, 45600, 'PREVENTIVO', 0.00, 0.00, 'Revision tecnico-mecanica y renovacion de SOAT (programada).', 'PROGRAMADO'),
(7, 'KMHK2021ABU000005', 22, 3, '2026-05-12 09:00:00', '2026-05-13 12:00:00', 51800, 'CORRECTIVO', 250000.00, 780000.00, 'Cambio de kit de embrague.', 'COMPLETADO'),
(8, 'VWGN2023ABU000018', 21, 2, '2026-08-03 08:00:00', NULL, 19500, 'PREVENTIVO', 0.00, 0.00, 'Mantenimiento de 20.000 km (cancelado).', 'CANCELADO'),
(9, 'MAZD2023ABU000003', 21, 2, '2026-07-09 08:00:00', '2026-07-09 12:00:00', 19700, 'PREVENTIVO', 90000.00, 110000.00, 'Revision posterior al traslado desde Medellin.', 'COMPLETADO');

-- ---------------------------------------------------------------------
-- 16. RESERVAS
-- ---------------------------------------------------------------------
INSERT INTO reserva (id_reserva, fecha_inicio, fecha_fin, requiere_chofer, estado, id_cliente, id_categoria, id_suc_recogida, id_suc_entrega) VALUES
(1, '2026-08-03', '2026-08-07', 0, 'CONFIRMADA', 1, 1, 1, 1), (2, '2026-07-01', '2026-07-06', 1, 'CONFIRMADA', 4, 2, 2, 3),
(3, '2026-09-20', '2026-09-25', 0, 'CONFIRMADA', 5, 3, 1, 1), (4, '2026-10-05', '2026-10-19', 0, 'CONFIRMADA', 6, 4, 3, 3),
(5, '2026-10-24', '2026-10-27', 1, 'CONFIRMADA', 7, 5, 2, 2), (6, '2026-08-17', '2026-08-31', 0, 'CONFIRMADA', 8, 3, 3, 3),
(7, '2026-05-02', '2026-05-05', 0, 'CANCELADA', 10, 1, 4, 4), (8, '2026-06-20', '2026-06-23', 0, 'CONFIRMADA', 11, 3, 4, 4),
(9, '2026-10-20', '2026-10-23', 0, 'CONFIRMADA', 12, 3, 5, 5), (10, '2026-08-24', '2026-08-31', 0, 'CONFIRMADA', 13, 2, 5, 5),
(11, '2026-09-28', '2026-10-02', 0, 'CONFIRMADA', 1, 3, 2, 3), (12, '2026-12-20', '2026-12-27', 0, 'PENDIENTE', 2, 2, 1, 2),
(13, '2026-11-20', '2026-11-22', 0, 'CONFIRMADA', 3, 1, 1, 1), (14, '2026-09-01', '2026-09-03', 0, 'NO_SHOW', 9, 4, 3, 3),
(15, '2026-11-14', '2026-11-16', 1, 'PENDIENTE', 6, 2, 3, 3);

-- ---------------------------------------------------------------------
-- 17. OPERACIONES
-- ---------------------------------------------------------------------
INSERT INTO operacion (id_operacion, fecha_creacion, tipo_operacion, valor_total, estado_operacion, id_cliente, id_empleado_gestor, vin_vehiculo) VALUES
(1, '2026-08-03 08:20:00', 'ALQUILER', 540000.00, 'CERRADA', 1, 15, 'RNLT2023ABU000001'),
(2, '2026-11-09 09:50:00', 'ALQUILER', 1485000.00, 'ABIERTA', 2, 15, 'RNLT2023ABU000001'),
(3, '2026-09-12 15:50:00', 'ALQUILER', 240000.00, 'CERRADA', 3, 15, 'CHVR2022ABU000002'),
(4, '2026-07-01 06:50:00', 'ALQUILER', 2575000.00, 'CERRADA', 4, 16, 'MAZD2023ABU000003'),
(5, '2026-09-20 08:40:00', 'ALQUILER', 3915000.00, 'CERRADA', 5, 15, 'TYTA2024ABU000006'),
(6, '2026-10-05 07:40:00', 'ALQUILER', 6202000.00, 'CERRADA', 6, 17, 'TYTA2023ABU000009'),
(7, '2026-10-24 09:40:00', 'ALQUILER', 2145000.00, 'CERRADA', 7, 16, 'BMWZ2024ABU000011'),
(8, '2026-08-17 08:20:00', 'ALQUILER', 4480000.00, 'CERRADA', 8, 17, 'CHVR2024ABU000017'),
(9, '2026-03-10 08:40:00', 'ALQUILER', 240000.00, 'CERRADA', 9, 29, 'SZKU2022ABU000013'),
(10, '2026-04-20 09:50:00', 'ALQUILER', 0.00, 'ANULADA', 10, 29, 'SZKU2022ABU000013'),
(11, '2026-06-20 09:40:00', 'ALQUILER', 1474000.00, 'CERRADA', 11, 29, 'RNLT2022ABU000008'),
(12, '2026-10-20 09:40:00', 'ALQUILER', 1475000.00, 'EN_MORA', 12, 16, 'HYUN2023ABU000014'),
(13, '2026-08-24 10:35:00', 'ALQUILER', 1575000.00, 'CERRADA', 13, 16, 'NSSN2022ABU000012'),
(14, '2026-10-30 08:50:00', 'ALQUILER', 360000.00, 'CERRADA', 15, 14, 'CHVR2022ABU000002'),
(15, '2026-09-28 07:40:00', 'ALQUILER', 1481000.00, 'CERRADA', 1, 16, 'MAZD2023ABU000007'),
(16, '2026-10-12 10:00:00', 'VENTA', 56500000.00, 'CERRADA', 5, 16, 'TYTA2022ABU000004'),
(17, '2026-10-28 14:30:00', 'VENTA', 51000000.00, 'ABIERTA', 10, 15, 'MAZD2020ABU000015'),
(18, '2026-10-05 11:30:00', 'VENTA', 96000000.00, 'ANULADA', 4, 17, 'CHVR2021ABU000010');

-- ---------------------------------------------------------------------
-- 18. ALQUILERES
-- ---------------------------------------------------------------------
INSERT INTO alquiler (id_operacion, id_reserva, fecha_salida, fecha_devolucion_prevista, fecha_devolucion_real, km_salida, km_llegada, id_suc_salida, id_suc_llegada) VALUES
(1, 1, '2026-08-03 08:30:00', '2026-08-07 08:30:00', '2026-08-07 09:10:00', 14200, 14980, 1, 1),
(3, NULL, '2026-09-12 16:00:00', '2026-09-14 16:00:00', '2026-09-14 15:40:00', 22100, 22460, 1, 1),
(4, 2, '2026-07-01 07:00:00', '2026-07-06 07:00:00', '2026-07-06 06:50:00', 18500, 19250, 2, 3),
(5, 3, '2026-09-20 09:00:00', '2026-09-25 09:00:00', '2026-09-25 11:30:00', 8100, 9020, 1, 1),
(6, 4, '2026-10-05 08:00:00', '2026-10-19 08:00:00', '2026-10-19 07:45:00', 31000, 32850, 3, 3),
(7, 5, '2026-10-24 10:00:00', '2026-10-27 10:00:00', '2026-10-27 09:30:00', 5200, 5610, 2, 2),
(8, 6, '2026-08-17 08:30:00', '2026-08-31 08:30:00', '2026-08-31 08:20:00', 15400, 16800, 3, 3),
(9, NULL, '2026-03-10 09:00:00', '2026-03-12 09:00:00', '2026-03-12 08:45:00', 40100, 40420, 4, 4),
(10, NULL, '2026-04-20 10:00:00', '2026-04-22 10:00:00', NULL, 40420, NULL, 4, NULL),
(11, 8, '2026-06-20 10:00:00', '2026-06-23 10:00:00', '2026-06-23 10:00:00', 27000, 27420, 4, 4),
(12, 9, '2026-10-20 10:00:00', '2026-10-23 10:00:00', '2026-10-25 12:00:00', 12000, 12900, 5, 5),
(13, 10, '2026-08-24 11:00:00', '2026-08-31 11:00:00', NULL, 33800, NULL, 5, NULL),
(14, NULL, '2026-10-30 09:00:00', '2026-11-02 09:00:00', '2026-11-02 08:50:00', 22460, 22790, 1, 1),
(15, 11, '2026-09-28 08:00:00', '2026-10-02 08:00:00', '2026-10-02 07:45:00', 9400, 10250, 2, 3),
(2, NULL, '2026-11-09 10:00:00', '2026-11-18 10:00:00', NULL, 14980, NULL, 1, NULL);

-- ---------------------------------------------------------------------
-- 19. VENTAS
-- ---------------------------------------------------------------------
INSERT INTO venta (id_operacion, id_sucursal_venta, precio_acordado, km_entrega, meses_garantia, fecha_traspaso) VALUES
(16, 2, 56500000.00, 41300, 6, '2026-10-15'),
(17, 1, 51000000.00, 78500, 3, NULL),
(18, 5, 96000000.00, 64000, 0, NULL);

-- ---------------------------------------------------------------------
-- 20. CONDUCTORES AUTORIZADOS
-- ---------------------------------------------------------------------
INSERT INTO conductor_autorizado (id_alquiler, id_documento_licencia, es_conductor_principal) VALUES
(1, 31, 1), (2, 32, 1), (2, 33, 0), (3, 33, 1), (4, 34, 1), (5, 35, 1), (6, 36, 1), (7, 37, 1),
(8, 38, 1), (8, 41, 0), (8, 39, 0), (9, 39, 1), (11, 41, 1), (12, 42, 1), (13, 43, 1), (14, 44, 1), (15, 31, 1), (15, 32, 0);

-- ---------------------------------------------------------------------
-- 21. SERVICIOS DE CONDUCCION
-- ---------------------------------------------------------------------
INSERT INTO servicio_conduccion (id_servicio, id_chofer, vin_vehiculo, id_alquiler, id_suc_origen, id_suc_destino, tipo_asignacion, fecha_inicio, fecha_fin, costo_servicio) VALUES
(1, 23, 'MAZD2023ABU000003', 4, 2, 3, 'CHOFER_ALQUILER_CLIENTE', '2026-07-01 07:00:00', '2026-07-06 06:50:00', 600000.00),
(2, 23, 'BMWZ2024ABU000011', 7, 2, 2, 'CHOFER_ALQUILER_CLIENTE', '2026-10-24 10:00:00', '2026-10-27 09:30:00', 360000.00),
(3, 23, 'MAZD2023ABU000007', NULL, 3, 2, 'TRASLADO_FLOTA_INTERSUCURSAL', '2026-11-11 06:00:00', NULL, 350000.00),
(4, 28, 'MAZD2023ABU000003', NULL, 3, 2, 'TRASLADO_FLOTA_INTERSUCURSAL', '2026-07-08 06:00:00', '2026-07-08 18:00:00', 380000.00),
(5, 25, 'CHVR2021ABU000010', NULL, 3, 5, 'TRASLADO_FLOTA_INTERSUCURSAL', '2026-02-20 05:00:00', '2026-02-21 14:00:00', 520000.00);

-- ---------------------------------------------------------------------
-- 22. CATALOGO DE ADICIONALES
-- ---------------------------------------------------------------------
INSERT INTO catalogo_adicional (id_adicional, nombre, categoria, tarifa_diaria, descripcion) VALUES
(1, 'Proteccion Total CDW', 'SEGURO_CONTRATO', 48000.00, 'Reduce la responsabilidad del cliente ante danos al vehiculo.'),
(2, 'GPS', 'ACCESORIO', 15000.00, 'Navegador GPS con mapas de Colombia.'),
(3, 'Silla para Bebe', 'ACCESORIO', 12000.00, 'Silla homologada para ninos de hasta 18 kg.'),
(4, 'Conductor Adicional', 'SERVICIO_ESPECIAL', 20000.00, 'Autoriza a un conductor extra en el contrato.'),
(5, 'Seguro de Llantas y Vidrios', 'SEGURO_CONTRATO', 18000.00, 'Cubre danos a llantas y vidrios.'),
(6, 'WiFi Portatil', 'ACCESORIO', 10000.00, 'Router movil con datos ilimitados.'),
(7, 'Portaequipaje de Techo', 'ACCESORIO', 14000.00, NULL);

-- ---------------------------------------------------------------------
-- 23. ADICIONALES POR ALQUILER
-- ---------------------------------------------------------------------
INSERT INTO alquiler_adicional (id_alquiler, id_adicional, cantidad, precio_unitario_aplicado) VALUES
(1, 2, 1, 15000.00), (2, 1, 1, 45000.00), (4, 1, 1, 45000.00), (5, 2, 1, 15000.00), (5, 3, 1, 12000.00),
(6, 1, 1, 45000.00), (6, 5, 1, 18000.00), (7, 1, 1, 45000.00), (8, 4, 2, 20000.00), (11, 5, 1, 18000.00),
(12, 2, 1, 15000.00), (12, 6, 1, 10000.00), (13, 1, 1, 45000.00), (15, 1, 1, 45000.00), (15, 3, 2, 12000.00);

-- ---------------------------------------------------------------------
-- 24. PAGOS
-- ---------------------------------------------------------------------
INSERT INTO pago (id_pago, id_operacion, fecha_pago, monto, metodo_pago, concepto) VALUES
(1, 1, '2026-08-03 08:35:00', 500000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(2, 1, '2026-08-03 08:40:00', 540000.00, 'EFECTIVO', 'CANON_ALQUILER'),
(3, 2, '2026-11-09 10:05:00', 500000.00, 'TRANSFERENCIA', 'DEPOSITO_GARANTIA'),
(4, 2, '2026-11-09 10:10:00', 700000.00, 'TARJETA_DEBITO', 'CANON_ALQUILER'),
(5, 3, '2026-09-12 16:05:00', 500000.00, 'EFECTIVO', 'DEPOSITO_GARANTIA'),
(6, 3, '2026-09-12 16:10:00', 240000.00, 'EFECTIVO', 'CANON_ALQUILER'),
(7, 4, '2026-07-01 06:55:00', 800000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(8, 4, '2026-07-01 07:00:00', 1325000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(9, 4, '2026-07-01 07:05:00', 600000.00, 'TRANSFERENCIA', 'SERVICIO_CHOFER'),
(10, 5, '2026-09-20 08:50:00', 1500000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(11, 5, '2026-09-20 09:00:00', 1535000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(12, 5, '2026-09-25 11:40:00', 80000.00, 'EFECTIVO', 'MORA_ENTREGA'),
(13, 5, '2026-10-02 15:00:00', 2300000.00, 'TRANSFERENCIA', 'CARGO_DANOS'),
(14, 6, '2026-10-05 07:50:00', 2000000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(15, 6, '2026-10-05 08:00:00', 3000000.00, 'TRANSFERENCIA', 'CANON_ALQUILER'),
(16, 6, '2026-10-19 07:50:00', 3202000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(17, 7, '2026-10-24 09:50:00', 3000000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(18, 7, '2026-10-24 10:00:00', 1785000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(19, 7, '2026-10-24 10:05:00', 360000.00, 'TARJETA_CREDITO', 'SERVICIO_CHOFER'),
(20, 8, '2026-08-17 08:30:00', 1500000.00, 'TRANSFERENCIA', 'DEPOSITO_GARANTIA'),
(21, 8, '2026-08-17 08:35:00', 4480000.00, 'TRANSFERENCIA', 'CANON_ALQUILER'),
(22, 9, '2026-03-10 08:50:00', 500000.00, 'EFECTIVO', 'DEPOSITO_GARANTIA'),
(23, 9, '2026-03-10 09:00:00', 240000.00, 'EFECTIVO', 'CANON_ALQUILER'),
(24, 10, '2026-04-20 10:00:00', 500000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(25, 11, '2026-06-20 09:50:00', 1500000.00, 'TARJETA_DEBITO', 'DEPOSITO_GARANTIA'),
(26, 11, '2026-06-20 10:00:00', 1014000.00, 'TARJETA_DEBITO', 'CANON_ALQUILER'),
(27, 11, '2026-06-24 11:00:00', 460000.00, 'EFECTIVO', 'CARGO_DANOS'),
(28, 12, '2026-10-20 09:50:00', 1500000.00, 'EFECTIVO', 'DEPOSITO_GARANTIA'),
(29, 12, '2026-10-20 10:00:00', 915000.00, 'TARJETA_DEBITO', 'CANON_ALQUILER'),
(30, 13, '2026-08-24 10:45:00', 800000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(31, 13, '2026-08-24 11:00:00', 1575000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(32, 14, '2026-10-30 09:00:00', 500000.00, 'EFECTIVO', 'DEPOSITO_GARANTIA'),
(33, 14, '2026-10-30 09:05:00', 360000.00, 'TRANSFERENCIA', 'CANON_ALQUILER'),
(34, 15, '2026-09-28 07:50:00', 1500000.00, 'TARJETA_CREDITO', 'DEPOSITO_GARANTIA'),
(35, 15, '2026-09-28 08:00:00', 1396000.00, 'TARJETA_CREDITO', 'CANON_ALQUILER'),
(36, 16, '2026-10-14 11:00:00', 56500000.00, 'TRANSFERENCIA', 'PAGO_TOTAL_VENTA'),
(37, 17, '2026-10-28 15:00:00', 10200000.00, 'TRANSFERENCIA', 'CUOTA_VENTA'),
(38, 17, '2026-11-02 10:00:00', 3400000.00, 'FINANCIACION', 'CUOTA_VENTA'),
(39, 18, '2026-10-05 12:00:00', 2000000.00, 'EFECTIVO', 'CUOTA_VENTA'),
(40, 15, '2026-10-02 08:00:00', 85000.00, 'EFECTIVO', 'RECARGO_COMBUSTIBLE'),
(41, 4, '2026-07-06 12:00:00', 650000.00, 'TARJETA_CREDITO', 'CARGO_DANOS');

-- ---------------------------------------------------------------------
-- 25. INCIDENTES / SINIESTROS
-- ---------------------------------------------------------------------
INSERT INTO incidente_siniestro (id_incidente, vin_vehiculo, id_alquiler, id_empleado_inspector, id_poliza_afectada, id_pago_deducible, fecha_incidente, tipo_incidente, descripcion, costo_reparacion, monto_a_cargo_cliente, estado_incidente) VALUES
(1, 'TYTA2024ABU000006', 5, 18, 21, 13, '2026-09-25 11:45:00', 'COLISION', 'Golpe frontal con dano en parachoques, farola y capo.', 7800000.00, 2300000.00, 'COBRADO_CLIENTE'),
(2, 'RNLT2022ABU000008', 11, 19, NULL, 27, '2026-06-23 10:20:00', 'MULTA_TRANSITO', 'Comparendo por exceso de velocidad detectado por fotomulta.', 0.00, 460000.00, 'CERRADO'),
(3, 'NSSN2022ABU000012', 13, 19, 24, NULL, '2026-08-28 06:30:00', 'ROBO_TOTAL', 'Hurto del vehiculo en parqueadero publico; denuncia presentada.', 48000000.00, 1200000.00, 'RECLAMADO_ASEGURADORA'),
(4, 'TYTA2023ABU000009', 6, 18, NULL, NULL, '2026-10-19 07:40:00', 'FALLA_MECANICA_RUTA', 'Falla en caja de cambios reportada al devolver el vehiculo.', 2700000.00, 0.00, 'EN_PERITAJE'),
(5, 'RNLT2023ABU000001', 1, 18, NULL, NULL, '2026-08-07 09:20:00', 'DANO_MENOR', 'Rayon leve en puerta trasera derecha.', 180000.00, 180000.00, 'REPORTADO'),
(6, 'MAZD2023ABU000003', 4, 18, NULL, 41, '2026-07-06 06:55:00', 'ROBO_PARCIAL', 'Hurto del espejo retrovisor izquierdo.', 650000.00, 650000.00, 'COBRADO_CLIENTE'),
(7, 'VWGN2023ABU000018', NULL, 19, NULL, NULL, '2026-05-14 15:00:00', 'DANO_MENOR', 'Dano por granizo en techo durante almacenamiento en patio.', 420000.00, 0.00, 'CERRADO');

-- ---------------------------------------------------------------------
-- 26. TICKETS DE ATENCION
-- ---------------------------------------------------------------------
INSERT INTO ticket_atencion (id_ticket, id_cliente, id_empleado_agente, id_operacion, fecha_apertura, fecha_cierre, canal, tipo_solicitud, prioridad, estado, observaciones_resolucion) VALUES
(1, 5, 26, 5, '2026-09-25 12:00:00', '2026-09-26 10:00:00', 'TELEFONO', 'RECLAMO_FACTURACION', 'MEDIA', 'CERRADO', 'Se explico el cobro por dano y mora; el cliente acepto.'),
(2, 6, 26, 6, '2026-10-18 21:15:00', NULL, 'TELEFONO', 'ASISTENCIA_VIAL', 'CRITICA_RUTA', 'ESCALADO_TALLER', NULL),
(3, 12, 27, 12, '2026-10-26 09:00:00', NULL, 'WEB_CHAT', 'RECLAMO_FACTURACION', 'ALTA', 'EN_GESTION', NULL),
(4, 3, 27, NULL, '2026-11-05 14:00:00', '2026-11-05 14:10:00', 'APP_MOVIL', 'CONSULTA_GENERAL', 'BAJA', 'CERRADO', 'Se informaron los requisitos para alquilar.'),
(5, 5, 27, 16, '2026-11-03 10:00:00', NULL, 'EMAIL', 'GARANTIA_POSTVENTA', 'MEDIA', 'ABIERTO', NULL),
(6, 8, 26, 8, '2026-08-20 15:00:00', '2026-08-21 09:00:00', 'EMAIL', 'QUEJA_SERVICIO', 'BAJA', 'RESUELTO', 'Se ofrecio descuento en el proximo alquiler corporativo.'),
(7, 13, 27, 13, '2026-08-28 06:40:00', '2026-08-28 08:30:00', 'TELEFONO', 'ASISTENCIA_VIAL', 'CRITICA_RUTA', 'CERRADO', 'Se reporto el robo y se coordino apoyo con la aseguradora.'),
(8, 10, 26, 17, '2026-11-06 11:00:00', NULL, 'PRESENCIAL', 'GARANTIA_POSTVENTA', 'ALTA', 'EN_GESTION', NULL),
(9, 2, 26, 2, '2026-11-10 09:00:00', NULL, 'TELEFONO', 'CONSULTA_GENERAL', 'BAJA', 'ABIERTO', NULL),
(10, 1, 27, 15, '2026-10-02 09:00:00', '2026-10-02 09:20:00', 'PRESENCIAL', 'QUEJA_SERVICIO', 'MEDIA', 'CERRADO', 'Se atendio la queja por demora en la entrega en Medellin.');

-- ---------------------------------------------------------------------
-- 27. SINCRONIZACION FINAL DE ESTADOS
-- ---------------------------------------------------------------------
UPDATE vehiculo SET estado_operativo='ALQUILADO',          kilometraje_actual=14980, id_sucursal_actual=1 WHERE vin='RNLT2023ABU000001';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=22790, id_sucursal_actual=1 WHERE vin='CHVR2022ABU000002';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=19700, id_sucursal_actual=2 WHERE vin='MAZD2023ABU000003';
UPDATE vehiculo SET estado_operativo='VENDIDO',            kilometraje_actual=41300, id_sucursal_actual=2 WHERE vin='TYTA2022ABU000004';
UPDATE vehiculo SET estado_operativo='RESERVADO_VENTA',    kilometraje_actual=52300, id_sucursal_actual=3 WHERE vin='KMHK2021ABU000005';
UPDATE vehiculo SET estado_operativo='EN_MANTENIMIENTO',   kilometraje_actual=9020,  id_sucursal_actual=1 WHERE vin='TYTA2024ABU000006';
UPDATE vehiculo SET estado_operativo='EN_TRASLADO',        kilometraje_actual=10250, id_sucursal_actual=3 WHERE vin='MAZD2023ABU000007';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=27420, id_sucursal_actual=4 WHERE vin='RNLT2022ABU000008';
UPDATE vehiculo SET estado_operativo='EN_MANTENIMIENTO',   kilometraje_actual=32850, id_sucursal_actual=3 WHERE vin='TYTA2023ABU000009';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=64000, id_sucursal_actual=5 WHERE vin='CHVR2021ABU000010';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=5610,  id_sucursal_actual=2 WHERE vin='BMWZ2024ABU000011';
UPDATE vehiculo SET estado_operativo='FUERA_DE_SERVICIO',  kilometraje_actual=33800, id_sucursal_actual=5 WHERE vin='NSSN2022ABU000012';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=40420, id_sucursal_actual=4 WHERE vin='SZKU2022ABU000013';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=12900, id_sucursal_actual=5 WHERE vin='HYUN2023ABU000014';
UPDATE vehiculo SET estado_operativo='VENDIDO',            kilometraje_actual=78500, id_sucursal_actual=1 WHERE vin='MAZD2020ABU000015';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=45600, id_sucursal_actual=1 WHERE vin='KMHK2022ABU000016';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=16800, id_sucursal_actual=3 WHERE vin='CHVR2024ABU000017';
UPDATE vehiculo SET estado_operativo='DISPONIBLE',         kilometraje_actual=20800, id_sucursal_actual=2 WHERE vin='VWGN2023ABU000018';

UPDATE reserva SET estado = 'CUMPLIDA' WHERE id_reserva IN (1,2,3,4,5,6,8,9,10,11);

UPDATE operacion SET estado_operacion = 'ABIERTA' WHERE id_operacion = 17;
UPDATE operacion SET estado_operacion = 'ANULADA' WHERE id_operacion IN (10, 18);
UPDATE operacion SET estado_operacion = 'ABIERTA'  WHERE id_operacion = 2;
UPDATE operacion SET estado_operacion = 'EN_MORA'  WHERE id_operacion = 12;