program Ejercicio3Guia4;
function SumaN(N:integer):integer;
var i,aux:integer;
begin
  aux:=0 ;
  for i:=N to 10 do
   aux:=aux+i;
  SumaN:=aux;
end;
var
  m:integer;


begin
writeln('Ingrese numero <10');
readln(m);
writeln(SumaN(m));
readln();
end.

