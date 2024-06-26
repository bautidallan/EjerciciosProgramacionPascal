program ejercicio19;
var
  arch:text;
  num,max:integer;
begin
  max:=0;
  assign(arch,'ej19.txt');
  reset(arch);
  while not eof(arch) do
      begin
          read(arch,num);
          if num>max then
            max:=num;
          if num<0 then
            begin
            writeln('El max de ese conjunto es ',max);
            max:=0;
            end;
      end;
    readln();
end.

