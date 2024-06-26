{a) Para un código de surtidor C, el tipo de combustible que más litros vendió. Puede no existir.
b) Porcentaje de importe de venta de cada tipo de combustible respecto de la venta total de combustible.
c) Para aquellos surtidores que vendieron más de X litros de un tipo de combustible, generar una estructura
con: código de surtidor y tipo de combustible. Luego listarlos
}
program parcialNafta;
const
  MAX=50;
type
  st4=string[4];
  st10=String[10];
  Treg=record
    tipoNafta:st10;
    valor:real;
  end;
  tv=array[1..Max]of st4;
  tvR=array[1..MAX] of Treg;
  tm=array[1..MAX,1..MAX]of real;
 procedure generaVec(var vNaftas:tvR;var M:byte);
 var
   i:byte;
   arch:text;
 begin
    assign(arch,'Combustible.txt');
    reset(arch);
    readln(arch,M);
    for i:=1 to M do
     begin
       readln(arch,vNaftas[i].tipoNafta,vNaftas[i].valor);//Armo vector de registros con tipo de nafta y su respectivo valor
     end;
    close(arch);
 end;
procedure leeVentas(var mVentas:tm;var codigos:tv;var N:byte;M:byte);
var
  arch:text;
  j:byte;
begin
    assign(arch,'Ventass.txt');
    reset(arch);
    N:=0;
    while not eof(arch)do
       begin
          N:=N+1;
          read(arch,codigos[N]); //El vector con los codigos de cada surtidos representara las filas la matriz
          for j:=1 to M do       //Itero desde 1 hasta M ya que M es la cant de naftas disponibles
            begin
              read(arch,mVentas[N,j]);
            end;
          readln(arch);
       end;
    close(arch);
end;
function busca(codigo:st4;vec:tv;N:byte):byte;
var
  i:byte;
begin
   i:=0;
   while (i<=N) and (vec[i]<>codigo) do
       i:=i+1;

   if i<=N then
      Busca:=i
      else
        busca:=0;
end;
procedure recursivoA(mat:tm;i,j:byte;var columna:byte;Var maximo:real);
begin
    if j=1 then
      begin
       if mat[i,j]>max then
          begin
            maximo:=mat[i,j];
            columna:=j;
          end;
      end
    else
      if mat[i,j]>maximo then
         begin
            maximo:=mat[i,j];
            columna:=j;
            recursivoA(mat,i,j-1,columna,maximo);
         end
      else
        recursivoA(mat,i,j-1,columna,maximo);
end;
function totalVentas(mat:tm;i,j,M:byte):real;
begin
   if (i=1) and (j=1) then
      totalVentas:=mat[i,j]
   else
     begin
       if j=1 then
          totalVentas:=mat[i,j]+totalVentas(mat,i-1,M,M)
         else
           totalVentas:=mat[i,j]+totalVentas(mat,i,j-1,M);
     end;
end;
procedure insisoB(mVentas:tm;N,M:byte;vNaftas:tvR);
var
  total,suma,porcentaje:real;
  i,j:byte;
begin
    total:=totalVentas(mVentas,N,M,M);
    for j:=1 to M do
      begin
      porcentaje:=0;
      suma:=0;
        for i:=1 to N do
          begin
             suma:=mVentas[i,j]+suma;
          end;
        porcentaje:=(suma/total)*100;
        writeln('El tipo de combustible ', vNaftas[j].tipoNafta ,' representa el ',porcentaje:4:2,'%')
      end;

end;

procedure buscaSurtidor(codigos:tv;N,M:byte;mVentas:tm;vNaftas:tvR);
var
  columna:byte;
  maximo:Real;
  fila:byte;
  cod:St4;
begin
   writeln('Ingrese surtidor buscado');
   readln(cod);
   fila:=busca(cod,codigos,N); //Llamo a funcion de busqueda para ver si existe o no
     if fila<>0 then
        begin
          recursivoA(mVentas,fila,M,columna,maximo);//En caso de que exista llamo a la recursividad para buscar el maximo
          writeln('El codigo buscado ha vendido mas nafta del tipo ',vNaftas[columna].tipoNafta);
        end
     else
       writeln('El codigo buscado no existe');
end;
var
  mVentas:tm;
  codigos:tv;
  vNaftas:tvR;
  N,M:byte;
begin
  generaVec(vNaftas,M);
  leeVentas(mVentas,codigos,N,M);

  {Insiso A}
   buscaSurtidor(codigos,N,M,mVentas,vNaftas);

  {Insiso B}
  insisoB(mVentas,N,M,vNaftas);
  readln()
end.

