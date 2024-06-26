program Ejercicio6_guia3;
var
  saldo_inicial,cant_movimiento:real;
  accion:char;


begin
  writeln('Ingrese saldo inicial');
  readln(saldo_inicial);
  writeln('Ingrsese accion a ejecutar, F finaliza , D deposita, R retira');
  readln(accion);
  while accion<>'F' do
    begin
  if accion='D'then
    begin
      writeln('Cuanto desea ingresar?') ;
      readln(cant_movimiento);
      saldo_inicial:=saldo_inicial+cant_movimiento ;
    end;
  if accion='R'then
    begin
      writeln('Cuanto desea retirar?') ;
      readln(cant_movimiento);
      saldo_inicial:=saldo_inicial-cant_movimiento ;
    end;
  writeln(saldo_inicial:8:2);
       writeln('Desea hacer otra accion?');
       readln(accion);
       end;
    readln();
end.

