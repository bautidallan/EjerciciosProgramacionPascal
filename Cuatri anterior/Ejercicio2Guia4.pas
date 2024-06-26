program Ejercicio2Guia4;
type
  tv=array[1..50]of integer;
  var
    v,w:tv;
    i,x,cont_p,cont_i:integer;
    arch:text;
begin
  cont_p:=0 ;
  cont_i:=0;
  assign(arch,'ej2guia4.txt');
  reset(arch);
  while not eof(arch) do
    begin
      read(arch,x);
      if x MOD 2=0 then
         begin
          cont_p:=cont_p+1;
          v[cont_p]:=x ;
        end
      else
      begin
       cont_i:=cont_i+1;
        w[cont_i]:=x;
      end;
   end;
  for i:=1 to 10 do
  writeln(v[i]);

  readln();
end.
