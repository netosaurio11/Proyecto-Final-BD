--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 12/12/2017
--@Descripción: Trigger para actualizar los puntos de un cliente
set serveroutput on;
create or replace trigger cliente_trigger
	after insert on factura
	for each row
DECLARE
v_puntos number(3,0);
v_cliente_id number(10,0);
BEGIN
select cliente_id into v_cliente_id
from orden_compra
where orden_compra_id=:NEW.orden_compra_id;

select puntos into v_puntos 
from cliente 
where cliente_id = v_cliente_id;

dbms_output.put_line('v_puntos: ' || v_puntos);
--dbms_output.put_line('v_monto_total: ' || v_monto_total);

if v_puntos >= 20 then
	update factura
	set monto_total = (monto_total * 0.90)
	where orden_compra_id = :NEW.orden_compra_id;

	update cliente
	set puntos = 0
	where cliente_id = v_cliente_id;

else
	update cliente
	set puntos = (v_puntos + 1)
	where cliente_id = v_cliente_id;
end if;
end;
/