program ejercicio3;
const
  Descuento=0.11;
  Cobertura=0.05;
  sueldo=200;
  var
    sueldoFinal,X:real;
begin
  writeln('Ingrese cant de horas trabajadas');
  readln(X);
  sueldoFinal:=(sueldo*X)-(sueldo*descuento)-(sueldo*Cobertura);
  writeln(sueldoFinal:8:0);
  readln();
end.

