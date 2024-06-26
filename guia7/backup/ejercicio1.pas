program ejercicio1;
type

 str8=string[8];
  tRegfec=record
    dia,mes,anio:integer;
  end;
  Treg=record
    nombre:str8;
    fecha:tRegfec;
  end;
  vecreg=array[1..50]of Treg;
  vecEstacion=array[1..4]of integer;
  var
    n:integer;
    vec:vecreg;
    vecEs:vecEstacion;
procedure genera(var vec:vecreg; var n:integer);
var
  R:string;
begin
  while R<>'No' do
        begin
          n:=n+1;
          with vec[n]do
              readln(nombre,fecha.dia,fecha.mes,fecha.anio);
          writeln('Quiere seguir cargando datos');
          readln(R)
        end;

    end;
procedure estacion(vec:vecreg; n:integer;var vecEs:vecEstacion);
var
  max:integer;
  i,j:integer;
begin
  for i:=1 to N do
   begin
          case vec[i].fecha.mes of
             1,2:vecEs[1]:=vecEs[1]+1;
             4,5:vecEs[2]:=vecEs[2]+1;
             7,8:vecEs[3]:=vecEs[3]+1;
             10,11:vecEs[4]:=vecEs[4]+1;

             3:if vec[i].fecha.dia<=21 then
                 vecEs[1]:=vecEs[1]+1
                 else
                   vecEs[2]:=vecEs[2]+1;
             6:if vec[i].fecha.dia<=21 then
                 vecEs[2]:=vecEs[2]+1
                 else
                   vecEs[3]:=vecEs[3]+1;
             9:if vec[i].fecha.dia<21 then
                 vecEs[3]:=vecEs[3]+1
                 else
                   vecEs[4]:=vecEs[4]+1;
             12:if vec[i].fecha.dia<21 then
                 vecEs[4]:=vecEs[4]+1
                 else
                   vecEs[1]:=vecEs[1]+1;
          end;
    end;
    max:=-77 ;
    for j:=1 to 4 do
         begin
           if vecEs[j]>max then
               max:=vecEs[j];
         end;
    writeln('La mayor cantidad de cumpleaños es en la estacion ',max);
end;
begin
 genera(vec,n);
 estacion(vec,n,vecEs);
end.

