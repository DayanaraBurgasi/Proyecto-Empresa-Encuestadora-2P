-- Procedimiento almacenado que ingrese una región y que se muestre las empresas que ha solicitado los servicios de MaxQuestion en esa región y la cantidad de veces que ha solicitado el  servicio .


CREATE or replace  FUNCTION obtenerClientesPorRegion(varchar)	RETURNS varchar
AS $BODY$
DECLARE
	region alias for $1;
	datos RECORD;
	datos_region cursor FOR select t2.nom_empresa as cliente, count(t1.cliente_id)  as numero_solicitado
								from encuesta as t1 
								inner join cliente as t2 on t1.cliente_id = t2.cliente_id
								inner join region as t3 on t2.region_id = t3.region_id
								where t3.region_nombre = $1
								group by cliente order by numero_solicitado asc;		
begin
	for datos in datos_region loop
	Raise notice 'Cliente: %, Servicio solicitado: %', datos.cliente, datos.numero_solicitado;
	end loop;
end; $BODY$
language 'plpgsql';

--Ingreso de Parametros

select obtenerClientesPorRegion('Sierra')
select obtenerClientesPorRegion('Oriente')

