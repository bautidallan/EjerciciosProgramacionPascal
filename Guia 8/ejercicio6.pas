program ejercicio6;
type
  tv=array[1..50]of integer;
var
  V:tv;
  X,i,n:integer;
function busqueda(V:tv;X,n:integer):integer;
begin
    if n>0 then
       if v[n]=X then
        busqueda:=n
         else
           busqueda:=busqueda(V,X,n-1)
    else
       busqueda:=0;

end;
begin
  writeln('Ingrese n y luego las componentes');
  readln(n);
  for i:=1 to n do      //Armo vector
      readln(V[i]);
  writeln('Ingrese X');
  readln(X);
  writeln(busqueda(V,X,n));
  readln();
end.

