program ejercicio7;
type
  tv=array[1..100]of longint;
  var
    suma:longint;
    n:integer;
    arrayGrandes:Tv;

function sumaArray(arrayGrandes:tv;N:integer):longint;
var
  i:integer;
  aux:longint;
begin
     for i:=1 to N do
     begin
        aux:=aux+arrayGrandes[i];
     end;
     sumaArray:=aux;
end;
begin
  writeln('Ingrese dos numeros grandes');
  n:=n+1;
  readln(arrayGrandes[n]);
  readln(arrayGrandes[n+1]);
  suma:=sumaArray(arrayGrandes,N);
  writeln(suma);
  readln();
end.

