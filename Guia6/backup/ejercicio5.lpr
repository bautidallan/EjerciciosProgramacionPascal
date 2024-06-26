program ejercicio5;
type
  str3=string[3];
  tv=array[1..50]of str3;
  tvMat=array[1..50,1..50]of real;
var
  codigo:str3;
  vec:tv;
  mat:tvMat;
  N,M:integer;
  function BuscaFila(vec:tv;N:integer;codigo:str3):integer;
var
  i:integer;
begin
  i:=1;
  while (i<N) and(codigo<>vec[i]) do
    begin
       i:=i+1;
    end;
      if i<N then
          BuscaFila:=i
        else
          BuscaFila:=0;


end;
procedure lee_archivo(var vec:tv;var mat:tvMat;var N,M :integer;var codigo:str3);
var
  i,j:integer;
  cont,monto:real;
  arch:text;
begin
  assign(arch,'ej5.txt');
  reset(arch);
  M:=4;
  N:=0;
      while not eof(arch)do
        begin
            cont:=cont+1;  //Contador para saber cuantas compras hubo
            readln(arch,codigo);
            i:=BuscaFila(vec,N,codigo);  //Busco fila,si ya existe no hago nada,si no creo una nueva
              if i=0 then
                  begin
                    N:=N+1;
                    vec[N]:=codigo;
                  end;
        end;
      reset(arch);
       while not eof(arch)do
             begin
                 readln(arch,codigo,j,monto);
                 i:=BuscaFila(vec,N,codigo);
                 if i<>0 then
                     begin
                       mat[i,j]:=monto;
                     end
             end;
  close(arch);
        end;
procedure muestraVec(vec:tv;N:integer);
var
  i:integer;
begin
     for i:=1 to N do
       writeln(vec[i]);
end;
Procedure muestraMat(mat:tvMat;N,M:integer);
var
  i,j:integer;
  begin
    for i:=1 to N do
      begin
          for j:=1 to M do
            writeln(mat[i,j]:4:2);
      end;
end;
procedure compras(mat:tvMat;N,M:integer);
var
  cont:real ;
  i,j:integer;
begin
   for j:=1 to M do
     begin
         cont:=0;
         for i:=1 to N do
           begin
              if mat[i,j]<>0 then
                  cont:=cont+1;         //Porque no lee el 3
           end;
         writeln('Para el rubro ',j,'hubo ',cont:4:2,' ventas');
     end;
end;
procedure promedio(mat:tvMat;N,M:integer;vec:tv);
var
  suma,cont,promedio:real;
  i,j:integer;
begin
  for i:=1 to N do
    begin
       suma:=0;
       cont:=0;
       for j:=1 to M do
           begin
              suma:=suma+mat[i,j];
              if mat[i,j]<> 0 then
              cont:=cont+1;
           end;
             if cont<>0 then
             begin
             promedio:=suma/cont;
             writeln('El promedio de compras del cliente ',vec[i],' es ',promedio:4:2);
             end;

    end

end;
procedure supera(mat:tvMat;vec:tv;N,M:integer);
var
  aux,i,j:integer;
begin
  for i:=1 to N do
    begin
       if mat[i,1]>mat[i,3] then
          begin
          writeln('El cliente ',vec[i],'supera con supermercado a indumentaria');
          end;
    end;

end;
begin
  lee_archivo(vec,mat,N,M,codigo);
  muestraVec(vec,N);
  muestraMat(mat,N,M);
  compras(mat,N,M);
  promedio(mat,N,M,vec);
  supera(mat,vec,N,M);
  readln();
end.

