program Ejercicio6Guia4;
uses crt ;
function NumeroR(a,b:integer):integer;
var
  i:integer;
begin
  i:=random(b-a);

  NumeroR:=i


end;
var
  a,b:integer;
begin
  writeln('Ingrese el limite del intervalo');
  readln(a,b);
  if a<b then
  writeln(NumeroR(b,a))
  else
  writeln('Limites invalidos');
  readln();
end.

