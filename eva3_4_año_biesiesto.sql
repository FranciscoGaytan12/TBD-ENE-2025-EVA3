DELIMITER $$

CREATE FUNCTION es_bisiesto(año INT)
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(20);

    IF ((MOD(año, 4) = 0 AND MOD(año, 100) <> 0) OR (MOD(año, 400) = 0)) THEN
        SET resultado = 'bisiesto';
    ELSE
        SET resultado = 'no bisiesto';
    END IF;

    RETURN resultado;
END$$

DELIMITER ;
