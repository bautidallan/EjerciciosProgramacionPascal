program parcial;
type
  NVuelo=string[6];
  str8=string[8];
  str50=string[50];
  tv50=array[1..100]of str50;
  tv=array[1..100]of integer;
  tvS=array[1..100]of str8;
  tvR=array[1..100]of real;
  tvVue=array[1..100]of NVuelo;
  var
   vecCiudad:tv50;
   vecVuelo:tvVue;
    vecFecha:tvs;
    vecEqui:tvR;
    vecCod,vecCodigos:tv;
    j,n:integer;
procedure generaVec( var vecVuelo:tvVue; n:integer;var vecCod:tv;var vecFecha:tvS;var vecEqui:tvR);
var
  equipaje:real;
  codigo,codigoL:integer;
  c:char;
  fecha,llegada:str8;
  vuelo:Nvuelo;
  arch:text;
begin
  n:=1;
  assign(arch,'vuelosdallan3.txt');
  reset(arch);
  while not eof(arch) do
        begin
         readln(arch,vuelo,codigo,c,fecha,codigoL,c,llegada,equipaje);
         vecVuelo[n]:=vuelo;
         vecCod[n]:=codigo;
         vecFecha[n]:=fecha;
         vecEqui[n]:=equipaje;
         n:=n+1;
        end;
end;
procedure leer(var j:integer;var vecCiudad:tv50;var vecCodigos:tv);
var
  nombre:str50;
  codigo:integer;
  arch2:text;
begin
  j:=0;
  assign(arch2,'aeropuertodallan.txt');
  reset(arch2);
    while not eof (arch2) do
          begin
           j:=j+1;
           read(arch2,codigo,nombre);
           vecCiudad[n]:=nombre;
           vecCodigos[n]:=codigo;
           readln(arch2);
          end;

end;
procedure busqueda(vecVuelo:tvVue;vecCod:tv;vecFecha:tvS;vecEqui:tvR;n:integer);
var
 i:byte;
 codigo:integer;
 fecha:str8;
begin
  i:=0;
 writeln('Ingrese codigo y fecha de salida ');
 readln(codigo);
 readln(fecha);
        while (i<=n) and (codigo<>vecCod[i]) and (fecha<>vecFecha[i]) do
              begin
               i:=i+1;
              end;
             if i<=n then
             writeln('El codigo de vuelo es ', vecCod[i],' y puede llevar',vecEqui[i]:4:0,'kg de equipaje')
             else
             writeln('No existe el codigo o fecha ingresado');
end;
begin
  generaVec(vecVuelo,n,vecCod,vecFecha,vecEqui);
  busqueda(vecVuelo,vecCod,vecFecha,vecEqui,n);
  leer(j,vecCiudad,vecCodigos);
  readln();
end.

