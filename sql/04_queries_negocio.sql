USE bd_alquicoches_carriventas;

/*1. Aseguradoras cuyo nombre empieza por S, con sus polizas*/
SELECT a.nombre AS aseguradora,
       a.nit,
       COUNT(p.id_poliza) AS polizas_emitidas,
       SUM(p.activa = 1)  AS polizas_activas,
       SUM(p.costo_prima) AS prima_total
FROM aseguradora a
LEFT JOIN poliza_vehiculo p ON p.id_aseguradora = a.id_aseguradora
WHERE a.nombre LIKE 'S%'
GROUP BY a.id_aseguradora, a.nombre, a.nit
ORDER BY a.nombre;


/*2. Personas cuyo primer nombre o apellido empieza por S y su rol*/
SELECT pe.id_persona,
       pe.primer_nombre,
       pe.segundo_nombre,
       pe.apellidos,
       pe.email,
       IF(cl.id_persona IS NOT NULL, 'CLIENTE', 'EMPLEADO') AS rol,
       ca.nombre AS cargo,
       tp.numero AS telefono_principal
FROM persona pe
LEFT JOIN cliente cl  ON cl.id_persona = pe.id_persona
LEFT JOIN empleado em ON em.id_persona = pe.id_persona
LEFT JOIN cargo ca    ON ca.id_cargo = em.id_cargo
LEFT JOIN telefono_persona tp
       ON tp.id_persona = pe.id_persona AND tp.es_principal = 1
WHERE pe.primer_nombre LIKE 'S%'
   OR pe.apellidos     LIKE 'S%'
ORDER BY pe.apellidos, pe.primer_nombre;


/*3. Categorias de vehiculos segun su precio de tarifa diaria mayor a 200000*/
SELECT c.id_categoria,
       c.nombre AS categoria,
       c.tarifa_diaria,
       c.deposito_garantia
FROM categoria_vehiculo c
WHERE c.tarifa_diaria > 200000
ORDER BY c.tarifa_diaria ASC;


/* F4. Direccion de sucursales que contenga la palabra Avenida o Calle. */
SELECT s.id_sucursal,
       s.nombre AS sucursal,
       s.ciudad,
       s.direccion,
       s.telefono
FROM sucursal s
WHERE s.direccion LIKE '%Avenida%'
   OR s.direccion LIKE '%Calle%'
ORDER BY s.ciudad;


/5. Personas con email corporativo de alquicoches*/
SELECT pe.id_persona,
       pe.primer_nombre,
       pe.apellidos,
       pe.email,
       pe.fecha_creacion
FROM persona pe
WHERE pe.email LIKE '%@alquicoches.com'
ORDER BY pe.primer_nombre;


/*6. Empleados del area operativa y responsabilidades de su cargo*/
SELECT pe.primer_nombre,
       pe.apellidos,
       ca.nombre AS cargo,
       ca.area_operativa,
       ca.responsabilidades,
       ca.salario_base
FROM empleado em
JOIN persona pe ON pe.id_persona = em.id_persona
JOIN cargo ca   ON ca.id_cargo = em.id_cargo
WHERE ca.responsabilidades LIKE '%vehiculos%'
ORDER BY ca.salario_base DESC;


/*7. Vehiculos con placa y su precio de lista de venta*/
SELECT v.placa,
       v.vin,
       v.marca,
       v.modelo,
       v.anio,
       v.precio_lista_venta,
       v.estado_operativo,
       s.ciudad
FROM vehiculo v
JOIN sucursal s ON s.id_sucursal = v.id_sucursal_actual
WHERE v.placa LIKE 'F%'
   OR v.precio_lista_venta >= 60000000
ORDER BY v.precio_lista_venta DESC;


/*8. Ventas realizadas por precio acordado y meses de garantia*/
SELECT vt.id_operacion,
       pe.primer_nombre AS cliente_nombre,
       pe.apellidos AS cliente_apellidos,
       v.placa,
       v.marca,
       v.modelo,
       vt.precio_acordado,
       vt.meses_garantia,
       vt.fecha_traspaso
FROM venta vt
JOIN operacion o  ON o.id_operacion = vt.id_operacion
JOIN persona pe   ON pe.id_persona = o.id_cliente
JOIN vehiculo v   ON v.vin = o.vin_vehiculo
WHERE vt.precio_acordado > 50000000
ORDER BY vt.precio_acordado DESC;


/*9. Ordenes de mantenimiento con el costo de repuestos y tipo de servicio*/
SELECT om.id_mantenimiento,
       v.placa,
       v.marca,
       om.tipo_mantenimiento,
       om.costo_mano_obra,
       om.costo_repuestos,
       om.descripcion,
       om.estado_orden
FROM orden_mantenimiento om
JOIN vehiculo v ON v.vin = om.vin_vehiculo
WHERE om.costo_repuestos >= 500000
ORDER BY om.costo_repuestos DESC;


/*10. Adicionales del catalogo segun su categoria y tarifa diaria*/
SELECT ca.id_adicional,
       ca.nombre,
       ca.categoria,
       ca.tarifa_diaria,
       ca.descripcion
FROM catalogo_adicional ca
WHERE ca.tarifa_diaria <= 20000
ORDER BY ca.tarifa_diaria ASC;
