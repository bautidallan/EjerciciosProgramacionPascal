program ejercicio10Segunda;
const
  r=100 ;
type
  tv=array[1..r]of integer;
procedure generaA(var arrayA:tv;var n:integer);
var
  i:integer;
begin
   writeln('Ingrese el N del vector');
   readln(N);
   for i:=1 to n do
     begin
      readln(arrayA[i]);
     end
end;
procedure generaB(var arrayB:tv;var M:integer;arrayA:tv;n:integer);
var
  suma,j,i:integer;
begin
   suma:=0;
   M:=0;
   for i:=1 to n do
     begin
       if arrayA[i]<0 then
        begin
            j:=1;
            suma:=0;
            while arrayA[i+j]>0 do
            begin
              suma:=suma+arrayA[i+j];
              j:=1+j;
            end;
             M:=M+1;
            arrayB[M]:=suma;
       end;
    end;
end;

procedure muestra(vector:tv;n:integer);
var
  i:integer;
begin
   for i:=1 to N do
     begin
       writeln(vector[i])
     end;
end;
var
  arrayA,arrayB:tv;
  N,M:integer;
begin
  generaA(arrayA,N);
  generaB(arrayB,M,arrayA,n);
  muestra(arrayB,m);
  readln();
end.

