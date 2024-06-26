program ejercicio5;
type
  tv=array[1..50]of integer;
var
  vec:tv;
  j,aux,n:integer;
function suma(vec:tv;i:integer):integer;
begin
  if i=1 then
     suma:=vec[1]
  else
      suma:=vec[i]+suma(vec,i-1);
end;
procedure mostrarVec(vec:tv;n:integer;var aux:integer);

begin
   writeln(vec[aux]);
   if n>aux then
        begin
        aux:=aux+1 ;
        mostrarVec(vec,n,aux);
        end;

end;
procedure mostrarVecin(vec:tv;n:integer;var aux:integer);
begin
   aux:=n;
   writeln(vec[aux]);
   if aux>0 then
      begin
          if aux=1 then
            writeln(vec[1])
             else
                  begin
                    aux:=aux-1 ;
                    mostrarVec(vec,n,aux);
                  end;


      end;

end;
procedure maximo(vec:tv;n:integer;var aux:integer);
var
  max:integer;
begin
    if n>aux then
      begin
            if vec[aux]>max then
                begin
                    max:=vec[aux];
                    aux:=aux+1;
                    maximo(vec,n,aux);
                end
              else
                  begin
                     aux:=aux+1;
                     maximo(vec,n,aux);
                  end;

      end;
end;
begin
  writeln('Ingrese N');
  readln(n);
  for j:=1 to n do
     readln(vec[j]);
  writeln(suma(vec,n));
  aux:=1;
  mostrarVec(vec,n,aux);
  mostrarVecin(vec,n,aux);
  maximo(vec,n,aux);
  readln();
end.

