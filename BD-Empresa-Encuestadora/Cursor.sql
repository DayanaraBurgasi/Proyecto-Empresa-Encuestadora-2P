--Un cursor en donde se muestre el nombre de la empresa, el costo del servicio, y el tiempo que duro 	la encuesta en ser realizada (Empresas de la región Costa).


--Consulta
select * from region
select * from cliente where region_id = 1

--Cursor

do $$
declare
        datos record;
        servicio cursor for select * from cliente as t1 
							inner join encuesta as t2 on t1.cliente_id = t2.cliente_id
							inner join factura as t3 on t2.factura_id = t3.factura_id
							inner join region as t4 on t1.region_id = t4.region_id
							where t4.region_nombre like '%Costa%';

begin
for datos in servicio loop
Raise notice 'Nombre de la empresa: %,Costo del servicio :  $ % dolares, Tiempo de duracion de la encuesta: % dias', datos.nom_empresa, 
datos.factura_total, datos.tiempo_duracion;
end loop;
end $$
language 'plpgsql';