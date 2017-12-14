--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 12/12/2017
--@Descripción: Script main que llama a los demas
--connect sys/system as sysdb
@@s-01-usuarios.sql
@@s-02-entidades.sql
@@s-03-tablas-temporales.sql
@@s-04-externas.sql
@@s-05-secuencias.sql
@@s-06-indices.sql
@@s-08-vistas.sql

--CREATE OR REPLACE DIRECTORY FACTURAS AS '/home/oracle/facturas';
CREATE OR REPLACE DIRECTORY FACTURAS AS '/home/netosaurio11/Documentos/facturas';
/
GRANT READ ON DIRECTORY FACTURAS TO PUBLIC;
/

@@s-09-trigger-cliente.sql
@@s-09-trigger-status_ordem_historico.sql
@@s-10-procedimiento-factura.sql
@@s-11-carga-inicial.sql