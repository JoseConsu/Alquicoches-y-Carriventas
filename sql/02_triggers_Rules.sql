USE bd_alquicoches_carriventas;

-- =========================================================================
-- TRIGGER 1: CONTROL DE APERTURA DE ALQUILER Y SINCRONIZACIÓN
-- =========================================================================
DELIMITER //
CREATE TRIGGER trg_alquiler_before_insert
BEFORE INSERT ON alquiler
FOR EACH ROW
BEGIN
    DECLARE v_estado VARCHAR(25);
    DECLARE v_modalidad VARCHAR(20);
    DECLARE v_km INT;
    DECLARE v_soat_valido INT DEFAULT 0;
    DECLARE v_vin CHAR(17);

    -- Identificar el chasis asociado al contrato
    SELECT vin_vehiculo INTO v_vin FROM operacion WHERE id_operacion = NEW.id_operacion;

    -- Extraer metadatos actuales del vehículo
    SELECT estado_operativo, modalidad_flota, kilometraje_actual 
    INTO v_estado, v_modalidad, v_km 
    FROM vehiculo WHERE vin = v_vin;

    -- Validaciones críticas transaccionales
    IF v_estado != 'DISPONIBLE' THEN
        SIGNAL SQLSTATE '45000' MESSAGE_TEXT = 'Violación de Integridad: El vehículo no está DISPONIBLE.';
    END IF;

    IF v_modalidad = 'SOLO_VENTA' THEN
        SIGNAL SQLSTATE '45000' MESSAGE_TEXT = 'Violación Comercial: Vehículo exclusivo para venta.';
    END IF;

    -- Validación Regulatoria (SOAT)
    SELECT COUNT(*) INTO v_soat_valido 
    FROM poliza_vehiculo 
    WHERE vin_vehiculo = v_vin 
      AND tipo_poliza = 'SOAT' 
      AND activa = 1 
      AND fecha_vencimiento >= NEW.fecha_devolucion_prevista;

    IF v_soat_valido = 0 THEN
        SIGNAL SQLSTATE '45000' MESSAGE_TEXT = 'Bloqueo Legal: SOAT inactivo o expira durante el contrato.';
    END IF;

    -- Asignación automática: El km_salida hereda obligatoriamente el km del vehículo
    SET NEW.km_salida = v_km;

    -- Propagación de estados a tablas relacionadas
    UPDATE vehiculo SET estado_operativo = 'ALQUILADO' WHERE vin = v_vin;
    
    IF NEW.id_reserva IS NOT NULL THEN
        UPDATE reserva SET estado = 'CUMPLIDA' WHERE id_reserva = NEW.id_reserva;
    END IF;
END; //
DELIMITER ;


-- =========================================================================
-- TRIGGER 2: AUDITORÍA DE LICENCIAS DE CONDUCCIÓN
-- =========================================================================
DELIMITER //
CREATE TRIGGER trg_cond_aut_before_insert
BEFORE INSERT ON conductor_autorizado
FOR EACH ROW
BEGIN
    DECLARE v_tipo VARCHAR(30);
    DECLARE v_activo TINYINT;
    DECLARE v_vencimiento DATE;
    DECLARE v_fecha_retorno DATETIME;

    SELECT tipo_documento, activo, fecha_vencimiento 
    INTO v_tipo, v_activo, v_vencimiento 
    FROM documento_persona WHERE id_documento = NEW.id_documento_licencia;

    SELECT fecha_devolucion_prevista INTO v_fecha_retorno 
    FROM alquiler WHERE id_operacion = NEW.id_alquiler;

    IF v_tipo != 'LICENCIA_CONDUCCION' OR v_activo = 0 OR (v_vencimiento IS NOT NULL AND v_vencimiento < DATE(v_fecha_retorno)) THEN
        SIGNAL SQLSTATE '45000' MESSAGE_TEXT = 'Bloqueo Legal: Licencia inválida, inactiva o caduca antes del retorno.';
    END IF;
END; //
DELIMITER ;


-- =========================================================================
-- TRIGGER 3: LIQUIDACIÓN LOGÍSTICA ONE-WAY Y PASO A TALLER
-- =========================================================================
DELIMITER //
CREATE TRIGGER trg_alquiler_after_update
AFTER UPDATE ON alquiler
FOR EACH ROW
BEGIN
    DECLARE v_vin CHAR(17);
    DECLARE v_siniestros_abiertos INT DEFAULT 0;

    -- Detectar que la actualización corresponde al cierre real del vehículo
    IF NEW.fecha_devolucion_real IS NOT NULL AND OLD.fecha_devolucion_real IS NULL THEN
        SELECT vin_vehiculo INTO v_vin FROM operacion WHERE id_operacion = NEW.id_operacion;

        -- Verificar si ocurrió algún siniestro en este contrato que aún no esté cerrado
        SELECT COUNT(*) INTO v_siniestros_abiertos 
        FROM incidente_siniestro 
        WHERE id_alquiler = NEW.id_operacion AND estado_incidente NOT IN ('CERRADO', 'COBRADO_CLIENTE');

        IF v_siniestros_abiertos > 0 THEN
            UPDATE vehiculo 
            SET kilometraje_actual = NEW.km_llegada, 
                id_sucursal_actual = NEW.id_suc_llegada, 
                estado_operativo = 'EN_MANTENIMIENTO'
            WHERE vin = v_vin;
        ELSE
            UPDATE vehiculo 
            SET kilometraje_actual = NEW.km_llegada, 
                id_sucursal_actual = NEW.id_suc_llegada, 
                estado_operativo = 'DISPONIBLE'
            WHERE vin = v_vin;
        END IF;

        UPDATE operacion SET estado_operacion = 'CERRADA' WHERE id_operacion = NEW.id_operacion;
    END IF;
END; //
DELIMITER ;


-- =========================================================================
-- TRIGGER 4: EXTRACCIÓN DE INVENTARIO POR COMPRAVENTA
-- =========================================================================
DELIMITER //
CREATE TRIGGER trg_venta_after_insert
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
    DECLARE v_vin CHAR(17);
    SELECT vin_vehiculo INTO v_vin FROM operacion WHERE id_operacion = NEW.id_operacion;

    UPDATE vehiculo 
    SET kilometraje_actual = NEW.km_entrega,
        estado_operativo = 'VENDIDO',
        id_sucursal_actual = NEW.id_sucursal_venta
    WHERE vin = v_vin;

    UPDATE operacion SET estado_operacion = 'CERRADA' WHERE id_operacion = NEW.id_operacion;
END; //
DELIMITER ;