program ejercicio7;

type
  tv=array[1..50,1..50]of integer;
var
  mat:tv;
  N:integer;
procedure genera_Mat(var mat:tv; var N:integer);
var
  i,j:integer;
begin
  writeln('Ingrese N');
  readln(N);
    for i:=1 to N do
      for j:=1 to N do
        begin
          readln(mat[i,j]);
        end;
end;
function minimo(mat:tv;i,j:integer):integer;
begin
        if (i=1) and (j=1) then
                minimo:=mat[i,j]
        else
                if i=1 then
                        minimo:=minimo(mat,i,j-1)
                else
                if j=1 then
                        minimo:=minimo(mat,i-1,2)
                else
                        minimo:=minimo(mat,i,j-1);


                if mat[i,j]<minimo then
                        minimo:=mat[i,j];

end;
begin
  genera_Mat(mat,N);
  writeln(minimo(mat,N,N));
  readln();
end.

