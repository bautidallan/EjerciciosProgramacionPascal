program ejercicio18;

uses unit1;

var
  arch:text;
  b,promo:char;
  nombre:String[8];
  montoDescuento,totalVenta,precio,totalDescuento:real;
  cantArticulos:integer;
  tipoProducto:string[5];
  i:byte;
  buscaOfertas:String;
  cantOfertas,maxOferta:integer;
  const
   descuento=0.9;
begin
  assign(arch,'compras1.txt');
  reset(arch);
  maxOferta:=-99;
  while not eof(arch)do
  begin
        cantOfertas:=0;
        totalVenta:=0;
        totalDescuento:=0;
        read(arch,nombre,cantArticulos,b);
        writeln(nombre,cantArticulos,b);
        for i:=1 to cantArticulos do
          begin
            read(arch,tipoProducto,precio,b,promo,b);
            writeln(tipoProducto);
            if (promo='S')then
               begin
                  precio:=precio*descuento;
                  montoDescuento:=precio*0.01;
                  cantOfertas:=cantOfertas+1;
               end;
            totalVenta:=totalVenta+precio;
            totalDescuento:=totalDescuento+montoDescuento;
          end ;
           if cantOfertas>maxOferta then
                  buscaOfertas:=nombre;

           if cantOfertas=cantArticulos then
              begin
                 writeln('Compro todo oferta!')
              end;

           writeln('El precio total de la venta es ',totalVenta:4:2);
           writeln('El precio total del descuento es ',totalDescuento:4:2);
           readln(arch);
  end;
  writeln('El que mas ofertas compro fue ',buscaOfertas);
  readln()
end.

