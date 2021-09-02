
--Reporte de los resultados de las encuestas  que se realizaron para una empresa en cuestion.

select t1.encuesta_id as encuesta, t2.nom_empresa as empresa, t2.ruc_empresa as ruc_empresa,t2.area as area_empresa,
t2.direccion_empresa as direccion , t1.proposito_descp as proposito_encuesta,sum(t3.cantidad_encuestados) || ' ' || trim('encuestados') as poblacion,
t1.resultados as resultados,t1.observacion_descp as observacion ,t1.tiempo_duracion || ' ' || trim('dias') as tiempo_duracion,
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join encuesta_poblacion as t3 on t1.encuesta_id = t3.encuesta_id
inner join grupo_poblacion as t4 on t3.poblacion_id = t4.poblacion_id
where t1.encuesta_id = '8'
group by encuesta,empresa,ruc_empresa,area_empresa,direccion,proposito_encuesta, resultados,tiempo_duracion;
