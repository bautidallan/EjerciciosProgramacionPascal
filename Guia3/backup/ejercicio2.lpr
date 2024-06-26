program ejercicio2;
const
  cargas=0.11;
  seguro=500;
  basico=15000;
var
   nombre,maxNombre:string;
   acumu,promedio,maxSueldo,sueldo:Real;
   i:byte;
   n,cont,antiguedad:integer;
begin
  acumu:=0;
  maxSueldo:=-99;
  cont:=0;
  writeln('Ingrese cant de empleados');
  readln(N);
  for i:=1 to N do
   begin
    writeln('Ingrese nombre y antiguedad');
    readln(nombre,antiguedad);
    if antiguedad<=5 then
        sueldo:=basico+sueldo*0.05
    else if (antiguedad>=6) and (antiguedad<=10) then
        sueldo:=basico+sueldo*0.08
    else if (antiguedad>=11)and(antiguedad<=15)then
        sueldo:=basico+sueldo*0.15;

      sueldo:=sueldo-(sueldo*cargas)-seguro;
      cont:=cont+1;
      acumu:=acumu+sueldo;
      writeln(nombre,sueldo:4:2);

      if sueldo>maxSueldo then
         maxNombre:=nombre;
       end;

  promedio:=acumu/cont;
  writeln('El empleado q mas cobra es ',maxNombre, 'y el promedio de sueldo es ',promedio:4:2);
  readln();

end.

