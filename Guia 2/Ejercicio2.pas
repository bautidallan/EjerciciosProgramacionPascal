program Ejercicio2;
var
  X:char;

begin
  writeln('Ingrese caracter');
  readln(X);
  if (X>='A') AND (X<='Z')then
      writeln('Mayuscula')
     else if (X>='a') AND (X<='z')then
        writeln('Minuscula')
           else
             writeln('Generico');

  readln()
end.

