program ejercicio3;
function sumaN(N:integer):integer;
var
  i,suma:integer;
begin
  for i:= 1 to N do
    begin
    suma:=i+suma;
    end;
  sumaN:=suma;
end;
var
  X:integer;
begin
  readln(X);
  writeln(sumaN(X));
  readln();
end.

