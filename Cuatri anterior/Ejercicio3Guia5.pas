program Ejercicio3Guia5;
const
  k=3;
  type
  tv=array [1..30] of integer ;
  var
   vec2:tv;
   i,x:integer  ;
begin
  writeln('Ingrese cant elementos del vector');
  readln(x);
  for i:=1 to x do
    begin
     readln(vec2[i]);
    end;
  for i:=1 to x do
    begin
      if vec2[i]=k then
        vec2[i]:=0;
    end;
readln();
end.

