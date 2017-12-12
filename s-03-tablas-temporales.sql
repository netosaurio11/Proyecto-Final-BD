--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de tablas de temporales.
create global temporary table producto_temporal(
	producto_temporal_id number(10,0) not null,
	nombre varchar2(40) not null,
	fecha_precio_inicio date default sysdate not null,
	precio_actual number(6,2) not null,
	copias_vendidas number(10,0) not null,
	copias_en_existencia number(10,0) not null,
	url_setreaming varchar2(40) not null,
	num_visualizaciones number(10,0) not null,
	folio varchar2(13) not null,
	nombre_videojuego varchar2(40) null,
	descripcion varchar2(40) null,
	tipo_consola varchar2(40) null,
	nombre_artista varchar2(40) null,
	nombre_album varchar2(40) null,
	disquera varchar2(40) null,
	anio_creacion number(4) null,
	nombre_pelicula varchar2(40) null,
	genero varchar2(20) null,
	duracion number(4,1) null,
	clasificacion varchar2(4) null,
	formato varchar2(20) null,
	constraint producto_temp_pk primary key(producto_temporal_id),
	constraint ptemp_folio_uk unique(folio),
	constraint ptemp_url_uk unique(url_setreaming)
)on commit delete rows;
create global temporary table forma_pago_temporal(
forma_pago_temporal_id number(10,0) not null,
	titular varchar2(40) not null,
	banco varchar2(40) not null,
	num_tarjeta varchar2(20) null,
	tipo_tarjeta varchar2(15) null,
	mes_vencimiento varchar2(2) null,
	anio_vencimiento varchar2(2) null,
	num_seguridad varchar2(3) null,
	CLABE varchar2(20) null,
	constraint fpago_temp_pk primary key(forma_pago_temporal_id),
	constraint fptemp_tarjeta_uk unique(num_tarjeta),
	constraint fptemp_CLABE_uk unique(CLABE)
)on commit delete rows;