--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de tablas del caso de estudio.
create table producto (
	producto_id number(10,0) not null,
	nombre varchar2(40) not null,
	fecha_precio_inicio date not null,
	precio_actual number(6,2) not null,
	copias_vendidas number(10,0) not null,
	copias_en_existencia number(10,0) not null,
	url_setreaming varchar2(40) not null,
	num_visualizaciones number(10,0) not null,
	folio varchar2(13) not null,
	tipo_producto char(1) not null,
	constraint producto_pk primary key(producto_id),
	constraint producto_folio_uk unique(folio),
	constraint producto_url_uk unique(url_setreaming),
	constraint producto_tipo_chk check(tipo_producto in('V','P','A'))
);

create table videojuego(
	producto_id number(10,0) not null,
	nombre varchar2(40) not null,
	descripcion varchar2(40) not null,
	tipo_consola varchar2(40) not null,
	constraint videojuego_pk primary key(producto_id),
	constraint prod_videojuego_id_fk foreign key(producto_id) references producto(producto_id)
);
create table album_musical(
	producto_id number(10,0) not null,
	nombre_artista varchar2(40) not null,
	nombre_album varchar2(40) not null,
	disquera varchar2(40) not null,
	anio_creacion number(4) not null,
	constraint album_pk primary key(producto_id),
	constraint prod_album_id_fk foreign key(producto_id) references producto(producto_id)
);
create table pelicula(
	producto_id number(10,0) not null,
	nombre varchar2(40) not null,
	genero varchar2(20) not null,
	duracion number(4,1) not null,
	clasificacion varchar2(4) not null,
	formato varchar2(20) not null,
	constraint pelicula_pk primary key(producto_id),
	constraint prod_pelicula_id_fk foreign key(producto_id) references producto(producto_id)
);
create table forma_pago(
	forma_pago_id number(10,0) not null,
	titular varchar2(40) not null,
	banco varchar2(40) not null,
	tipo_forma_pago char(1) not null,
	constraint forma_pago_pk primary key(forma_pago_id),
	constraint forma_pago_tipo_chk check(tipo_forma_pago in('C','T')) --C=TARJETA_CREDITO T=TRANSFERENCIA
);
create table tarjeta_credito(
	forma_pago_id number(10,0) not null,
	num_tarjeta varchar2(20) not null,
	tipo_tarjeta varchar2(15) not null,
	mes_vencimiento varchar2(2) not null,
	anio_vencimiento varchar2(2) not null,
	num_seguridad varchar2(3) not null,
	constraint tarjeta_pk primary key(forma_pago_id),
	constraint form_pago_tarjeta_id_fk foreign key(forma_pago_id) references forma_pago(forma_pago_id),
	constraint tarjeta_num_tarjeta_uk unique(num_tarjeta)
);
create table transferencia(
	forma_pago_id number(10,0) not null,
	CLABE varchar2(20) not null,
	constraint transf_pk primary key(forma_pago_id),
	constraint form_pago_transf_id_fk foreign key(forma_pago_id) references forma_pago(forma_pago_id),
	constraint transf_CLABE_uk unique(CLABE)
);
create table cliente(
	cliente_id number(10,0) not null,
	nombre varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40) not null,
	telefono number(10,0) not null,
	rfc varchar2(10) null,
	username varchar2(20) not null,
	password varchar2(10) not null,
	forma_pago_id number(10,0) not null,
	constraint cliente_pk primary key(cliente_id),
	constraint fpago_cliente_fk foreign key(forma_pago_id) references forma_pago(forma_pago_id),
	constraint cliente_usrname_ul unique(username)
	);
