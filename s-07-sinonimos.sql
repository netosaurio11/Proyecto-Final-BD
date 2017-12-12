--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de sinonimos

create or replace public synonym forma_pago_sinonimo
for forma_pago;

create or replace public synonym paquete_sinonimo
for paquete;

create or replace public synonym orden_compra_sinonimo
for orden_compra;

grant select on producto to gm_proy_invitado;
grant select on factura to gm_proy_invitado;
grant select on cliente to gm_proy_invitado;

connect gm_proy_invitado / invitado

CREATE SYNONYM gm_proy_admin.producto_sinonimo
for producto;

CREATE SYNONYM gm_proy_admin.factura_sinonimo
for factura;

CREATE SYNONYM gm_proy_admin.cliente_sinonimo
for cliente;

connect gm_proy_admin/admin;