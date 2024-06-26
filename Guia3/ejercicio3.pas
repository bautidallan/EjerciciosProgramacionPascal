program ejercicio3;
var
  n,aux,i:integer;
begin
  writeln('Ingrese n numeros enteros');
  readln(n);
  aux:=0 ;
  for i:=1 to n do
  begin
     writeln('Ingrese un numero');
     readln(n);
     if n>aux then
        writeln('supera al anterior')
     else
     writeln('No supera');
     aux:=n;
  end;
  readln();
end.

