program Ejercicio12;
var
  dia:integer;
begin
  writeln('Ingrese el dia');
  readln(dia);

  case dia of
  1,8,15,22,29:writeln('lunes');
  2,9,16,23,30: writeln('Martes');
  3,10,17,24,31:writeln('Miercoles');
  4,11,18,25:writeln('Jueves');
  5,12,19,26:writeln('Viernes');
  6,13,20,27:writeln('Sabados');
  7,14,21,28:writeln('Domingos');
  else
    writeln('Flasheaste capo');


  end;
    readln();
end.

