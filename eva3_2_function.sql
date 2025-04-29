delimiter $$
create function es_par(num1 int)
returns varchar(20) deterministic
begin
declare residuo int;
declare resu varchar(50);
set residuo = mod(num1, 2);
if residuo =0 then
set resu = "par";
else
set resu ="impar";
end if;
return resu;

end$$
delimiter ;	