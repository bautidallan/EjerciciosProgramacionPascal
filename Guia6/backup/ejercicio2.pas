program ejercicio2;
type
  str5=string[5];
  tvMat=array[1..50,1..50]of integer;
  tv=array[1..50]of str5;
var
  vec:tv;
  mat:tvMat;
  k,n,m:integer;
  procedure genera(var vec:tv;var mat:tvMat;var k,n,m:integer);
  var
    i,j:integer;
    basur:string[5];
    nombre:str5;
    arch:text;
begin
     m:=3; //M,osea cant de columnas es 3,porque se sabe que son 3 parciales
     assign(arch,'ejercicio2.txt');
     reset(arch);
     while not eof(arch)do
         begin
           readln(arch,nombre);
           k:=k+1;    //K determinara cantidad de filas,1 fila por alumno
           vec[k]:=nombre;
         end;
     reset(arch); //Resetea el archivo,cuando sale de leer los nombres
         while not eof(arch)do
             begin
             for i:=1 to k do
                 begin
                  read(arch,basur);//Como vuelve a leer los nombres los tomo como 'Basura'
                     for j:=1 to m do
                       begin
                        read(arch,mat[i,j]);
                       end;
                     readln(arch);
                 end;

     end;
     close(arch);
end;
procedure aprobo(vec:tv;mat:tvMat;k,m:integer);
var
  aux,i,j:integer;
begin
    for i:=1 to k do
      begin
          aux:=0;
          for j:=1 to m do
            begin
                if mat[i,j]>=5 then
                 aux:=aux+1;
            end;
          if aux=m then
           writeln('El alumno ',vec[i],'aprobo los 3 parciales');
      end;
end;
begin
 genera(vec,mat,k,n,m);
 aprobo(vec,mat,k,m);
 readln();
end.

