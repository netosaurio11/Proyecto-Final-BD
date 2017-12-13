--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 11/12/2017
--@Descripción: Creación de usuarios, roles y asignación de permisos

connect sys/system as sysdba

prompt creando usuario gm_proy_admin

create user gm_proy_admin identified by admin
	quota unlimited on users;

prompt Creando usuario invitado gm_proy_invitado
create user gm_proy_invitado identified by invitado;

--Creando rol --> rol_admin
create role rol_admin;

grant create session, create table, create view, create synonym,create public synonym, create sequence, create trigger, create procedure,create any directory to rol_admin;

--Asignar rol a mved_proy_admin
grant rol_admin to gm_proy_admin;

--Creando rol --> rol_invitado
create role rol_invitado;

grant create session,create synonym to rol_invitado;

prompt Asignar el rol rol_admin a gm_proy_admin

--Asignar el rol a gjc_proy_invitado
grant rol_invitado to gm_proy_invitado;

--Creación del directorio para tablas externas

create or replace directory tmp_dir as '/tmp';

--Creación de permisos al administrador para lectura y escritura
grant read, write on directory tmp_dir to gm_proy_admin;

prompt Listo!
connect gm_proy_admin/admin;;