--1. Mostrar 'Hola mundo' por pantalla.
begin
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
end;

--2. Declarar una variable numerica y mostrar si es mayor de 10 o no.
declare
    numero number(8) := 12;
begin
    if (numero > 10) then
        DBMS_OUTPUT.PUT_LINE('Mi número es mayor que 10');
    else
        DBMS_OUTPUT.PUT_LINE('Mi número es menor que 10');
    end if;
end;

--3. Declarar una variable numerica y pedir su valor y mostrarlo.
declare
    numero number(8) := &numero; --'&' pide un número
begin
    DBMS_OUTPUT.PUT_LINE('El valor introducido es: ' || numero); --'||' concatena
end;