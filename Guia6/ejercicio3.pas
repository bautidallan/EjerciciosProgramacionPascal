program ejercicio3;
type
  tvMat=array[1..50,1..50]of integer;
  tv=array[1..50]of integer;
var
  n,y:integer;
  mat:tvMat;
  vec:tv;
procedure genera(var vec:tv;var mat:tvMat;var n,y:integer);
var
  i:integer;
  arch:text;
begin
  n:=0;
  y:=3;
  assign(arch,'ej3.txt');
  reset(arch);
      while not eof(arch)do
          begin
             for i:=1 to y do
               begin
                 read(arch,vec[i]); //Leo el archivo generando un vector paralelo
               end;
                 if (vec[y] MOD vec[1])=0 then  //Si el ultimo divide al primero, lo meto en la matriz
                   begin
                        n:=n+1;
                        for i:=1 to y do
                          begin
                            mat[n,y]:=vec[y];
                          end;
                   end;
          end;

end;
begin
  genera(vec,mat,n,y);
end.

