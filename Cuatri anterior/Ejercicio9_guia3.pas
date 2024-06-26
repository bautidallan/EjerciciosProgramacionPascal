program Ejercicio9_guia3;
var
  arch:text;
  num,x:integer;
  cond:boolean;

begin
  assign(arch,'num.txt');
  reset(arch);
  read(arch,x);
  cond:=false;
  while NOT eof(arch) do
begin
    readln(arch,num);
    if num>x then
       cond:=true ;
end;
  close(arch);
  if cond=true then
     writeln('Estan ordenados en forma ascendente')
  else
     writeln('No estan ordenados en forma ascendente')     ;

  readln();

end.

