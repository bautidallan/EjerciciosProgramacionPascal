program ejer4;

const
  maxELEMENT=50;
type
  mat=array[1..maxELEMENT,1..maxELEMENT]of integer;
procedure leeArchivo(var matrizRala:mat;var N,M:byte);
var
  i,j:byte;
  dato:integer;
  arch:text;
begin
  N:=0;
  M:=0;
  assign(arch,'ej4.txt');
  reset(arch);
  while not eof (arch)do
     begin
       readln(arch,i,j,dato);
       matrizRala[i,j]:=dato;
       if i>N then
         N:=i;
       if j> M then
         M:=j;
     end;
  writeln(N,' ',M);
end;
procedure inicializa(var matrizRala:mat);
var
  i,j:byte;
begin
  for i:=1 to maxELEMENT do
     for j:=1 to maxELEMENT do
        matrizRala[i,j]:=0;
end;
function triangular(matrizRala:mat;N,M:byte):boolean;
var
  es:boolean;
  i,j:byte;
begin
     i:=1;
     j:=1;
     es:=false;
     while (i<=N) and (es=false)do
        begin
          j:=1;
         while (j<=M) and (es=false) do
            begin
               if matrizRala[i,j]=0 then
                 j:=j+1
               else
                 es:=true;
             end;
         i:=i+1;
         end;
   triangular:=es;

end;
var
  N,M:byte;
  matrizRala:mat;
begin
  inicializa(matrizRala);
  leeArchivo(matrizRala,N,M);
  if triangular(matrizRala,N,M) then
    writeln('No es triangular inferior')
    else
      writeln('Es triangular inferior')
  readln();
end.

