program ejercicio1_guia3;
     var
      posicion,i,x,N,max:integer;


begin
  max:=-999;
  writeln('Ingrese limite');
  readln(N);
  for i:=1 to N do
  begin
    writeln('Ingrese un numero');
    readln(x) ;
    if x>max then
      begin
         max:=x;
         posicion:=i;
      end;
 end;
  writeln(max);
end.

