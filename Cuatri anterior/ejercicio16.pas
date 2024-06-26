program ejercicio16;
var
  patente,m_patente:string[6];
  consumo,km,cant_lit,max_k,max_l,min_l,min_k:real;
  autos,i:integer;

begin
  min_l:=120000;
  min_k:=9000;
  max_k:=-90;
  max_l:=-89;
  writeln('Ingrese cantidad de autos');
  readln(autos);
  for i:=1 to autos do

  begin
  writeln('Ingrese la patente');
  readln(patente);
  writeln('Ingrese km y cantidad de litros');
  readln(km,cant_lit);
  consumo:=cant_lit / km;
  writeln(consumo:8:2);

  if km>max_k then
    begin
       max_k:=km;
       m_patente:=patente ;
     end;
  if km<min_k then
    min_k:=km
    min_l:=cant_lit;

  end;
  writeln('El auto que mas viajes hizo es ',m_patente);
  writeln('El auto que menos consumio es ',min_l:8:2);

  readln();
end.

