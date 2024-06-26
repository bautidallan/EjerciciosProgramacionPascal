program Ejercicio14Guia4;
Procedure Horas(horas,minutos,segundos:real;var seg_final,minutos_final:real);
var
  x:real;
begin
   writeln('Ingrese los segundos transcurridos');
   readln(x);
   seg_final:=segundos+x;
   if seg_final>60 then
    begin
    seg_final:=seg_final-60;
    minutos_final:=minutos+1;
    end;
   writeln('La hora es',horas:4:0,'Los minutos son',minutos_final:4:0,'Los segundos son',seg_final:4:0);
end;
var
  a,b,c,seg_final,minutos_final:real;
begin

  writeln('Ingrese hora minutos y segundos');
  readln(a);
  readln(b);
  readln(c);
  Horas(a,b,c,seg_final,minutos_final);
  readln();
end.

