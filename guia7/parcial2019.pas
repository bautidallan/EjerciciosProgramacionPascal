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
    aux,X,N,M:integer;
procedure genera(var vec:tv;var X,N,M:integer;var mat:tvMat);
var
  rubro:str8;
  ganancia:real;
  i,j,val:integer;
  arch:text;
begin
     X:=0;
     assign(arch,'verduleria.txt');
     reset(arch);
     while not eof(arch)do
       begin
         readln(arch,N,M);  //N es cantidad de cajas, M cantidad de rubros
           while X<=4 do
             begin
                X:=X+1;
                with vec[i] do
                  begin
                     readln(arch,rubro,ganancia); //Armo el vector de registros
                  end;
             end;
           for i:=1 to N do        //Desde caja 1 hasta caja N
             begin
                 while (j<>0) and(val<>0) do   //Al leer 0 0 es fin d vila
                   begin
                      read(arch,j,val);
                      mat[i,j]:=val+mat[i,j];
                   end;
                 readln(arch);
             end;


       end;
end;
function busqueda(R:str8;vec:tv;X,aux:integer):boolean;
begin
       if X>aux then
         if vec[aux].nombre=R then
            busqueda:=true
        else
          busqueda(R,vec,X,aux+1);
end;
function promedio(R:str8):real;
begin

end;
procedure busca(vec:tv;mat:tvMat;X,N,M:integer;var R:str8;var aux:integer);
begin
     writeln('Cual es el rubro buscado?');
     readln(R);
     aux:=1;



end;
begin
  genera(vec,X,N,M,mat);
end.

