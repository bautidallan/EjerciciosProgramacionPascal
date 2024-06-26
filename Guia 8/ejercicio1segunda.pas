program ejercicio1segunda;
function potencia(N,X:integer):integer;
begin
  if N=0 then
     potencia:=1
  else
    Potencia:=X*potencia(N-1,X);
end;
var
  X,N:integer;
begin
  writeln('Ingrese N y X');
  readln(N,X);
  writeln(potencia(N,X));
  readln();
end.

