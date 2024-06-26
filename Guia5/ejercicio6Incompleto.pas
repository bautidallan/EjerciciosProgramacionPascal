program ejercicio6Incompleto;
type
  tvS=array[1..100]of string;

procedure leeFrase(var arrayPalabras:tvS;var n:integer);
var
  aux,frase:string;
  i:integer;
begin
 writeln('Ingrese una frase');
 readln(frase);
 for i:=1 to length(frase) do
   begin
      if frase[i]<>'' then
       aux:=aux+frase[i];
       else
         begin
           n:=n+1;
           arrayPalabras[n]:=aux;
         end;
   end;
end;
var
  arrayPalabras:tvS;
  n:integer;
begin
end.

