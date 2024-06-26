program ejercicio9Segunda;
const
  r=50;
  type
    tv=array[1..r]of integer;
{----------------------------------------------------------------------------}
procedure inicializa(var arrayAscendente:tv);
var
  i:integer;
begin
    for i:=1 to r do
    begin
      arrayAscendente[i]:=0;
    end;
end;
{---------------------------------------------------------------------------}
procedure generaA(var arrayAscendente:tv;var N:integer);
var
  arch:text;
  aux:integer;
begin
   n:=1;
   assign(arch,'ej9.txt');
   reset(arch);
   while not eof(arch)do
      begin
        readln(arch,aux);
        if aux>arrayAscendente[n]then
          begin
            n:=n+1;
            arrayAscendente[n]:=aux;
          end
      end;
end;
{-----------------Declaracion de variables---------------------}
var
  arrayAscendente:tv;
  n:integer;
begin
inicializa(arrayAscendente);
generaA(arrayAscendente,N);
end.

