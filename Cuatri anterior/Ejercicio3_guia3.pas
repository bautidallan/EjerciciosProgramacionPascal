program Ejercicio3_guia3;
var
 x,min,N,i:integer;

begin
  min:=-999;
  writeln('Ingrese N');
  readln(N);
  for i:=1 to N do
  begin
    writeln('Ingrese un numero') ;
    readln(x);
    if x>min then
    begin
    min:=x;
    writeln('Supera al anterior');
    end;
  end;

end.

