delimiter $$
create procedure consultar_clientes()
begin

select * from customer limit 50;

end $$
delimiter ;