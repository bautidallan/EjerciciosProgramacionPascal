program Tambos;
const
  MaxElement=50;
type
  str4=string[4];
  tvCod=array[1..MaxElement]of str4;
  tvProm=array[1..MaxElement]of real;
function Promedio(M:integer;litros:tvProm;CantEntregas:integer):Real;
begin
    Promedio:=litros[M]/CantEntregas
end;
procedure leeArchivo(var codigos:tvCod;var promedios,litros:tvProm;var M:integer);
var
  CantEntregas:integer;   {Se puede esto?O si lo voy a pasar a otra funcion tengo q declararlo en var}
  dato,aux:Real;
  arch:text;
begin
   M:=0;
   assign(arch,'tambos.txt');
   reset(arch);
   while not eof(arch) do
     begin
         CantEntregas:=0;
         M:=M+1;
         readln(arch,codigos[M]);
         read(arch,dato);
           while dato<>0 do
             begin
                read(arch,dato);
                litros[M]:=litros[M]+dato;
                cantEntregas:=cantEntregas+1;
             end;
           promedios[M]:=promedio(M,litros,cantEntregas);
       readln(arch);
     end;
   close(arch);
end;
function maxLitros(codigos:tvCod;litros:tvProm;M:integer):str4;
var
  codEntrega:str4;
  i:integer;
  maxLitro:Real;
begin
   maxLitro:=-99;
     for i:=1 to M do
     begin
        if litros[i]>maxLitro then
            begin
              maxLitro:=litros[i];
              codEntrega:=codigos[i];
            end;
     end;
   maxLitros:=codEntrega;
end;

var
  codigos:tvCod;
  promedios:tvProm;
  litros:tvProm;
  M:integer;
begin
  leeArchivo(codigos,promedios,litros,M);
  writeln(maxLitros(codigos,litros,M));
  readln();
end.

