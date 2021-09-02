--Trigger que impida el ingreso de un cliente que deba dinero a la empresa , si el cliente es deudor (debe lanzar una advertencia y no permitir el ingreso de un cliente  )

--Primero consultamos los clientes con deuda, donde el valor true será la confirmación de que cliente es deudor .

select * from cliente where cliente_deudor = true

--Funcion
create or replace function clienteDeudor() returns trigger
as $clienteDeudor$
    declare
		deudor boolean;
begin
		select cliente_deudor into deudor from cliente where cliente_id = new.cliente_id;
        if(deudor) then
            raise exception 'Este cliente debe dinero a la empresa y no puede volver a solicitar el servicio';
        end if;
        return new;
end;
$clienteDeudor$
language plpgsql;

-- Trigger

create trigger clienteDeudorTrigger before insert 
on encuesta for each row
execute procedure clienteDeudor();

--Inserccion de una encuesta

insert into encuesta values (156, 10, 56, '22/04/2021', '27/06/2021', '100% realizado', 'encuestar','sin observacion');



