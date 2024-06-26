 program Ej1Guia4;
function caracter(x:char):boolean;
begin
  if (x>'a') AND (x<'z') then
  caracter:=true;

end;
var n:char;


begin
  writeln('Ingrese un caracter');
  readln(n) ;
  if caracter(n) then
   writeln('Es letra')
  else
  writeln('No es letra');
  readln();
end.

