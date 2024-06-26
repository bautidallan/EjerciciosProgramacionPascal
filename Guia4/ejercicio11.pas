program ejercicio11;

function ejeSimetria(a,b:real):real;
begin
    if a<>0 then
     ejeSimetria:=b/2*a
     else
       ejeSimetria:=0;
end;
function abertura(a:Real):string;
begin
    if a>0 then
     abertura:='arriba'
     else
       abertura:='abajo';
end;
function discriminante(a,b,c:Real):Real;
begin
    discriminante:=sqr(b)-4*a*c;
end;
procedure raices(a,b,c:Real;var x1,x2:Real);
begin
    if discriminante(a,b,c)>0 then
      begin
        x1:=(-b+sqrt(discriminante(a,b,c)))/2*a;
        x2:=(-b-sqrt(discriminante(a,b,c)))/2*a;
      end
    else if discriminante(a,b,c)=0 then
        x1:=(-b+sqrt(discriminante(a,b,c)))/2*a
    else
     writeln('El polinomio no tiene raices reales');

    writeln('Las raices son ',x1:2:0,' ',x2:2:0);
end;
procedure menuParabola(a,b,c:real);
var
  x1,x2:Real;
  rta:byte;
begin
  writeln('Ingrese que quiere hacer,1 calcula eje de simetria,2 indica la abertura,3 indica raices');
  readln(rta);
  case rta of
  1:writeln('El eje de simetria es ',ejeSimetria(a,b):2:0);
  2:writeln('La parabola se abre hacia ',abertura(a));
  3:raices(a,b,c,x1,x2);
  end;

  end;
var
  a,b,c:real;

begin
   writeln('Ingrese valores de a ,b y c');
   readln(a,b,c);
   menuParabola(a,b,c);
   readln();
end.

