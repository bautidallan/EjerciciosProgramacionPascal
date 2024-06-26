program ejercicio4;
const
  C=7;       //Armo matriz generica de 7x7 ,despues calculo N y M
  F=7;
type
  tvMat=array[1..C,1..F]of integer;

  var
    N,M:integer;
    mat:tvMat;
procedure genera(var mat:tvMat;var N,M:integer);
var
  i,j:integer;
  arch:text;
begin
    N:=0;
    M:=0;
    assign(arch,'ej4.txt');
    reset(arch);
     while not eof(arch)do
        begin
           read(arch,i);
           read(arch,j);
           readln(arch,mat[i,j]);
                if N<i then
                  N:=i;//Si la fila que lei es menor a mi N, entonces esa fila es la fila maxima o dimension
                if M<j then
                  M:=j;
        end;
     close(arch);
end ;
function triangular(N,M:integer;mat:tvMat):boolean;
var
  seguir:boolean;
  i,j:integer;
begin
     seguir:=true;
    if N=M then //Analizo si es cuadrada
      begin
        while (i<m) and seguir do
           begin
              j:=j+1;
              i:=1;
               while (j>i) and seguir do
                  begin
                     if mat[i,j]<> 0 then
                       seguir:=false;
                     j:=j+1;
                  end;
           end;
      end;
       if seguir then
         triangular:=true
       else
       triangular:=false;
end;
begin

end.

