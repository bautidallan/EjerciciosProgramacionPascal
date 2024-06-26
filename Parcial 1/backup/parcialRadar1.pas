program parcialRadar1;
const
  MaxElement=50;
type
  str7=string[7];
  str3=string[3];
  tvPatentes=array[1..maxElement]of str7;
  tv=array[1..maxElement]of integer;
  tvZonas=array[1..MaxElement]of str3;
  tvReal=array[1..maxElement]of real;
  tvVelocidad=array[1..maxElement]of integer;
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
function esMulta(velocidad:real;tipo:integer):boolean;
begin
     case tipo of
     1: begin
        if velocidad>100 then
         esMulta:=true
         else
           esMulta:=false;
         end;
     2: begin
          if velocidad>110 then
            esMulta:=true
           else
             esMulta:=false;
        end;
     3:begin
       if velocidad>90 then
         esMulta:=true
         else
           esMulta:=false;
       end;
     end;

end;
procedure generarInfracciones(var vecZonaMulta:tvZonas;var vecVelocidad:tvReal;vecTipos:tv;var vecPatente:tvPatentes;var N:integer;Var noInfraccion:integer);
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
          readln(arch,tipo,velocidad,b,zona,patente);
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

     {Muestro cuantas no son infracciones}

      writeln(noInfraccion,' datos no fueron infraccion') ;
     close(arch);
end;
var
  M,N,noInfraccion:integer;
  vecZonas:tvZonas;
  vecFactor:tvReal;
  vecVelocidad:tvReal;
  vecZonaMulta:tvZonas;
  vecTipos:tv;
  vecPatente:tvPatentes;
begin
   leeArchivo(vecZonas,vecFactor,M);
   generarInfracciones(vecZonaMulta,vecVelocidad,vecTipos,vecPatente,N,noInfraccion);
   readln();
end.
