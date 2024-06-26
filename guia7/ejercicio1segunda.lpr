program ejercicio1segunda;
const
  maxELEMENT=50;
type
  tvE=array[1..4]of byte;
  Tfecha=record
    dia,mes,anio:integer;
  end;
  Treg=record
    Nombre:string;
    cumple:Tfecha;
  end;
  tvR=array[1..MaxELEMENT]of Treg;
var
  vecEstacion:tvE;
  N:integer;
  empresa:tvR;
procedure generaVector(var empresa:tvR;var N:integer);
var
  Rta:char;
begin
  N:=1;
  writeln('Desea ingresar empleados?');
  readln(rta);
  while (rta='S')or (rta='s') do
    begin
      with empresa[N] do
         begin
           readln(empresa[N].Nombre,empresa[N].cumple.dia,empresa[N].cumple.mes,empresa[N].cumple.anio);
         end;
      writeln('Desea seguir cargando empleados?');
      readln(rta);
      N:=N+1;
    end;
end;
procedure estacion(var VecEstacion:tvE;empresa:tvR);
var
  maxEstacion:integer;
  j,i,x,dia:byte;
begin
  maxEstacion:=-88;
  for i:=1 to N do
    begin
      dia:=empresa[i].cumple.dia;
      x:=empresa[i].cumple.mes;
        case x of
        1,2:
          vecEstacion[1]:=vecEstacion[1]+1;
        4,5:
          vecEstacion[2]:=vecEstacion[2]+1;
        7,8:
          vecEstacion[3]:=vecEstacion[3]+1;
        10,11:
          vecEstacion[4]:=vecEstacion[4]+1;
        3:
          begin
          if dia>21 then
            vecEstacion[2]:=vecEstacion[2]+1
            else
              vecEstacion[1]:=vecEstacion[1]+1;
          end;
        6:
          begin
          if dia>21 then
            vecEstacion[3]:=vecEstacion[3]+1
            else
                vecEstacion[2]:=vecEstacion[2]+1;
          end;
        9:
        begin
        if dia>21 then
               vecEstacion[4]:=vecEstacion[4]+1
            else
              vecEstacion[3]:=vecEstacion[3]+1;
        end;
        12:
        if dia>21 then
            vecEstacion[1]:=vecEstacion[1]+1
            else
              vecEstacion[3]:=vecEstacion[3]+1
        end;

     end;

  for j:=1 to 4 do
    begin
       if vecEstacion[j]>maxEstacion then
           maxEstacion:=vecEstacion[j];
    end;
  writeln('La estacion numero',vecEstacion[j],' es la que mas cumples tiene');
end;
begin
 generaVector(empresa,N);
 readln();
end.

