program ejercicio14;
{
Bool:=false ;
Sum:=0;
Readln( x );
If x <>0 then
 Repeat
 Sum := Sum + x;
 If Sum > 100 then
 Bool :=true;
 Readln( x );
 Until ( x=0) or Bool;
 Writeln(‘Resultado’, Sum );}
var
  bool:boolean;
  x,sum:integer;

begin
  bool:=false;
  sum:=0;
  writeln('Ingrese un numero x o 0 para no cargar datos');
  readln(x);
  while (x<>0)and(bool<>true) do
    begin
    sum:=sum+x;
    if sum>100 then
       bool:=true;
    readln(x);
    end;

    writeln('La suma es ',sum);
    readln();
end.

