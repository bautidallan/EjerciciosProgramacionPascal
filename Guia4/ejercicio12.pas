program ejercicio12;
{algoritmo de fibonacci}
procedure fibonacci(n:integer);
var
  i,a,b,fibo:integer;
begin
  a:=0;
  b:=1;
  for i:=1 to n do
  begin
      fibo:=a+b;
      a:=b;
      b:=fibo;
  end;
  writeln('El fibonacci es ', fibo);
end;
var
  n:integer;
begin
  readln(n);
  fibonacci(n);
  readln();
end.

