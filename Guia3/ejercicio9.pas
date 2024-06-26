program ejercicio9;
var
  arch:text;
  n,aux:integer;
begin
  aux:=0;
  assign(arch,'ascendente2.txt');
  reset(arch);
  while not eof(arch) do
  begin
     readln(arch,n);
     if n>aux then
        aux:=n;
  end;

  if aux=n then
     writeln('estan ordenados de forma ascendente')
     else
       writeln('No estan ordenados de forma ascendente');
  close(arch);
  readln();
end.

