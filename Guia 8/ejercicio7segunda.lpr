{Ej 7) Crear una función recursiva que busque el elemento
mínimo de una matriz cuadrada.
}
program ejercicio7segunda;
const
  MAX=50;
type
  mat=array[1..MAX,1..MAX]of integer;
  var
   matriz:mat;
   N:integer;
procedure generaMatriz(var matriz:mat;var N:integer);
var
 i,j:integer;
begin
  writeln('Ingrese el N de la matriz cuadrada');
  readln(N);
  for i:=1 to N do
    begin
        for j:=1 to N do
          begin
            readln(matriz[i,j]);
          end;
    end;
    writeln('Salimos')
end;
function minimo(matriz:mat;i,j,N:integer):integer;
begin
  if (i=1) and (j=1) then
    minimo:=matriz[i,j]
  else
    begin
      if (j=1) then
        minimo:=minimo(matriz,i-1,N,N)
      else
        minimo:=minimo(matriz,i,j-1,N);
    end;
  if matriz[i,j]<minimo then
     minimo:=matriz[i,j];
end;
begin
  generaMatriz(matriz,N);
  writeln('El minimo es ',minimo(matriz,N,N,N));
  readln();
end.

