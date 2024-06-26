{Ej 8) Desarrollar un procedimiento recursivo que devuelva en un arreglo los máximos de cada fila de una
matriz de NxM.
   }
program ejercicio8segunda;
const
  MAX=50;
type
   tm=array[1..MAX,1..MAX]of integer;
   tv=array[1..MAX]of integer;
var
  mat:tm;
  vector:tv;
  N,M,t:byte;
  maxFila:integer;
procedure generaMat(var mat:tm;var N,M:byte);
var
  i,j:byte;
begin
  writeln('Ingrese N y M de la matriz ');
  readln(N,M);
  for i:=1 to N do
   begin
     for j:=1 to M do
      begin
        read(mat[i,j]);
      end;
     readln();
  end;
end;
procedure generar(mat:tm;i,j:byte;var vector:tv;maxFila:integer;M:integer);

//Considerar que este vector se llena desde atras hacia adelante, ya que recorro desde mat[N,M] hasta mat[1,1]
begin
    if (i=1)and (j=1) then         {Caso base en el que llego a mat[1,1]}
      begin
        if mat[1,1]>maxFila then
            vector[i]:=mat[i,j]              {Si ese lugar es el maximo de la fila, lo introduzco en array}
            else
              vector[i]:=maxFila;            {Sino el maximo que ya tenia}
      end
    else
       if j=1 then                        {Caso en el que llego a mat[N,1] y analizo si es o no maximo}
          if mat[i,j]>maxFila then
           begin
             vector[i]:=mat[i,j];
             maxFila:=-99;
             generar(mat,i-1,M,vector,maxFila,M);      //Actualizo fila anterior y reestablezco la columna
           end
         else
            begin
              vector[i]:=maxFila;
             maxFila:=-99;
             generar(mat,i-1,M,vector,maxFila,M);   //
            end
    else                                         {Luego si no estoy en mat[N,1], debo seguir analizando la fila}
     if mat[i,j]>maxFila then
       begin
          maxFila:=mat[i,j];                       //Actualizo maximo en caso de ser necesario
          generar(mat,i,j-1,vector,maxFila,M);     //Llamo a la recursion de columna anterior
       end
       else
          generar(mat,i,j-1,vector,maxFila,M);    //Sino llamo directamente a la recursion sin actualizar max

end;
begin
  generaMat(mat,N,M);
  generar(mat,N,M,vector,maxFila,M);
  for t:=1 to N do
   writeln(vector[t]);
  readln();
end.

