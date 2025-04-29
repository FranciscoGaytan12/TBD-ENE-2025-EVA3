create function hola(mensaje char(50))
returns char(100) deterministic
return  concat("HOLA", mensaje);