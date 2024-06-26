program Ejercicio11Guia4;
Function Simetria(h,y:real):real;
var aux:real;
begin
    aux:=y/(2*h);
   Simetria:=aux;
end;
Procedure Abertura(x:Real);
begin
   if x>0 then
   writeln('La parabola abre hacia arriba')
   else
   writeln('La parabola abre hacia abajo');
end;
Function Discriminante(d,e,g:real):real;
var
  n:Real;
begin
 n:= sqr(e)-4*d*g;
 Discriminante:=n;
end;
Procedure Raices(n1,n2,n3:real;var x1,x2:real)  ;
begin
 if Discriminante(n1,n2,n3)>0 then {Este llamado vale?O tengo q hacerlo con párametros actuales de la funcion}
 begin
    x1:= (-n2+sqrt(sqr(n2)-4*n1*n3))/2*n1;
    x2:= (-n2-sqrt(sqr(n2)-4*n1*n3))/2*n1 ;
 end
 else
 writeln('No tiene raices reales');
end;
var
  a,b,c:real;
begin
  writeln('Ingrese los 3 valores de a b y c');
  readln(a,b,c);
  writeln(Simetria(a,b));
  Abertura(a);
  readln()
end.

