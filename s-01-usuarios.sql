--@Autor(es): Mejia Valdiviezo Ernesto Daniel, Godoy Juarez Carlos
--@Fecha de creación: 04/11/2017
--@Descripción: Creación de usuarios, roles y asignación de permisos

connect sys/system as sysdba

prompt creando usuario gm_proy_admin

create user gm_proy_admin identified by admin
	quota unlimited on users;

prompt Creando usuario invitado gm_proy_invitado
create user gm_proy_invitado identified by invitado;

grant create session, create table, create view, create synonym, create sequence, create trigger, create procedure to gm_proy_admin;
grant create session to gm_proy_invitado;

prompt Asignar el rol rol_admin a gm_proy_admin

--Creando rol --> rol_admin
create role rol_admin;

--Asignar rol a mved_proy_admin
grant rol_admin gm_proy_admin;

--Creando rol --> rol_invitado
create role rol_invitado;

--Asignar el rol a gjc_proy_invitado
grant rol_invitado gm_proy_invitado;

prompt Listo!
exit;