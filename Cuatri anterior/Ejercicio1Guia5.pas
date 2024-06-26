program Ejercicio1Guia5;
type
  tv=array[1..100] of integer ;
  var
    vec1:tv;
    x,i,n,aux,min,max:integer;

begin
   min:=9000;
   max:=-2000
  aux:=0;
  writeln('Ingrese cantidad de elementos del vector');
  readln(x);
  for i:=1 to x do
    begin
      writeln('Ingrese valor');
      readln(vec1[i]);
    end;
   {Insiso 1a}
   for i:=1 to x do
     begin
      aux:=vec1[i]+aux;
     end;

 writeln(aux);
    {Insiso 1B}
   for i:=1to x do
     begin
      if i MOD 2=0 then
      writeln(vec1[i]);
     end;
  {Insiso 1C}
   for i:=1 to x
    begin
    if vec[i]>max then
       vec[i]:=max;
   if vec[i]<min then
       vec[i]:=min;
    end;


   readln();

end.

