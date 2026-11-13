-- =========================================================================
-- CONFIGURACIÓN DEL MOTOR Y ESQUEMA
-- =========================================================================
ALTER DATABASE bd_alquicoches_carriventas CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE bd_alquicoches_carriventas;

-- =========================================================================
-- MÓDULO 1: IDENTIDAD, CLIENTES Y RECURSOS HUMANOS
-- =========================================================================

CREATE TABLE sucursal (
    id_sucursal INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE persona (
    id_persona INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    primer_nombre VARCHAR(60) NOT NULL,
    segundo_nombre VARCHAR(60) NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE telefono_persona (
    id_telefono INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNSIGNED NOT NULL,
    numero VARCHAR(30) NOT NULL,
    tipo ENUM('MOVIL', 'FIJO', 'TRABAJO', 'EMERGENCIA') NOT NULL,
    es_principal TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE documento_persona (
    id_documento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNSIGNED NOT NULL,
    tipo_documento ENUM('CEDULA', 'PASAPORTE', 'CEDULA_EXTRANJERIA', 'LICENCIA_CONDUCCION') NOT NULL,
    categoria_licencia VARCHAR(10) NULL,
    numero_documento VARCHAR(50) NOT NULL,
    pais_emision VARCHAR(60) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1,
    UNIQUE KEY uk_doc_persona (tipo_documento, numero_documento, pais_emision),
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE cliente (
    id_persona INT UNSIGNED PRIMARY KEY,
    fecha_registro DATE NOT NULL,
    nivel_fidelidad ENUM('ESTANDAR', 'PLATA', 'ORO', 'PLATINO', 'CORPORATIVO') NOT NULL DEFAULT 'ESTANDAR',
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE cargo (
    id_cargo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    area_operativa ENUM('ADMINISTRACION', 'VENTAS', 'MOSTRADOR_ALQUILER', 'CONDUCCION_LOGISTICA', 'MANTENIMIENTO_TALLER', 'ATENCION_CLIENTE') NOT NULL,
    responsabilidades TEXT NOT NULL,
    salario_base DECIMAL(12,2) NOT NULL CHECK (salario_base > 0),
    porcentaje_comision DECIMAL(5,2) NOT NULL DEFAULT 0.00 CHECK (porcentaje_comision BETWEEN 0 AND 100)
) ENGINE=InnoDB;

CREATE TABLE empleado (
    id_persona INT UNSIGNED PRIMARY KEY,
    id_cargo INT UNSIGNED NOT NULL,
    id_sucursal INT UNSIGNED NOT NULL,
    fecha_contratacion DATE NOT NULL,
    estado_laboral ENUM('ACTIVO', 'VACACIONES', 'INCAPACIDAD', 'SUSPENDIDO', 'RETIRADO') NOT NULL DEFAULT 'ACTIVO',
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo) ON DELETE RESTRICT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE turno_empleado (
    id_turno INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT UNSIGNED NOT NULL,
    id_sucursal INT UNSIGNED NOT NULL,
    inicio_turno DATETIME NOT NULL,
    fin_turno DATETIME NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    CHECK (fin_turno > inicio_turno)
) ENGINE=InnoDB;

CREATE TABLE perfil_chofer (
    id_empleado INT UNSIGNED PRIMARY KEY,
    id_doc_licencia INT UNSIGNED NOT NULL UNIQUE,
    tarifa_diaria_servicio DECIMAL(10,2) NOT NULL CHECK (tarifa_diaria_servicio >= 0),
    estado_disponibilidad ENUM('DISPONIBLE', 'EN_RUTA', 'DESCANSO', 'INACTIVO') NOT NULL DEFAULT 'DISPONIBLE',
    calificacion_promedio DECIMAL(3,2) NOT NULL DEFAULT 5.00 CHECK (calificacion_promedio BETWEEN 1.00 AND 5.00),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_doc_licencia) REFERENCES documento_persona(id_documento) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================================================================
-- MÓDULO 2: FLOTA, PRECIOS, SEGUROS Y TALLER
-- =========================================================================

CREATE TABLE categoria_vehiculo (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    tarifa_diaria DECIMAL(10,2) NOT NULL CHECK (tarifa_diaria > 0),
    deposito_garantia DECIMAL(10,2) NOT NULL CHECK (deposito_garantia >= 0)
) ENGINE=InnoDB;

CREATE TABLE tarifa_temporada (
    id_tarifa_temp INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT UNSIGNED NOT NULL,
    nombre_temporada VARCHAR(80) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tarifa_diaria_especial DECIMAL(10,2) NOT NULL CHECK (tarifa_diaria_especial > 0),
    FOREIGN KEY (id_categoria) REFERENCES categoria_vehiculo(id_categoria) ON DELETE CASCADE,
    CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE vehiculo (
    vin CHAR(17) PRIMARY KEY,
    placa VARCHAR(15) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    anio SMALLINT UNSIGNED NOT NULL CHECK (anio >= 1990),
    kilometraje_actual INT UNSIGNED NOT NULL DEFAULT 0 CHECK (kilometraje_actual >= 0),
    modalidad_flota ENUM('SOLO_ALQUILER', 'SOLO_VENTA', 'MIXTO') NOT NULL DEFAULT 'MIXTO',
    precio_lista_venta DECIMAL(14,2) NULL,
    estado_operativo ENUM('DISPONIBLE', 'ALQUILADO', 'EN_MANTENIMIENTO', 'EN_TRASLADO', 'RESERVADO_VENTA', 'VENDIDO', 'FUERA_DE_SERVICIO') NOT NULL DEFAULT 'DISPONIBLE',
    id_categoria INT UNSIGNED NOT NULL,
    id_sucursal_actual INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria_vehiculo(id_categoria) ON DELETE RESTRICT,
    FOREIGN KEY (id_sucursal_actual) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE aseguradora (
    id_aseguradora INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    telefono_asistencia VARCHAR(30) NOT NULL,
    email_contacto VARCHAR(120) NULL
) ENGINE=InnoDB;

CREATE TABLE poliza_vehiculo (
    id_poliza INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vin_vehiculo CHAR(17) NOT NULL,
    id_aseguradora INT UNSIGNED NOT NULL,
    numero_poliza VARCHAR(50) NOT NULL UNIQUE,
    tipo_poliza ENUM('SOAT', 'TODO_RIESGO', 'RESPONSABILIDAD_CIVIL') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    costo_prima DECIMAL(12,2) NOT NULL CHECK (costo_prima >= 0),
    deducible_pactado DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (deducible_pactado >= 0),
    activa TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (vin_vehiculo) REFERENCES vehiculo(vin) ON DELETE CASCADE,
    FOREIGN KEY (id_aseguradora) REFERENCES aseguradora(id_aseguradora) ON DELETE RESTRICT,
    CHECK (fecha_vencimiento > fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE orden_mantenimiento (
    id_mantenimiento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vin_vehiculo CHAR(17) NOT NULL,
    id_empleado_tecnico INT UNSIGNED NOT NULL,
    id_sucursal_taller INT UNSIGNED NOT NULL,
    fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_salida DATETIME NULL,
    km_ingreso INT UNSIGNED NOT NULL,
    tipo_mantenimiento ENUM('PREVENTIVO', 'CORRECTIVO', 'ALISTAMIENTO_VENTA', 'REPARACION_SINIESTRO') NOT NULL,
    costo_mano_obra DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (costo_mano_obra >= 0),
    costo_repuestos DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (costo_repuestos >= 0),
    descripcion TEXT NOT NULL,
    estado_orden ENUM('PROGRAMADO', 'EN_PROCESO', 'COMPLETADO', 'CANCELADO') NOT NULL DEFAULT 'EN_PROCESO',
    FOREIGN KEY (vin_vehiculo) REFERENCES vehiculo(vin) ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado_tecnico) REFERENCES empleado(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_sucursal_taller) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    CHECK (fecha_salida IS NULL OR fecha_salida >= fecha_ingreso)
) ENGINE=InnoDB;

-- =========================================================================
-- MÓDULO 3: OPERACIONES, CONTRATOS, CHOFERES Y PAGOS
-- =========================================================================

CREATE TABLE reserva (
    id_reserva INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    requiere_chofer TINYINT(1) NOT NULL DEFAULT 0,
    estado ENUM('PENDIENTE', 'CONFIRMADA', 'CANCELADA', 'CUMPLIDA', 'NO_SHOW') NOT NULL DEFAULT 'PENDIENTE',
    id_cliente INT UNSIGNED NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    id_suc_recogida INT UNSIGNED NOT NULL,
    id_suc_entrega INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_categoria) REFERENCES categoria_vehiculo(id_categoria) ON DELETE RESTRICT,
    FOREIGN KEY (id_suc_recogida) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    FOREIGN KEY (id_suc_entrega) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE operacion (
    id_operacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_operacion ENUM('ALQUILER', 'VENTA') NOT NULL,
    valor_total DECIMAL(14,2) NOT NULL DEFAULT 0.00 CHECK (valor_total >= 0),
    estado_operacion ENUM('ABIERTA', 'CERRADA', 'ANULADA', 'EN_MORA') NOT NULL DEFAULT 'ABIERTA',
    id_cliente INT UNSIGNED NOT NULL,
    id_empleado_gestor INT UNSIGNED NOT NULL,
    vin_vehiculo CHAR(17) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado_gestor) REFERENCES empleado(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (vin_vehiculo) REFERENCES vehiculo(vin) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE alquiler (
    id_operacion INT UNSIGNED PRIMARY KEY,
    id_reserva INT UNSIGNED UNIQUE NULL,
    fecha_salida DATETIME NOT NULL,
    fecha_devolucion_prevista DATETIME NOT NULL,
    fecha_devolucion_real DATETIME NULL,
    km_salida INT UNSIGNED NOT NULL,
    km_llegada INT UNSIGNED NULL,
    id_suc_salida INT UNSIGNED NOT NULL,
    id_suc_llegada INT UNSIGNED NULL,
    FOREIGN KEY (id_operacion) REFERENCES operacion(id_operacion) ON DELETE CASCADE,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva) ON DELETE SET NULL,
    FOREIGN KEY (id_suc_salida) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    FOREIGN KEY (id_suc_llegada) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    CHECK (fecha_devolucion_prevista > fecha_salida),
    CHECK (km_llegada IS NULL OR km_llegada >= km_salida)
) ENGINE=InnoDB;

CREATE TABLE venta (
    id_operacion INT UNSIGNED PRIMARY KEY,
    id_sucursal_venta INT UNSIGNED NOT NULL,
    precio_acordado DECIMAL(14,2) NOT NULL CHECK (precio_acordado > 0),
    km_entrega INT UNSIGNED NOT NULL,
    meses_garantia SMALLINT UNSIGNED NOT NULL DEFAULT 12,
    fecha_traspaso DATE NULL,
    FOREIGN KEY (id_operacion) REFERENCES operacion(id_operacion) ON DELETE CASCADE,
    FOREIGN KEY (id_sucursal_venta) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE conductor_autorizado (
    id_alquiler INT UNSIGNED NOT NULL,
    id_documento_licencia INT UNSIGNED NOT NULL,
    es_conductor_principal TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_alquiler, id_documento_licencia),
    FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_operacion) ON DELETE CASCADE,
    FOREIGN KEY (id_documento_licencia) REFERENCES documento_persona(id_documento) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE servicio_conduccion (
    id_servicio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_chofer INT UNSIGNED NOT NULL,
    vin_vehiculo CHAR(17) NOT NULL,
    id_alquiler INT UNSIGNED NULL,
    id_suc_origen INT UNSIGNED NOT NULL,
    id_suc_destino INT UNSIGNED NOT NULL,
    tipo_asignacion ENUM('CHOFER_ALQUILER_CLIENTE', 'TRASLADO_FLOTA_INTERSUCURSAL') NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NULL,
    costo_servicio DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_servicio >= 0),
    FOREIGN KEY (id_chofer) REFERENCES perfil_chofer(id_empleado) ON DELETE RESTRICT,
    FOREIGN KEY (vin_vehiculo) REFERENCES vehiculo(vin) ON DELETE RESTRICT,
    FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_operacion) ON DELETE RESTRICT,
    FOREIGN KEY (id_suc_origen) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    FOREIGN KEY (id_suc_destino) REFERENCES sucursal(id_sucursal) ON DELETE RESTRICT,
    CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE catalogo_adicional (
    id_adicional INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    categoria ENUM('SEGURO_CONTRATO', 'ACCESORIO', 'SERVICIO_ESPECIAL') NOT NULL,
    tarifa_diaria DECIMAL(10,2) NOT NULL CHECK (tarifa_diaria > 0),
    descripcion TEXT NULL
) ENGINE=InnoDB;

CREATE TABLE alquiler_adicional (
    id_alquiler INT UNSIGNED NOT NULL,
    id_adicional INT UNSIGNED NOT NULL,
    cantidad SMALLINT UNSIGNED NOT NULL DEFAULT 1 CHECK (cantidad > 0),
    precio_unitario_aplicado DECIMAL(10,2) NOT NULL CHECK (precio_unitario_aplicado >= 0),
    PRIMARY KEY (id_alquiler, id_adicional),
    FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_operacion) ON DELETE CASCADE,
    FOREIGN KEY (id_adicional) REFERENCES catalogo_adicional(id_adicional) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pago (
    id_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_operacion INT UNSIGNED NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(14,2) NOT NULL CHECK (monto > 0),
    metodo_pago ENUM('EFECTIVO', 'TARJETA_CREDITO', 'TARJETA_DEBITO', 'TRANSFERENCIA', 'FINANCIACION') NOT NULL,
    concepto ENUM('DEPOSITO_GARANTIA', 'CANON_ALQUILER', 'CUOTA_VENTA', 'PAGO_TOTAL_VENTA', 'CARGO_DANOS', 'RECARGO_COMBUSTIBLE', 'SERVICIO_CHOFER', 'MORA_ENTREGA') NOT NULL,
    FOREIGN KEY (id_operacion) REFERENCES operacion(id_operacion) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================================================================
-- MÓDULO 4: SINIESTROS Y SOPORTE AL CLIENTE
-- =========================================================================

CREATE TABLE incidente_siniestro (
    id_incidente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vin_vehiculo CHAR(17) NOT NULL,
    id_alquiler INT UNSIGNED NULL,
    id_empleado_inspector INT UNSIGNED NOT NULL,
    id_poliza_afectada INT UNSIGNED NULL,
    id_pago_deducible INT UNSIGNED NULL,
    fecha_incidente DATETIME NOT NULL,
    tipo_incidente ENUM('COLISION', 'DANO_MENOR', 'ROBO_PARCIAL', 'ROBO_TOTAL', 'MULTA_TRANSITO', 'FALLA_MECANICA_RUTA') NOT NULL,
    descripcion TEXT NOT NULL,
    costo_reparacion DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (costo_reparacion >= 0),
    monto_a_cargo_cliente DECIMAL(12,2) NOT NULL DEFAULT 0.00 CHECK (monto_a_cargo_cliente >= 0),
    estado_incidente ENUM('REPORTADO', 'EN_PERITAJE', 'RECLAMADO_ASEGURADORA', 'COBRADO_CLIENTE', 'CERRADO') NOT NULL DEFAULT 'REPORTADO',
    FOREIGN KEY (vin_vehiculo) REFERENCES vehiculo(vin) ON DELETE RESTRICT,
    FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_operacion) ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado_inspector) REFERENCES empleado(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_poliza_afectada) REFERENCES poliza_vehiculo(id_poliza) ON DELETE RESTRICT,
    FOREIGN KEY (id_pago_deducible) REFERENCES pago(id_pago) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE ticket_atencion (
    id_ticket INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNSIGNED NOT NULL,
    id_empleado_agente INT UNSIGNED NOT NULL,
    id_operacion INT UNSIGNED NULL,
    fecha_apertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME NULL,
    canal ENUM('TELEFONO', 'WEB_CHAT', 'EMAIL', 'PRESENCIAL', 'APP_MOVIL') NOT NULL,
    tipo_solicitud ENUM('ASISTENCIA_VIAL', 'RECLAMO_FACTURACION', 'GARANTIA_POSTVENTA', 'QUEJA_SERVICIO', 'CONSULTA_GENERAL') NOT NULL,
    prioridad ENUM('BAJA', 'MEDIA', 'ALTA', 'CRITICA_RUTA') NOT NULL DEFAULT 'MEDIA',
    estado ENUM('ABIERTO', 'EN_GESTION', 'ESCALADO_TALLER', 'RESUELTO', 'CERRADO') NOT NULL DEFAULT 'ABIERTO',
    observaciones_resolucion TEXT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado_agente) REFERENCES empleado(id_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_operacion) REFERENCES operacion(id_operacion) ON DELETE RESTRICT,
    CHECK (fecha_cierre IS NULL OR fecha_cierre >= fecha_apertura)
) ENGINE=InnoDB;

-- =========================================================================
-- ÍNDICES FÍSICOS COMPUESTOS (ÁRBOLES B+) PARA ALTA CONCURRENCIA
-- =========================================================================

CREATE INDEX idx_vehiculo_disp ON vehiculo(id_sucursal_actual, id_categoria, estado_operativo, modalidad_flota);
CREATE INDEX idx_reserva_fechas ON reserva(id_categoria, id_suc_recogida, estado, fecha_inicio, fecha_fin);
CREATE INDEX idx_poliza_activa ON poliza_vehiculo(vin_vehiculo, tipo_poliza, activa, fecha_vencimiento);
CREATE INDEX idx_operacion_cliente ON operacion(id_cliente, tipo_operacion, estado_operacion, fecha_creacion);
CREATE INDEX idx_pago_operacion ON pago(id_operacion, concepto, fecha_pago);
CREATE INDEX idx_ticket_estado_prioridad ON ticket_atencion(estado, prioridad, id_empleado_agente);