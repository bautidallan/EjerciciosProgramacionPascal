program ejercicio15;
function F(i:integer):real;
begin
     F:=i/4;
end;
procedure calculaSerie(n:integer);
var
  res:real;
  i:integer;
begin
   res:=0;
  for i:=1 to n do
  begin
    res:=res+F(i);
  end;
  writeln('La suma de la serie es ', res:4:2);
end;
var
  n:integer;
begin
   writeln('Ingrese cant de terminos de la serie ');
   readln(n);
   calculaSerie(n);
   readln();
end.

