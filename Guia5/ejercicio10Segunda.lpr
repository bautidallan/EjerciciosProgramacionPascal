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
procedure generaB(var arrayB,arrayC:tv;var M,C:integer;arrayA:tv;n:integer);
var
  suma,j,i,k:integer;
begin
   C:=0;
   suma:=0;
   M:=0;
   for i:=1 to n do
     begin
       if arrayA[i]<0 then
        begin
            j:=1;
            k:=0;
            suma:=0;
             while arrayA[i+j]>0 do
              begin
                suma:=suma+arrayA[i+j];
                j:=1+j;
                k:=k+1;
              end;
             C:=C+1;
             M:=M+1;
            arrayB[M]:=suma;
            arrayC[C]:=k;
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
  arrayA,arrayB,arrayC:tv;
  N,M,C:integer;
begin
  generaA(arrayA,N);
  generaB(arrayB,arrayC,M,C,arrayA,n);
  muestra(arrayB,m);
  muestra(arrayC,C);
  readln();
end.

