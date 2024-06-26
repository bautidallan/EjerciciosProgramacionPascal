program parcial2019;
type
  str8=string[8];
  Treg=record
    nombre:str8;
    ganancia:real;
  end;
  tv=array[1..100]of Treg;
  tvMat=array[1..50,1..50]of integer  ;
  var
    R:str8;
    mat:tvMat;
    vec:tv;
    i,j,colum,X,N,M:integer;
procedure genera(var vec:tv;var X,N,M:integer;var mat:tvMat);
var
  i,j,val:integer;
  arch:text;
begin
     X:=0;
     assign(arch,'verduleria1.txt');
     reset(arch);
     while not eof(arch)do
       begin
         readln(arch,N,M);  //N es cantidad de cajas, M cantidad de rubros
           for i:=1 to N-1 do
            begin
                  with vec[i] do
                   readln(arch,nombre,ganancia); //Armo el vector de registros
            end;
           for i:=1 to N do        //Desde caja 1 hasta caja N
             begin
                 read(arch,j,val);
                 while (j<>0) and(val<>0) do   //Al leer 0 0 es fin d fila
                   begin
                      mat[i,j]:=val+mat[i,j];
                      read(arch,j,val);
                   end;
                 readln(arch);
             end;
       end;
     close(arch);
end;
function busqueda(R:str8;vec:tv;X:integer):integer;
begin
       if X=0 then
           busqueda:=0
       else
         if vec[X].nombre=R then
            busqueda:=X
        else
          busqueda:=busqueda(R,vec,X-1);
end;
function promedio(mat:tvMat;colum,N:integer):real;
var
  i:integer;
  suma:real;
begin
      suma:=0;
      for i:=1 to N do
        begin
           suma:=mat[i,colum]+suma;
        end;
    promedio:=suma/N;
end;
procedure busca(vec:tv;X,N:integer;var R:str8;var colum:integer);
begin
     writeln('Cual es el rubro buscado?');
     readln(R);
     colum:=busqueda(R,vec,X);
     writeln('El promedio del rubro buscado es ',promedio(mat,colum,N):4:2);

end;
procedure supera(N,M:integer;mat);
var
  importe:real;
begin
     writeln('Ingrese el importe');
     readln(importe);

end;
begin
  genera(vec,X,N,M,mat);
  busca(vec,X,N,R,colum);
  readln();
end.

