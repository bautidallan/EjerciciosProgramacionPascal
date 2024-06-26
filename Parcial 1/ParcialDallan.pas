program ParcialDallan;
const
  maxElement=50;
type
  str8=String[8];
  str4=string[4];
  mayorPeso=array[1..3]of real;
  mayorDni=array[1..3]of str8;
  tvR=array[1..maxElement]of str4;
  tvD=Array[1..maxElement]of str8;
  tv=array[1..maxElement]of integer;
  tvP=array[1..maxElement]of real;
var
  CantAsientos,N:integer;
  vecReserva:tvR;
  vecDni:tvD;
  vecEdad:tv;
  vecPeso:tvP;
  vecMayorDni:mayorDni;
  vecMayorPeso:MayorPeso;
 procedure leeArchivo(var vecReserva:TvR;var vecDni:tvD;var vecEdad:tv;var vecPeso:tvP;var CantAsientos:integer);
 var
   peos:Real;
   reserva:str4;
   dni:str8;
   peso:Real;
   pos,aux,edad,i:integer;
   arch:text;
   b:char;
 begin
    pos:=1;
    assign(arch,'Checkin.txt');
    reset(arch);
    readln(arch,CantAsientos);
    aux:=cantAsientos;
    readln(arch,vecReserva[pos],b,vecDni[pos],vecEdad[pos],vecPeso[pos]);
    while not eof(arch)do
       begin
            readln(arch,reserva,b,dni,edad,peso);
                while reserva=reserva[pos]do
                   begin
                     pos:=pos+1;
                     vecReserva[pos]:=reserva;
                     vecDni[pos]:=dni;
                     vecEdad[pos]:=edad;
                     vecPeso[pos]:=peso;
                     readln(arch,reserva,b,dni,edad,peso);
                   end;
                aux:=aux-1;
                vecReserva[aux]:=reserva;
                vecDni[aux]:=dni;
                vecEdad[aux]:=edad;
                vecPeso[aux]:=peso;
       end;
    for i:=1 to cantAsientos do
       writeln(vecReserva[i],' ',i);
    close(arch);
 end;
function busqueda(vecDni:tvD;cantAsientos:integer;dni:Str8):integer;
var
  j:integer;
begin
     j:=1;
     while (j<=CantAsientos) and(dni<>vecDni[j])do
        begin
                 j:=j+1;
        end;
     if j>CantAsientos then
        busqueda:=0
        else
           busqueda:=j;
end;
procedure BuscaDni(vecDni:TvD;cantAsientos:integer);
var
  dni:str8;
  i,pos:integer;
begin
    writeln('Ingrese el Dni buscado');
    readln(Dni);
    pos:=busqueda(vecDni,cantAsientos,dni);
    if pos <>0 then
       writeln('El dni Ingresado esta en el asiento',pos)
    else
       writeln('No existe el dni buscado');
end;
procedure perteneceRango(vecPeso:tvP;CantAsientos:integer);
var
  L1,L2,cont,i:integer;
  promedio:Real;
begin
   promedio:=0;
   cont:=0;
    writeln('Ingrese limites del rango buscado');
    readln(L1,L2);
    for i:=1 to cantAsientos do
       begin
           if (vecPeso[i]>L1) and(vecPeso[i]<L2) then
              begin
                promedio:=promedio+vecPeso[i];
                cont:=cont+1;
              end;
       end;
    writeln('El promedio de peso los que pertencen al rango es ',(promedio/cont):5:2);
end;
procedure mayorEquipajes(var vecMayorPeso:mayorPeso;var vecMayorDni:mayorDni;cantAsientos:integer;vecPeso:tvP;vecDNI:tvD;Var N:integer);
var
pesoMax:Real;
j,t:integer;
begin
   pesomax:=-99;
   for j:=1 to cantAsientos do
      begin
         if vecPeso[j]>pesomax then
            begin
               N:=N+1;
               vecMayorPeso[N]:=vecPeso[j];
               VecMayorDni[N]:=vecDni[j];
               pesoMax:=vecPeso[j];
            end;

      end;
   writeln('Los 3 dnis con mayor peso en el equipaje son') ;
   for t:=1 to 3 do
      begin
         writeln(vecMayorDni[t]);
      end;
end;
begin
   {Lectura de archivo}
  leeArchivo(vecReserva,vecDni,vecEdad,vecPeso,cantAsientos);

   {Insiso A}
   BuscaDni(vecDni,cantAsientos);

   {Insiso B}
   perteneceRango(vecPeso,cantAsientos);

   {Insiso C}
    mayorEquipajes(vecMayorPeso,vecMayorDni,cantAsientos,vecPeso,vecDni,N);

   readln();
end.

