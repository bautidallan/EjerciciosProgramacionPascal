program Ejercicio9;
const
  basico=8000;
  var
    sueldo,montoVendido, X:real;
    diasFaltados:integer;
    presentismo:string;
begin
  writeln('Ingrese el monto X a superar');
  readln(X);
  writeln('Ingrese cuanto vendio');
  readln(montoVendido);
  sueldo:=basico+montoVendido*0.05+sueldo;

  if montoVendido>X then
     sueldo:=sueldo+basico*0.03;
  writeln('Estuvo presente?');
  readln(Presentismo);
  if 1000>montoVendido*0.02 then
     sueldo:=sueldo+1000
     else
       sueldo:=sueldo+montoVendido*0.02;

  writeln('Cuantos dias falto?');
  readln(diasFaltados);
  if diasFaltados>2 then
     sueldo:=sueldo-sueldo*0.07;

  writeln('Te vamos a pagar ',sueldo:4:2);
  readln();



end.

