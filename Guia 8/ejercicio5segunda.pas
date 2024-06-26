{
Ej 5) Sea V un arreglo de enteros, mediante procesos recursivos se pide:
a) Calcular e informar la suma de sus elementos.
b) Mostrar sus elementos.
c) Mostrarlos en orden inverso.
d) Obtener el máximo de sus elementos.
e) Obtener el promedio.
}
program ejercicio5segunda;
const
  MAXELEMENT=50;
type
  tv=array[1..MAXELEMENT]of integer;
procedure armaVec(var vec:tv;var N:integer);
var
  i:byte;
begin
  writeln('Ingrese el N del vector');
  readln(N);
  for i:=1 to N do
   begin
     readln(vec[i]);
   end;
  writeln(vec[0]);
end;
function Suma(vec:Tv;N:integer):integer;
begin
     if N=0 then
       Suma:=0
     else
       Suma:=vec[N]+Suma(vec,N-1);
end;
procedure Muestra(vec:tv;N:integer);
begin
   if N=0 then
     writeln('Los elementos del vector son')
   else
     begin
     Muestra(vec,N-1);
     writeln(vec[N]);
     end;
end;
function maximoElemento(vec:tv;N:integer;var aux:integer):integer;
begin
     if n=0 then
      maximoElemento:=aux
      else
      begin
          if vec[N]>aux then
           begin
             aux:=vec[N];
             maximoElemento:=maximoElemento(vec,N-1,aux);
           end
          else
           maximoElemento:=maximoElemento(vec,N-1,aux);
        end;
end;
var
  vec:tv;
  aux,N:integer;
begin
  armaVec(vec,N);
  writeln(Suma(vec,N));
  Muestra(vec,N);
  aux:=-99;
  writeln('El maximo elemento es ',maximoElemento(vec,N,aux));
  readln();
end.

