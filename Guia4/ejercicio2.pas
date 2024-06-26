program ejercicio2;

function factorial(N:integer):integer;
var
  i,suma:integer;
  begin
      suma:=1;
      for i:=1 to N do
        begin
          suma:=i*suma
        end ;

 factorial:=suma;


end;
var
      n:integer;
begin
  readln(n);
  writeln(factorial(n));
  readln();

end.

