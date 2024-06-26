program ejercicio2segunda;
function Recursiva(N:integer):integer;
begin
  if N=0 then
     Recursiva:=1
  else if N mod 2=0 then
     Recursiva:=1+Recursiva(N-1)
     else
       Recursiva:=Recursiva(N-1);
end;
var
  N:integer;
begin
  writeln('Ingrese N');
  readln(N);
  writeln(Recursiva(N));
  readln();
end.

