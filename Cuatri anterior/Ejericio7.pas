program Ejericio7;
      var
        importe:real;
          talle,genero:char;
        cant:integer;
        const
          iva=1.21;


begin
  writeln('Ingrese si es hombre o mujer');
  readln(genero);
  if genero='H' then    {Defino precio a partir de genero}
     importe:=1000
  else
    importe:=1200 ;
  writeln('Ingrese la cantidad deseada');{Evaluo si es venta mayorista o no}
  readln(cant);
  importe:=importe*cant ;
  if cant>12 then
     importe:=importe*0.93;
  writeln('Ingrese el talle');
  readln(talle);
  if (talle='S')  OR (talle='X') then
     importe:=importe*0.95;
importe:=importe*iva ;

 writeln(importe)  ;


end.

