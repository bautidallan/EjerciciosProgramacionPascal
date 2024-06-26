 { 6) Sea A un arreglo de reales y un valor X real ingresado por teclado, se pide determinar en qué
posición se encuentra X, devolver 0 en caso de no encontrarlo. Implementar:
a) considerando el arreglo desordenado, una búsqueda lineal recursiva.
b) para un arreglo ordenado en forma ascendente, una búsqueda binaria recursiva
 }
program ejercicio6segunda;
const
  MAX=50;
type
  tv=array[1..MAX]of real;
  var
   vec:tv;
   X:Real;
   pos,N,i:integer;
function Recursiva(vec:tv;X:real;N:integer):integer;
begin
  if N=0 then
     Recursiva:=0
  else
    if X=vec[N] then
       Recursiva:=N
       else
         Recursiva:=Recursiva(vec,X,N-1);
end;
begin
  writeln('Ingrese N del vector');
  readln(N);
  for i:=1 to N do
    begin
      readln(vec[i]);
    end;
  writeln('Ingrese elemento buscado');
  readln(X);
  pos:=Recursiva(vec,X,N);
  if pos=0 then
     writeln('No existe')
  else
    writeln('Esta en la posicion ',pos);
  readln();
end.
