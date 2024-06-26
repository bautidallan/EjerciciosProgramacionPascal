program ejercicio16;
var
  N,maxViajes,viajes:integer;
  i:byte;
  patente,maxPatente:string[6];
  combustible,km,kmRecorridos,consumo,menorKm,menorConsumo:real;
begin
  menorKm:=200000000000;
  maxViajes:= -99;
  writeln('Ingrese cantidad de vehiculos');
  readln(N);
  for i:=1 to N do
  begin
       kmRecorridos:=0;
       viajes:=0;

        writeln('Ingrese patente');
        readln(patente);
        writeln('Cantidad de litros consumidos');
        readln(combustible);
        writeln('Ingrese km,recuerde que 0 indica fin de datos');
        readln(km);

    while km<>0 do
        begin
          kmRecorridos:=km+kmRecorridos;
          readln(km);
          viajes:=viajes+1;
        end;

    {insiso A}
    consumo:=kmRecorridos/combustible;
    writeln('Consumio :',consumo:4:2,'L');

    {insiso b}
    if viajes>maxViajes then
        begin
          maxViajes:=viajes;
          maxPatente:=patente;
        end;

    {insiso C}
      if kmRecorridos<menorKm then
          begin
          menorConsumo:=consumo;
          menorKm:=kmRecorridos
          end;
  end;
  {insiso b}
  writeln('El que mas viajo es ',maxPatente);
  {/---------------------/}

  {insiso c}
  writeln('El que menos km hizo consumio',menorConsumo:4:2);

  readln();
end.

