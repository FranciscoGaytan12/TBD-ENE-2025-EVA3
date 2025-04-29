delimiter $$

create function suma_numeros(num1 int, num2 int)
returns int deterministic
begin
declare suma int;
set suma = num1 + num2;
return suma;
end$$
delimiter ;