program radares;
const
  MaxElement=50;
type
  str7=string[7];
  str3=string[3];
  tvPatentes=array[1..maxElement]of str7;
  tv=array[1..maxElement]of integer;
  tvZonas=array[1..MaxElement]of str3;
  tvReal=array[1..maxElement]of real;
procedure leeArchivo(var vecZonas:TvZonas;var vecFactor:tvReal;var M:integer);
var
  arch:text;
begin
  M:=0;
  assign(arch,'zonas.txt');
  reset(arch);
  while not eof(arch)do
    begin
       M:=M+1;
       readln(arch,vecZonas[M],vecFactor[M]);
    end;
  close(arch);
end;
function Busca(zonaAux:str3;vecZonas:tvZonas):integer;
var
  i:integer;
begin
  i:=1;
   while zonaAux<>vecZonas[i] do
     begin
        i:=i+1;
     end;
    busca:=i;
end;
function esMulta(velocidad:real;tipo:integer):boolean;
begin
     case tipo of
     1: if velocidad>100 then
         esMulta:=true
         else
           esMulta:=false;

     2:   if velocidad>110 then
         esMulta:=true
         else
           esMulta:=false;
     3:if velocidad>90 then
         esMulta:=true
         else
           esMulta:=false;

     end;
end;
procedure generarInfracciones(var vecZonaMulta:tvZonas;var vecVelocidad:tvReal;var vecTipos:tv;var vecPatente:tvPatentes;var N:integer;var noInfraccion:integer);
var
  hagoMulta:boolean;
  b:char;
  tipo:integer;
  velocidad:Real;
  zona:str3;
  patente:str7;
  arch:text;
begin
     noInfraccion:=0;
     N:=0;
     assign(arch,'radar.txt');
     reset(arch);
     while not eof (arch)do
       begin
          readln(arch,tipo,velocidad,b,zona,b,patente);
          hagoMulta:=esMulta(velocidad,tipo);
          if hagoMulta then
              begin
                N:=N+1;
                vecZonaMulta[N]:=zona;
                vecVelocidad[N]:=velocidad;
                vecTipos[N]:=tipo;
                vecPatente[N]:=patente;
              end
          else
            noInfraccion:=noInfraccion+1;
       end;
      close(arch);
end;
function importe(tipo:integer):real;
begin
    case tipo of
     1:  importe:=1000;
     2:  importe:=2000;
     3: importe:= 5000;
     else
       importe:=20;

     end;
end;
procedure generaImportes(N,M:integer;var ImporteMultas:TvReal;vecZonaMulta,vecZonas:TvZonas;vecFactor:tvReal;vecTipos:Tv;Var maxMultas:TvReal;var maxPatentes:tvPatentes;vecPatente:tvPatentes);
var
  patente:Str7;
  zonaAux:str3;
  tipo,pos,i:integer;
begin

     for i:=1 to M do
       maxMultas[i]:=0;

     for i:=1 to N do
       begin
          ImporteMultas[i]:=0;
          zonaAux:=vecZonaMulta[i];
          tipo:=vecTipos[i];
          patente:=vecPatente[i];
          pos:=busca(zonaAux,vecZonas);
          ImporteMultas[i]:=importe(tipo)*vecFactor[pos];

          if ImporteMultas[i]>maxMultas[pos] then
              begin
               maxMultas[pos]:=importeMultas[i];
               maxPatentes[pos]:=patente;
              end;
       end;

     for i:=1 to M do
       begin
        writeln(maxPatentes[i]);
       end;
end;
procedure buscaZona(vecZonaMulta:tvZonas;N:integer);
var
  cont,i:integer;
  zona:str3;
begin
    cont:=0;
    writeln('Ingrese zona buscada');
    readln(zona);
    for i:=1 to N do
      begin
       if zona=vecZonaMulta[i] then
           cont:=cont+1;
      end;
   writeln('Para la zona ',zona,' hubo ',cont,' multas')
end;

var
  M,N,noInfraccion:integer;
  vecZonas:tvZonas;
  vecFactor:tvReal;
  vecVelocidad,ImporteMultas,maxMultas:tvReal;
  vecZonaMulta:tvZonas;
  vecTipos:tv;
  vecPatente,maxPatentes:tvPatentes;
begin
   {Lectura de archivos}
   leeArchivo(vecZonas,vecFactor,M);
   generarInfracciones(vecZonaMulta,vecVelocidad,vecTipos,vecPatente,N,noInfraccion);

   {------------------Insiso A---------------------------------}
      {Muestro cuantas no son infracciones}
   writeln(Noinfraccion ,' datos no son  infraccion') ;

  {-------------------Insiso B---------------------------------}
   generaImportes(N,M,ImporteMultas,vecZonaMulta,vecZonas,vecFactor,vecTipos,maxMultas,maxPatentes,vecPatente);

   {------------------Insiso C----------------------------------}
   buscaZona(vecZonaMulta,N);
   readln();
end.

