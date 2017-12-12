--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de tablas externas.
create table empresa_paquetera_ext(
	empresa_paquetera_id number(10,0),
	nombre varchar2(40),
	fecha_registro date,
	zona char(1)
)
organization external (
	type oracle_loader
	default directory tmp_dir
		access parameters (
		records delimited by newline
		badfile tmp_dir:'empresa_paquetera_ext_bad.log'
		logfile tmp_dir:'empresa_paquetera_ext.log'
		fields terminated by ','
		missing field values are null
		(
			empresa_paquetera_id, nombre,fecha_registro date mask "dd/mm/yyyy",zona
		)
	)
	location ('empresa_paquetera_ext.txt')
)
reject limit unlimited;