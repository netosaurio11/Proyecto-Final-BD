--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de vistas para protección de ciertos datos

create or replace view v_orden_compra(
	folio,status_orden,fecha_status,con_envio,con_streaming,username,email
) as select oc.folio,oc.status_orden_id,oc.fecha_status,oc.con_envio,oc.con_streaming,c.username,c.email
from orden_compra oc, cliente c
where c.cliente_id=oc.cliente_id;


create or replace view v_tarjeta(
	tipo_tarjeta,mes_vencimiento,anio_vencimiento, nombre, ap_paterno,ap_materno
) as select tc.tipo_tarjeta,tc.mes_vencimiento,tc.anio_vencimiento,c.nombre,c.ap_paterno,c.ap_materno
from tarjeta_credito tc, cliente c
where c.forma_pago_id = tc.forma_pago_id;