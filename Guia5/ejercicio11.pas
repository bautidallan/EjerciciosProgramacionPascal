program ejercicio11;

uses unit1;

type
  str20=string[10];
  tv=array[1..30]of str20;
  tv2=array[1..100]of integer;
  const
    semis=100;
  var
    nombre,n_mejor:str20;
    max,cont_super,pos1:integer;
    vNombre:tv;
    vec1,vec2:tv2;
    arch:text;
Procedure lee(var arch:text;var vNombre:tv;var vec1,vec2:tv2;var pos1:integer);
begin
     pos1:=1;
     assign(arch,'ejercicio11.txt');
     reset(arch);
   while not eof(arch) do
      begin
        readln(arch,vNombre[pos1],vec1[pos1],vec2[pos1]);
        pos1:=pos1+1 ;{Si el contador arrranca en 0 y se actualiza antes d leer}
      end;
   close(arch);
end;
procedure Superar(var vec1,vec2:tv2;pos1:integer;var cont_super:integer);
var
  i:byte;
begin
    for i:=1 to pos1-1 do
       if vec2[i]>vec1[i] then
          cont_super:=cont_super+1 ;
 writeln('La cantidad que superaron con el 2do tiro al 1ero es ',cont_super);
end;
Procedure MejorMarca(var vec1:tv2;var vNombre:tv ;var n_mejor:str20;var max:integer);
var

  i:byte;
begin
 max:=-900;
 for i:=1 to pos1-1 do
    begin
     if vec1[i]>max then
        begin
         max:=vec1[i];
         n_mejor:=vNombre[i];
        end;
    end;
 writeln('El que tuvo la mejor marca fue ',n_mejor,'y la marca es ',max);
end;
Procedure InformaMarca(var vec1,vec2:tv2;var vNombre:tv;var nombre:str20);
var
  i:byte;
begin
 writeln('Ingrese el nombre buscado');
 readln(nombre);
    for i:=1 to pos1-1 do
       begin
            if nombre=vNombre[i] then
                writeln('Sus marcas son ', vec1[i],'y ',vec2[i]);
       end;


end;
begin
  lee(arch,vNombre,vec1,vec2,pos1);
  Superar(vec1,vec2,pos1,cont_super);
  MejorMarca(vec1,vNombre,n_mejor,max);
  InformaMarca(vec1,vec2,vNombre,nombre);
  readln();

end.
