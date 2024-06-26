program ejercicio5segunda;
const
  maxELEMENT=50;
type
 cod=string[3];
 mat=array[1..maxELEMENT,1..4]of real;
 vCod=array[1..maxELEMENT]of cod;
var
  nroCli:vCod;
  Compras:mat;
  N:byte;
procedure leeArchivo(var nroCli:vCod;var N:byte;var compras:mat);
var
  M:byte;
  monto:real;
  arch:text;
begin
    assign(arch,'ej5.txt');
    reset(arch);
    while not eof(arch)do
     begin
       N:=N+1;
       readln(arch,nroCli[N],M,monto);
       compras[N,M]:=monto+compras[N,M];

     end;
end;
function rubro(x:byte):string;
begin
    case x of
    1:rubro:='Super';
    2:rubro:='Nafta';
    3:rubro:='Ropa';
    4:rubro:='Otros'
    end;
end;
procedure cantComprasArticulo(compras:mat;n:byte);
var
  contCompras:integer;
  i,j:byte;
begin
    for j:=1 to 4 do
      begin
        contCompras:=0;
        for i:=1 to N do
          begin
             if compras[i,j]>0 then
                contCompras:=contCompras+1;
          end;
         writeln('El rubro ',rubro(j),' tiene ',contCompras );
      end;
end;
procedure supera(nroCli:vCod;n:byte;compras:mat);
var
  i:byte;
begin
    for i:=1 to N do
      begin
          if compras[i,1]> compras[i,3] then
             writeln('El cliente ',nroCli[i],' supera con las compras del super a la ropa');

      end;
end;
begin
  leeArchivo(nroCli,N,compras);
  cantComprasArticulo(compras,n);
  supera(nroCli,n,compras);
  readln();
end.

