program ejercicio7;
function Impuesto(importeSinIva:real;monotributo:char):real;
const
  aux
  iva=1.21;
begin
     aux:=importeSinIva*iva;
     if monotributo='R'then
        aux:=aux+aux*0.10 ;
     Impuesto:=aux;
end;
var
  F:char;
  i,n:integer;
begin
  writeln('Ingrese cantidad de meses');
  readln(n);
  writeln('Ingrese tipo de monotributo : M para monotributista, R para responsable inscripto');
  calculaIva(F);
  for i:=1 to N do
  begin

  end;

end.

