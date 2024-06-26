program Ejercicio1;
type
  tvMat=array[1..50,1..50]of integer;
  tv=array[1..50]of integer;
var
  t,N,M,k:integer;
  mat1:tvMat;
  vec,vec2:tv;
Procedure Genera(var N,M:integer;var mat1:tvMat);
var
  i,j,x:integer;
  arch:text;
begin
      assign(arch,'ej1.txt');
      reset(arch);
      readln(arch,N,M);
      while not eof (arch) do
        for i:=1 to N do
          begin
            for j:=1 to M do
              begin
                 read(arch,mat1[i,j]);
              end;
             readln(arch);
          end;

end;
Procedure impar(N,M:integer;mat1:tvMat;var vec:tv;var k:integer);
var
  cont,i,j:integer;
begin
      k:=0;
      for j:=1 to M do
        begin
          cont:=0;
          for i:=1 to N do
            begin
              if mat1[i,j]MOD 2<>0 then
                 cont:=cont+mat1[i,j];
              k:=k+1;
              vec[k]:=cont;
            end;

        end
end;
Procedure maximo(N,M:integer;var vec2:tv;var t:integer;mat1:tvMat);
var
  max,i,j:integer;
begin
    t:=0;
    for i:=1 to N do
      begin
        max:=mat1[i,1];
          for j:=1 to M do
             begin
                if mat1[i,j]>max then
                   max:=mat1[i,j];
             end;
          t:=t+1;
          vec2[t]:=max;
      end;
end;
Procedure busqueda(mat1:tvMat;N,M:integer);
var
  cont,prom,l,i,h:integer;
begin
    cont:=0;
    h:=0;
   writeln('Ingrese columna buscada');
   readln(l);
     for i:=1 to N do
        begin
           cont:=cont+mat1[i,l];
           h:=h+1;
        end;
  prom:=cont Div h;
  writeln('El promedio de la fila es ',prom);
end;
begin
  Genera(N,M,mat1);
  maximo(N,M,vec2,t,mat1);
  impar(N,M,mat1,vec,k);
  busqueda(mat1,N,M);
  readln();
end.

