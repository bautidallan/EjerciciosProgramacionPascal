program ejercicio3segunda;
function confuso(a,b:integer):integer;
begin
 if (b = 0) then
 confuso := 0
 else
 if (b mod 2 = 0) then
 confuso := confuso(a+a, b div 2)
 else
 confuso := confuso(a+a, b div 2) + a;
end;
var
  a,b:integer;
begin
  writeln('a,b');
  readln(a,b);
  writeln(confuso(a,b));
  readln();
end.

