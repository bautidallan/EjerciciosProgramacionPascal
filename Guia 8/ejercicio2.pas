program ejercicio2;
var
  t:integer;
function recursiva(t:integer):integer;
begin
  if t=0 then
     recursiva:=0
      else if t MOD 2=0 then
         recursiva:=1+recursiva(t-1)
          else
            recursiva:=recursiva(t-1);
end;
begin
  readln(t);
  writeln(recursiva(t));
  readln()
end.

