program ejercicioClaseEjemplo;
var
  n1,n2,n3,x1,x2:real;
procedure raices(a,b,c:real;var x1,x2:real);
begin
  x1:=(-b+sqrt(sqr(b)-4*a*c))/(2*a);
  x2:=(-b+-sqrt(sqr(b)-4*a*c))/(2*a);


end;
begin
  writeln('Ingrese 3 numeros');
  readln(n1,n2,n3);
  raices(n1,n2,n3,x1,x2);
  writeln(x1:2:0,x2:2:0);
  readln();
end.

