program ejercicio8;
type
  tv=array[1..100]of byte;
procedure frecuencias(var vectorFrecuencias:tv;vector:tv;n:integer;var m:integer);
var
frecuencia:byte  ;
i:integer;
begin
  frecuencia:=0;

  for i:=1 to n do
    begin
       if vector[i]=vector[i+1] then
         frecuencia:=frecuencia+1
         else
         begin
         M:=M+1;
         vectorFrecuencias[M]:=frecuencia;
         frecuencia:=1;
         end;
    end;
end;
procedure generaVector(var vector:tv;var n:integer);
var
  i:integer;
begin
  writeln('Ingrese cantidad de elementos');
  readln(n);
  for i:=1 to n do
  begin
    readln(vector[i])
  end;
end ;
var
  vectorFrecuencias,vector:tv;
  i,m,n:integer;
begin
   generaVector(vector,n);
   frecuencias(vectorFrecuencias,vector,n,m);
   for i:=1 to M do
   begin
     writeln(vectorFrecuencias[i]);
   end;
   readln();
end.

