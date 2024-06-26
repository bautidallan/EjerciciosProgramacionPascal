program Ejercicio4Guia5;
type
  tv=array[1..90] of integer;
  var
    vec3,vec4:tv;
    x,i:integer

begin
  cont:=0
  writeln('Ingrese cant elementos del vector');
  readln(x);

  for i:=1 to x do
  begin
    readln(vec3[i]);
  end;

   for i:=1 to x do
     if vec3[i]=o then
      begin
       cont:=cont+1;
       vec4[cont]:=vec3[i]
      end;

end.

