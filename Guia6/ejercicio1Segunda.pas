program ejercicio1Segunda;
const
  maxElement=50;
type
  mat=array[1..maxElement,1..maxElement]of integer;
  vec=array[1..maxElement]of integer;
var
  N,M,indiceMax,indiceImpares:byte;
  matriz:mat;
  vImpares,vMaximos:vec;
procedure leeArchivo(var matriz:mat;var N,M:byte);
var
  i,j:integer;
  arch:text;
begin
  assign(arch,'ej1.txt');
  reset(arch);
  readln(arch,N,M);
  while not eof (arch)do
     begin
         for i:=1 to N do
          begin
             for j:=1 to M do
                read(arch,matriz[i,j]);
           readln(arch);
          end;
     end;
   for i:=1 to N do
          begin
             for j:=1 to M do
                write(matriz[i,j],' ');
             writeln();
          end;
end;
procedure generaMaximos(var vMaximos:vec;var indiceMax:byte;matriz:mat;N,M:byte);
var
  h,i,j,maxFila:integer;
begin
       for i:=1 to N do
          begin
           maxFila:=0;
             for j:=1 to M do
             begin
                if matriz[i,j]>maxFila then
                  maxFila:=matriz[i,j];
             end;
            indiceMax:=indiceMax+1;
            vMaximos[indiceMax]:=maxFila;
          end;
       for h:=1 to indiceMax do
        write(vMaximos[h],' ');

end;
function esImpar(X:integer):boolean;
begin
   if x mod 2<>0 then
     esImpar:=true
      else
        esImpar:=false;
end;
procedure generaImpares(var vImpares:vec;var indiceImpares:byte;matriz:mat;N,M:byte);
var
  x,h,i,j  :integer;
begin
    indiceImpares:=0;
    for j:=1 to M do
      begin
        indiceImpares:=indiceImpares+1;
             for i:=1 to N do
              begin
                 x:=matriz[i,j];
                 if esImpar(x) then
                   begin
                      vImpares[indiceImpares]:=vImpares[indiceImpares]+matriz[i,j];
                   end;
              end;
      end;
  for h:=1 to indiceImpares do
       writeln(vImpares[h]);
end;

begin
{Lectura de archivos y armado de matriz}
leeArchivo(matriz,N,M);

{Insiso A}
generaMaximos(vMaximos,indiceMax,matriz,N,M);

writeln();
{insiso B}
 generaImpares(vImpares,indiceImpares,matriz,N,M);


readln();
end.

