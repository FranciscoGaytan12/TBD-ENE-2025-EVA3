delimiter $$
create procedure consultar_cliente(in id_cliente int)
begin

	select * from customer
	where customer_id = id_cliente;

end $$
delimiter ;