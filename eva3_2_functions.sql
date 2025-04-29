DELIMITER $$
create function comprar_numero (num1 int, num2 int)
returns varchar(10) deterministic

BEGIN
 declare resultado  varchar(50);
 
    IF num1 > num2 then
        SET resultado = "num1 es mayor";
    ELSEIF num1 < num2 then
        SET resultado = "num2 es mayor";
    ELSE
        SET resultado = "Ambos son iguales";
    END IF;
 return resultado;
end$$

   
DELIMITER ;
