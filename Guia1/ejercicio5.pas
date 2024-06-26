program ejercicio5;
const
  terreno=300;
var
  sup,N,M:real;
begin
  writeln('Ingrese superficie N y M');
  readln(N,M);
  sup:=N*M/(terreno);
  writeln('Las medidas ingresadas represntan el ',sup:4:2,' del terreno');
  readln();
end.

