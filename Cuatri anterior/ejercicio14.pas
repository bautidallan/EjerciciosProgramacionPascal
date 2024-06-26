program ejercicio14;
var
  sum,x:integer;
  bool:boolean;


begin
  bool:=false;
  sum:=0;
  readln(x);
  while (x<>0) OR(sum>100) do
     begin
        sum:=sum+x;
        readln(x);
     end;
      writeln(sum);
      readln();
end.

