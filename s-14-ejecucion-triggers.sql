--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 13/12/2017
--@Descripción: Ejecución de los triggers
--historico
select * from status_orden_historico;
update orden_compra set status_orden_id=3 where orden_compra_id=10;
select * from status_orden_historico;
--factura
select * from cliente;
update factura set monto_total=150.16 where factura_id=10;
update factura set monto_total=150.16 where factura_id=10;
update factura set monto_total=150.16 where factura_id=10;
update factura set monto_total=150.16 where factura_id=10;
select * from cliente;