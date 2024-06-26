program ejercicioTambo;
const
  x=110;
type
str4=string[4];
tvTam=array[1..100] of str4;
tv=array[1..100]of real;
var
  litro,contador,aux,max:real;
  cod,codigoB,maxCod:str4;
  arch:text;
  vecCod:tvTam;
  vecProm,vecLit:tv;
  n:integer;
function promedio(contador,aux:Real):real;
begin
   promedio:=aux/contador;
end;
procedure lee(var arch:text;var vecCod:tvTam;var vecProm,vecLit:tv; var n :integer;var cod:str4;var litro:real;var contador,aux:real);
begin
          n:=0;
          assign(arch,'tambos.txt');
          reset(arch);
          while not eof(arch)do
              begin
                aux:=0;
                contador:=0;
                read(arch,cod,litro);    //Leo el codigo y un litro,si fuera 0 finaliza y no entra al while.
                while litro<>0 do
                        begin
                         aux:=aux+litro;
                         contador:=contador+1;
                         read(arch,litro);
                        end;
                n:=n+1;
                vecCod[n]:=cod;
                vecLit[n]:=aux;
                vecProm[n]:=promedio(contador,aux);
                readln(arch); //Salto de linea para seguir leyendo el archivo.
              end
end;
procedure maxEntrega(vecCod:tvTam;vecLit:tv;n:integer;var max:real;var maxCod:str4);  //Insiso a
var
  i:byte ;
begin
          max:=-999;
       for i:=1 to n do
       begin
             if vecLit[i]>max then
                begin
                maxCod:=vecCod[i];
                max:=vecLit[i];
                end;
       end;
     writeln('La mayor cantidad de litros entregada es ',max:4:0,' y el codigo es ',maxCod);
end;
procedure supera(vecCod:tvTam;vecProm:tv;n:integer); //Insiso b
var
  i:byte;
begin
       for i:=1 to n do
         begin
           if vecProm[i]>x then
              writeln('El codigo ',vecCod[i],' supera el promedio x');
         end;
end;
procedure busca(vecCod:tvTam;vecProm,vecLit:tv;n:integer;codigoB:str4);
var
  i:byte;
begin
       i:=1;
       writeln('Ingrese el codigo buscado,recuerde que son cadenas de 4');
       readln(codigoB);
       while (i<=n) AND(vecCod[i]<>codigob) do
              begin
              i:=i+1;
              end;
       if i<=n then
          writeln(vecCod[i],vecLit[i]:4:0,vecProm[i]:4:0)
       else
         writeln('No existe el codigo ingresado');


end;
begin
  lee(arch,vecCod,vecProm,vecLit,n,cod,litro,contador,aux);
  maxEntrega(vecCod,vecLit,n,max,maxCod);
  supera(vecCod,vecProm,n);
  busca(vecCod,vecProm,vecLit,n,codigoB);
  writeln(n);
  readln();
end.

