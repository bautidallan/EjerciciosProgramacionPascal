program ejercicio8;
const
      recargo=0.05;
var
   costo,costoAdicional:real;
   dia,cantDeportes,edad:integer;
   aux:string;
begin
  writeln('Ingrese edad');
  readln(edad);
   if edad>18 then
     costo:=1800
      else if (edad>13) then
        costo:=1200
        else if (edad>5) and (edad<12)then
          costo:=750
          else
            costo:=0;

   writeln('Ingrese cantidad de deportes adicionales');
   readln(cantDeportes);
   writeln('El deporte adicional es pileta?');
   readln(aux) ;
   if aux='Si' then
     costoAdicional:=800
   else
     costoAdicional:=cantDeportes*250;

   costo:=costo+costoAdicional;

   writeln('Que dia pago la cuota?');
   readln(dia);
    if dia>15 then
      costo:=costo*recargo+costo;

    writeln('Usted debe pagar ',costo:4:2);
   readln();

end.

