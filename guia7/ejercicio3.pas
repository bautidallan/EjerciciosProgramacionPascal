program ejercicio3;
const
  maxELEMENT=50;
type
  Tcord=record
    x,y:byte;
    end;
  Treg=record
     coordenadas:Tcord;
     cuadrante:integer;
     distancia:real;
  end;
  tv=array[1..maxELEMENT]of Treg;
var
  puntos:tv;
  N:integer;
function cuadrante(i,j:byte):integer;
begin
     if (i>0) and (j>0)then
       cuadrante:=1
       else if (i>0) and (j<0)then
         cuadrante:=2
       else if (i<0)and (j>0)then
         cuadrante:=3
       else
         cuadrante:=4;
end;
function distancia(i,j:integer):real;
begin
    distancia:=sqrt(sqr(i)+sqr(j));
end;

procedure generavector(var puntos:Tv;var N:integer);
var
  i,j:byte;
  rta:char;
begin
     N:=0;
     writeln('Quiere cargar puntos?');
     readln(rta);
     while (rta='S')or(rta='s') do
        begin
           N:=N+1;
           with puntos[N] do
             begin
             readln(coordenadas.x,coordenadas.y);
             end;
             i:=puntos[N].coordenadas.x;
             j:=puntos[N].coordenadas.y;
             puntos[N].cuadrante:=cuadrante(i,j);
             puntos[N].distancia:=distancia(i,j);
           writeln('Desea seguir ingresando puntos? Ingrese S o s para seguir');
           readln(rta);
        end;
end;
procedure masMenos(puntos:tv;N:integer);
var
  max,menor:integer;
  i:byte;
begin
     max:=-99;
     menor:=9000;
    for i:=1 to N do
      begin
        if puntos[N].distancia>max then
            max:=puntos[N].distancia;
        if puntos[N].distancia<menor then
          menor:=puntos[N].distancia;

      end;
     writeln('La mayor distancia es ',max,' y la menor distancia es ', menor);
end;
begin
  generaVector(puntos,N);
  masMenos(putnos,N);
  readln();
end.

