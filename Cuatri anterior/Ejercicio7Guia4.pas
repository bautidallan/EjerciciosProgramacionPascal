program Ejercicio7Guia4;
function Impuesto(tipo:char;precio_tot:real):real;
var
  aux:real;
begin

  if tipo='S' then
    aux:=precio_tot*0.21
  else
    aux:=precio_tot*0.21+precio_tot*0.10;

  Impuesto:=aux;

end;
var
comercio,peor:string;
tipo,c:char;
precio,precio_tot,min,iva:real;
n,i:integer;

begin
  min:=20000  ;
  writeln('Ingrese cantidad de meses');
  readln(n);
  while c<>'N' do
  begin

       writeln('Ingrese nombre del comercio');
       readln(comercio);
       writeln('Ingrese si es responsable inscripto');
       readln(tipo);
    for i:=1 to n do
      begin
        writeln('Ingrese facturado x mes sin iva');
        readln(precio);
        precio_tot:=precio_tot+precio;
      end;

    if tipo='S' then
      begin
    if precio_tot<min then
      min:=precio_tot;
      peor:=comercio
      end;

        iva:=impuesto(tipo,precio_tot);
        writeln('El nombre de la empresa es',comercio,'y facturo',iva:4:2);
        writeln('Desea continuar?');
        readln(c);

  end;
  readln();

end.

