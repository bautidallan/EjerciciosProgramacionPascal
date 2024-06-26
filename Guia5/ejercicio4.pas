program ejercicio4;
type
  tv=array[1..100]of integer;
  var
    arrayOriginal,arrayCompactado:tv;
    N,M:integer;
procedure muestra(arrayCompactado:tv;N:integer);
var
  i:integer;
begin
     writeln('Muestro el nuevo array compactado');
     for i:=1 to N do
     begin
        writeln(arrayCompactado[i]);
     end
end;
procedure compactaArray(arrayOriginal:tv;var arrayCompactado:tv;var M:integer;N:integer);
var
  i:integer;
begin
  M:=0;
  writeln(N);
  for i:=1 to N do
  begin
    if arrayOriginal[i]<>0 then
       begin
       M:=M+1;
       arrayCompactado[M]:=arrayOriginal[i];
       end;
  end;
  writeln(M);
  muestra(arrayCompactado,M);
end;
procedure generaArray(var arrayOriginal:tv;var N:integer);
var
  i:integer ;
begin
  writeln('Ingrese indice de array');
  readln(N);
  for i:=1 to N do
  begin
     readln(arrayOriginal[i]);
  end
end;
begin
  generaArray(arrayOriginal,N);
  compactaArray(arrayOriginal,arrayCompactado,M,N);
  readln();
end.

