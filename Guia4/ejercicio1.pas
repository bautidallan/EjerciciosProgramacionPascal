program ejercicio1;

  Function esLetra(x:char):boolean;
  begin

     if (x>'a') and (x<'z')then
          esLetra:=true
          else
            esLetra:=false;
  end;
var
  x:char;
begin
  readln(x);
  writeln(esLetra(x));
  readln();
end.

