program ejercicio10_guia3;
var
  arch:text;num,frecuencia,x:integer;


begin
  assign(arch,'tuy.txt');
  reset(arch);
  readln(arch,x);
  frecuencia:=1 ;
  while NOT eof(arch) do
        begin
           readln(arch,num);
           writeln(num);

        end;
  readln();


end.

