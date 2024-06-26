program Ej9;
const
  sueldo=8000;
  var

  sueldo_final,monto_ventas,tope_ventas:real;
  faltas:integer;

begin
  writeln('Ingrese monto de ventas');
  readln(monto_ventas);
  sueldo_final:=sueldo+(monto_ventas*0.05);
  writeln('Ingrese tope de ventas');
  readln(tope_ventas);
  if monto_ventas>tope_ventas then
       begin
       sueldo_final:=sueldo_final+(sueldo*0.03)
       end;
 if 1000>monto_ventas*0.02 then
    sueldo_final:=sueldo_final+1000
 else
   sueldo_final:=sueldo_final+monto_ventas*0.02 ;
 writeln('Ingrese la cant d faltas');
 readln(faltas);
 if faltas>2 then
        sueldo_final:=sueldo_final-sueldo_final*0.07 ;
 writeln(sueldo_final)  ;




end.

