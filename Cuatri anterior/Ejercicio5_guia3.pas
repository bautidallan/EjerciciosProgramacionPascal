program Ejercicio5_guia3;
     var
       k,q,n,product:integer;
begin
  n:=1 ;
  writeln('Ingrese valor Q');
  readln(q);
  writeln('Ingrese valor K');
  readln(k);
  while product<q do

    begin
       writeln(product);
       product:=k*n;
       n:=n+1;
      { writeln(product); Si pondria el product ahi mostraria un valor de mas}
    end;
    readln();
end.

