program ejercicio14;
type
  str=string[7];
  tv=array[1..100]of str;
  tv2=array[1..100]of real;
  const
    x=12000;
var
  prom:real;
  n:byte;
  arch:text;
  vecp:tv;
  veci:tv2;
Procedure Leer(var arch:text;var vecp:tv;var veci:tv2;var n:byte);
begin
  n:=1;
  assign(arch,'ej14.txt');
  reset(arch);
  while not eof(arch) do
    begin
       readln(arch,vecp[n],veci[n]);
       n:=n+1;
    end;
end;
procedure muestra(var vecp:tv;var veci:tv2; n:byte );
var
  i:byte;
begin
  for i:=1 to n-1 do
  writeln(vecp[i],veci[i]:4:2)
end;
Procedure Promedio(veci:tv2;n:byte;var prom:real);
var
  sumacont:real ;
  i:byte;
begin

  for i:=1 to n-1 do
     sumacont:=veci[i]+sumacont;

    prom:=sumacont/(n-1);
    writeln('El promedio es ',prom:4:2)
end;
Procedure Supera(veci:tv2;vecp:tv;n:byte);
var
  i:byte;
begin
   for i:=1 to n-1 do
      begin
         if veci[i]>x then
           writeln('Esta patente supera ',vecp[i]);
      end;

end;
begin
  Leer(arch,vecp,veci,n);
  muestra(vecp,veci,n);
  Promedio(veci,n,prom);
  Supera

  readln();
end.

