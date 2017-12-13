--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de secuencias necesarias para poder insertar registros.
create sequence cliente_seq--
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;
create sequence direccion_seq--
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;
create sequence precio_producto_seq
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;
create sequence orden_compra_seq
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;
create sequence status_orden_seq
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;
create sequence status_orden_historico_seq
	start with 1
	increment by 1
	nomaxvalue
	nominvalue
	nocycle;