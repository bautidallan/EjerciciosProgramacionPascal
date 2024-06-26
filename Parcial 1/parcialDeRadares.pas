program parcialDeRadares;
const
  MAX=50;
  type
  str3=string[3];
  str7=string[7];
  tvPat=array[1..MAX]of str7;
  tvTipo=array[1..MAX]of byte;
  tvVelo=array[1..MAX]of real;
  tvZonas=array[1..MAX]of str3;
procedure leeZonas(var zonas:tvZonas; var factor:tvVelo;var indice:byte);
var
  arch:text;
begin
  assign(arch,'zonas.txt');
  reset(arch);
  indice:=1;
  while not eof(arch) do
    begin
       read(arch,zonas[indice],factor[indice]);
       readln(arch);
       indice:=indice+1;
    end;
  close(arch);
end;
function esMulta(tipo:byte;velocidad:real):boolean;
begin
    case tipo of
    1: if velocidad>100 then
          esMulta:=true
          else
            esMulta:=false;
    2: if velocidad>110 then
          esMulta:=true
          else
            esMulta:=false;
    3:if velocidad>90 then
          esMulta:=true
          else
            esMulta:=false;
    end;
end;
function costo(Zonas:tvZonas;factor:tvVelo;zona:str3;tipo:byte):real;
var
  i:integer;
begin
  i:=1 ;
  while (zona<>zonas[i])do
    i:=i+1;

  case tipo of
  1:costo:=1000*factor[i];
  2:costo:=2000*factor[i];
  3:costo:=5000*factor[i];
  end;
end;
procedure leeInfracciones(var vecTipos:tvTipo;var vecMultas:tvVelo;var vecZonas:tvZonas;var patentes:tvPat;var N:integer;zonas:tvZonas;factor:tvVelo);
var
  noInfraccion:integer;
  velocidad:real;
  zona:str3;
  pat:str7;
  tipo:byte;
  b:char;
  arch:text;
begin
  assign(arch,'radar.txt');
  reset(arch);
  N:=0;
  noInfraccion:=0;
  while not eof(arch) do
    begin
      readln(arch,tipo,velocidad,b,zona,b,pat);
      if esMulta(tipo,velocidad) then
         begin
           N:=N+1;
           vecTipos[N]:=tipo;
           vecZonas[N]:=zona;
           patentes[N]:=pat;
           vecMultas[N]:=costo(zonas,factor,zona,tipo);
         end
      else
        noInfraccion:=noInfraccion+1;
    end;
  close(arch);
  writeln('La cantidad de lecturas que no fueron infraccion fueron : ',noInfraccion);
end;
function buscaZona(zona:str3;zonas:tvZonas):byte;
var
  i:byte;
begin
     i:=1 ;
  while (zona<>zonas[i])do
     i:=i+1;

  buscaZona:=i;
end;
procedure insisoB(vecZonas,zonas:tvZonas;vecMultas:tvVelo;patentes:tvPat;var maxMultaPatente:tvPat;var maxMultas:tvVelo;var pos:byte;N:byte);
var
  zona:Str3;
  i,j,M:byte;
begin
    pos:=0;
    M:=0;
    for i:=1 to N do
     begin

        zona:=vecZonas[i];
        M:=buscaZona(zona,zonas);

        if M>=pos  then        //Linea de codigo para obtener la dimension logica del array
           pos:=M;

        if maxMultas[M]=0 then             //Si no existe valor para esa zona lo asigno
          begin
             maxMultas[M]:=vecMultas[i];
             maxMultaPatente[M]:=patentes[i];
          end
        else if vecMultas[i]>maxMultas[M] then   //Si existe valor, comparo si es mayor que lo que hay
          begin
              maxMultas[M]:=vecMultas[i] ;
             maxMultaPatente[M]:=patentes[i];
          end;

     end;

   for j:=1 to pos do
    writeln('La multa de mayor valor para la zona ',j,'es :',maxMultas[j]:4:2,' de la patente ',maxMultaPatente[j]);

end;
function esta(x:Str3;zonas:tvZonas;indice:byte):boolean;
var
  i:byte;
begin
  i:=1;
  while (i<indice) and(x<>zonas[i])do
      i:=i+1;
  esta:=zonas[i]=X;

end;
procedure insisoC(vecZonas,zonas:tvZonas;N:integer;indice:byte);
var
  existe:boolean;
  x:Str3;
  i,cont:byte;
begin
  cont:=0;
  writeln('Ingrese zona que quiere saber la cantidad de infracciones ,recuerde que son cadenas de 3');
  readln(x);
  existe:=esta(x,zonas,indice);//LLamo a funcion de busqueda para verificar que exista, si no existe no recorro el array
  if existe then
    begin
        for i:=1 to N do
         begin
            if x=vecZonas[i] then
              cont:=cont+1;
         end;
       writeln('La zona buscada tuvo ',cont,' multas');
    end
  else
     writeln('La zona ingresada no es valida');
end;
var
  vecTipos:tvTipo;
  vecVelocidad,factor,vecMultas,maxMultas:tvVelo;
  vecZonas,Zonas:tvZonas;
  maxMultaPatente,patentes:tvPat;
  N:integer;
  indice,pos:byte;
begin
  leeZonas(zonas,factor,indice);
  leeInfracciones(vecTipos,vecMultas,vecZonas,patentes,N,zonas,factor);

  //Insiso B
  insisoB(vecZonas,zonas,vecMultas,patentes,maxMultaPatente,maxMultas,pos,N);

  //Insiso C
  insisoC(vecZonas,zonas,N,indice);

  readln();
end.

