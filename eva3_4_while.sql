delimiter $$

create function sumas(num int)
returns int deterministic
begin
declare suma int default 0;
declare contador int default 1;


while contador <= num do
set suma = suma + contador;
set contador = contador +1;
end while;

  return suma;
  end$$
  delimiter ;
