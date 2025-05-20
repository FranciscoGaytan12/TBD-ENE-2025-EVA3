delimiter $$

create procedure copiar()

begin
declare id_cust int;
declare first_n varchar(50);
declare last_n varchar(50);

declare copiar_C cursor for select customer_id, first_name, last_name from clientes;


declare terminar int default false;

declare continue handler for not found set terminar = true;

open copiar_C;
copiar_customer:loop

fetch copiar_C into id_cust, first_n, last_n;
insert into clientes2 value(id_cust, first_n, last_n);
if terminar then 
leave copiar_customer;
end if;
end loop;
end$$