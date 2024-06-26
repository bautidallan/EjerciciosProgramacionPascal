program ejercicio6;
var
   cod:char;
   monto,saldo:real;
   contInsuf:integer;
begin
  writeln('Ingrese Tipo de operacion a realizar,(D o R), F es fin de operar');
  readln(cod);
  while (cod <>'F') and (cod<>'f') do  {xq and y no or??}
     begin
     writeln('Ingrese monto') ;
     readln(monto);
     if (cod='D')OR(cod='d') then
        saldo:=saldo+monto
     else
       saldo:=saldo-monto;
     if monto>saldo then
        contInsuf:=contInsuf+1;
     writeln('Ingrese operacion a realizar');
     readln(cod)
     end;
  writeln('Su saldo es de ',saldo);
end.

