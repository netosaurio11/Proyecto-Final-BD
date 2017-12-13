--@Autor(es): Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 11/12/2017
--@Descripción: Procedimiento que crea archivos txt por factura

--CREATE OR REPLACE DIRECTORY facturas AS '/home/oracle/Documeto_charturas';
CREATE OR REPLACE DIRECTORY facturas AS '/home/netosaurio11/Documentos/facturas';
GRANT READ ON DIRECTORY facturas TO PUBLIC; 

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
l_file := UTL_FILE.FOPEN('facturas', v_folio_factura||'-factura.txt' , 'W');
open cur_factura;
loop
	fetch cur_factura into v_monto_total, v_fecha_factura, v_iva;
	if  v_monto_total is not NULL then
		UTL_FILE.PUT_LINE(l_file, 'Folio: '||to_char(v_folio_factura));
		UTL_FILE.PUT_LINE(l_file, 'Fecha: '||to_char(v_fecha_factura,'dd/mm/yyyy'));
		UTL_FILE.PUT_LINE(l_file, 'Monto: '||to_char(v_monto_total));
		UTL_FILE.PUT_LINE(l_file, 'IVA: '||to_char(v_iva));
		UTL_FILE.PUT_LINE(l_file, 'Total: '||to_char(v_monto_total + v_iva));
	end if;
	exit when cur_factura %NOTFOUND;
end loop;
close cur_factura;
UTL_FILE.FCLOSE(l_file);
commit;
end;
/