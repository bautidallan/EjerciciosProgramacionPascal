program ejercicio4;
var
  palab:string;
  n:integer;
function recurs(palab:string;i:integer):string;
begin
  if i>0 then
    begin
      if i=1 then
            recurs:=palab[1]
        else
          recurs:=palab[i]+recurs(palab,i-1);

    end;
end;
begin
  writeln('Ingrese palabra');
  readln(palab);
  n:=length(palab);
  writeln(recurs(palab,n));
  readln();
end.

