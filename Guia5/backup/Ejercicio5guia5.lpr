program Ejercicio5guia5;
type
  tv=array[1..50]of integer;
  var
    prom:real;
    max:integer;
    i:byte;
    arch:text;
    vec2,v:tv;
  procedure Lee(var arch:text;var v:tv;var i:byte);
begin
  i:=1;
  assign(arch,'Ej5.txt');
  reset(arch);
 while not eof(arch) do
    begin
    readln(arch,v[i]);
    i:=i+1;
    end
end;
procedure Maximo(v:tv;var max:integer);
var
  j:integer;
begin
 max:=-999;
  for j:=1 to i-1 do
   begin
   if v[j]>max then
    max:=v[j];
   end
end;
Procedure Promedio(max:integer;v:tv;var prom:real);
var
  suma1,suma2:real;
    x:byte;
begin
 suma1:=0;
 suma2:=0;
 for x:=1 to i-1 do
  begin
  if (max mod v[x])=0 then
   begin
   suma1:=suma1+1;
   suma2:=suma2+v[x];

   end;
  end;
  prom:=suma2/suma1;
  writeln('El promedio entre los divisores del maximo es ',prom:4:2);
end;
Procedure vecB(max:integer;v:tv;var vec2:tv);
var
   suma3,x,t:byte;
begin
 suma3:=0 ;
 for x:=1 to i-1 do
  begin
  if (max mod v[x])=0 then
   begin
      suma3:=1+suma3;
      vec2[suma3]:=v[x];
      writeln(vec2[suma3]);
   end;
  {for t:=1 to suma3 do
   writeln(vec2[t]);}

  end;
 end;
begin
 Lee(arch,v,i);
 Maximo(v,max);
 Promedio(max,v,prom);
 vecB(max,v,vec2);
 readln();
end.

