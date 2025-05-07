delimiter $$

create function suma_repeat(num int)
returns int deterministic
begin
declare suma int default 0;
declare contador int default 1;




repeat
set suma = suma + contador;
set contador = contador +1;
until contador > num end repeat;
  return suma;
  end$$
  delimiter ;
