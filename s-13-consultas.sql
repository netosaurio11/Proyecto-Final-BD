--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 13/12/2017
--@Descripción: Consultas para verificar datos.
select num_escala,fecha_arrivo,lugar
from seguimiento_paquete
where lugar='Mexico'
union
select num_escala,fecha_arrivo,lugar
from seguimiento_paquete
where lugar='Brazil';
--segunda
select c.*,f.monto_total
 from cliente c
 	join orden_compra oc
 	on oc.cliente_id=c.cliente_id
 	join factura f
 	on f.orden_compra_id=oc.orden_compra_id
 where f.monto_total = (
 	select max(f.monto_total)
 	from factura f
);
--tercera
select c.nombre,c.ap_paterno,c.ap_materno,c.username,c.email,fp.tipo_forma_pago
  from cliente c
  join forma_pago fp
  on c.forma_pago_id=fp.forma_pago_id
  where fp.tipo_forma_pago='T';