delimiter $$
create procedure contar_clientes(out cant_clientes int)
begin

	select count(*) into cant_clientes from customer;

end $$
delimiter ;