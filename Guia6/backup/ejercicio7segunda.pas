program ejercicio7segunda;
const
  maxELEMENT=50;
type
  mat=array[1..maxELEMENT,1..maxELEMENT]of real;
var
  lineaMax,paradaMax:byte;
  mAscienden,mDescienden:mat;
procedure generaMatrices(var mAscienden,mDescienden:mat;var lineaMax,paradaMax:byte);
var
  n,m:byte;
  arch:text;
begin
  lineaMax:=0;
  paradaMax:=0;
  assign(arch,'ej7.txt');
  reset(arch);
  while not eof (arch)do
    begin
      readln(arch,n,m,mAscienden[n,m],mDescienden[n,m]);
      if n>lineaMax then
         lineaMax:=n;
      if m>paradaMax then
         paradaMax:=m;
    end;
end;
procedure maxBajaron(mDescienden:mat;lineaMax,paradaMax:byte);
var
  i,j:byte;
  suma,maxBajaron:Real;
  pos:integer;
begin
  maxBajaron:=-99;
  for j:=1 to paradaMax do
    begin
      suma:=0;
      for i:=1 to lineaMax do
        begin
           suma:=suma+mDescienden[i,j];
        end;
         if suma>maxBajaron then
            begin
              maxBajaron:=suma;
              pos:=j;
            end;
    end;
  writeln('La parada en la que mas bajaron es la ',pos);
end;
procedure insisoC(mDescienden,mAscienden:mat;lineaMax,paradaMax:byte);
var
  i,j:byte;
begin
  for i:=1 to lineaMax do
    begin
        for j:=1 to paradaMax do
         begin
            if mAscienden[i,j]<mDescienden[i,j]*(0.4) then
               writeln('La parada ',j, ' en la linea ',i,' supera');
         end;
    end;
end;
procedure ninguna(mAscienden:mat;lineaMax,paradaMax:byte);
var
  registra:boolean;
  noRegistraron:integer;
  i,j:byte;
begin
  noRegistraron:=0;
          while (i<=lineaMax) do
            begin
               j:=1;
               while (j<=paradaMax) and(registra=false)do
                  begin
                     if mAscienden[i,j]=0 then
                       begin
                           registra:=true;
                           noRegistraron:=noRegistraron+1;
                       end
                     else
                     j:=j+1
                 end;
               registra:=false;
               i:=i+1;
            end;
  writeln(noRegistraron,' lineas no registraron ascensos en alguna parada');
end;
begin
  generaMatrices(mAscienden,mDescienden,lineaMax,paradaMax);
  maxBajaron(mDescienden,lineaMax,paradaMax);
  insisoC(mDescienden,mAscienden,lineaMax,paradaMax);
  ninguna(mAscienden,lineaMax,paradaMax);
  readln();
end.

