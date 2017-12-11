--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de indices para mejorar rendimiento de la base de datos

create unique index producto_folio_ix on producto(lower(folio));
create unique index orden_compra_folio_ix on orden_compra(lower(folio));
create index tarjeta_credito_num_ix on tarjeta_credito(num_tarjeta);
create unique index cliente_username_ix on cliente(lower(username));
create unique index seg_paquete_paquete_id_ix on seguimiento_paquete(paquete_id);
create index seg_paquete_fecha_arrivo_ix on seguimiento_paquete(fecha_arrivo);