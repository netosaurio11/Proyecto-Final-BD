--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 12/12/2017
--@Descripción: Procedimiento que crea archivos txt por factura

--CREATE OR REPLACE DIRECTORY facturas AS '/home/oracle/Documeto_charturas';
--CREATE OR REPLACE DIRECTORY facturas AS '/home/netosaurio11/Documentos/facturas';
--GRANT READ ON DIRECTORY facturas TO PUBLIC; 

create or replace procedure creaFactura(
	v_folio_factura in varchar2
)
as
l_file utl_file.file_type;
v_monto_total factura.monto_total%TYPE; 
v_fecha_factura factura.fecha_factura%TYPE;
v_iva factura.iva%TYPE;

cursor cur_factura is select monto_total, fecha_factura, iva
					  from factura
					  where folio_factura = v_folio_factura;
begin
l_file := UTL_FILE.FOPEN('FACTURAS', v_folio_factura||'-factura.txt' , 'W');
open cur_factura;
	fetch cur_factura into v_monto_total, v_fecha_factura, v_iva;
	if  v_monto_total is not NULL then
		UTL_FILE.PUT_LINE(l_file, 'Folio: '||v_folio_factura);
		UTL_FILE.PUT_LINE(l_file, 'Fecha: '||TO_CHAR(v_fecha_factura));
		UTL_FILE.PUT_LINE(l_file, 'Monto: '||TO_CHAR(v_monto_total));
		UTL_FILE.PUT_LINE(l_file, 'IVA: '||TO_CHAR(v_iva));
		UTL_FILE.PUT_LINE(l_file, 'Total: '||TO_CHAR(v_monto_total - v_iva));
	end if;

close cur_factura;
UTL_FILE.FCLOSE(l_file);
commit;
end;
/