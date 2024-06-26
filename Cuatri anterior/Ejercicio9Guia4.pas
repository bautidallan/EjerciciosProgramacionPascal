program Ejercicio9Guia4;
Function Suma(n1,d1,n2,d2:real):real ;
begin
   Suma:=(n1/d1)+(n2/d2);


end;
var
  n1,d1,n2,d2:real;
  arch:text;

begin
  assign(arch,'comercios.txt');
  reset(arch);
  while not eof do
  begin
  read(arch,n1);
  read(arch,d1);
  read(arch,n2);
  read(arch,d2);
  end;

writeln(Suma(n1,d1,n2,d2));
readln();
end.

