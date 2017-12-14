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

CREATE SYNONYM producto_sinonimo 
for gm_proy_admin.producto;

CREATE SYNONYM factura_sinonimo
for gm_proy_admin.factura;

CREATE SYNONYM cliente_sinonimo
for gm_proy_admin.cliente;

connect gm_proy_admin/admin;