delimiter $$

create function sumatoria(num int)
returns int deterministic
begin
declare suma int default 0;
declare contador int default 1;


ciclo:loop
set suma = suma + contador;
set contador = contador +1;
if contador > num  then 
leave ciclo;   #equivalente al break
end if;
end loop ciclo;
  return suma;
  end$$
  delimiter ;
