delimiter $$

create procedure contar_cleintes(out cont int)

begin
declare id_cl int;
declare terminar int default false;
declare contar_cl cursor for select customer_id from clientes;

declare continue handler for not found



begin
set terminar = true;
end;
open contar_cl;
set cont = 0;
contar: loop
fetch contar_Cl into id_cl;

set  cont = cont + 1;

if terminar then 
leave contar;
end if;
end loop;
end$$


delimiter ;