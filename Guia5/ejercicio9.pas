program ejercicio9;
type
  tv=array[1..80] of integer;

 var
   num,x,suma:integer;
   vec1,vec2:tv;
   arch:text;
  procedure leer(var arch:text;var vec1:tv;var num,x:integer;var suma:integer);

     begin
         suma:=1 ;
         assign(arch,'ej9.txt');
         reset(arch);
         read(arch,num);
         vec1[suma]:=num;
         while not eof (arch) do
               begin
                read(arch,x);
                if x>num then
                begin
                  suma:=suma+1;
                  vec1[suma]:=x;
                  num:=x;
                end;
               end;
     end;
Procedure GeneraVector()
begin
end;
Procedure Muestra(vec1:tv;suma:integer);
var
  i:byte;
begin
    for i:=1 to suma do
    writeln(vec1[i])
end;

begin
  leer(arch,vec1,num,x,suma);
  Muestra(vec1,suma);
  readln();
end.

