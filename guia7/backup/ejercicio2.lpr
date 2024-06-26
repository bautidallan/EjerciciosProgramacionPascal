program ejercicio1;
var
  a,x,n:real ;
Function potencia(x,n:real):real;
begin
      if n=0 then
         potencia:=1
      else if n>0 then
            potencia:=x*potencia(x,n-1)
      else
      potencia:=(1/x*potencia(x,n+1));
end;

begin
  writeln('Ingrese el numero y la potencia');
  readln(x,n);
  a:=potencia(x,n);
  writeln(a:4:0) ;
  readln();
end.
