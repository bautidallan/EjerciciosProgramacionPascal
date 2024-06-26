program ejercicio8Guia4;
uses crt;

Function descuento(dia:byte;tipo:char):real;
var
  cantidad:real;
begin
    cantidad:=0 ;
   if (dia=30) OR (dia=10) OR (dia=20) AND (tipo='O') then
    begin
     cantidad:=cantidad+5;
    end;
    if (dia>15) AND (tipo='C') then
     begin
     cantidad:=cantidad+10;
     end;

    if  (dia<15) AND (tipo='S') then
     begin
     cantidad:=cantidad+15 ;
     end;

    descuento:=cantidad;

end;
var
  arch:Text;
  monto,monto_total,ahorro:real;
  dia,codigo,cantidad_r:integer;
  tipo:char;
  beneficio_c,beneficio_s,beneficio_o:boolean;
begin
  monto_total:=0;
  cantidad_r:=0 ;
  beneficio_s:=false;
  beneficio_o:=false;
  beneficio_c:=false;
  assign(arch,'comercioss.txt');
  reset(arch);
  while not eof(arch) do
    begin
    read(arch,codigo);
    Repeat
        Read(Arch, tipo)    //Lectura hasta encontrar caracter del rubro
        Until (tipo = 'C') or (tipo = 'O') or (tipo = 'F') or (tipo = 'S');
     read(arch,monto);
     read(arch,dia);
    monto_total:=monto+monto_total;
    ahorro:=descuento(dia,tipo);
    monto_total:=((100-ahorro)*monto)/100+monto_total ;

    {if (tipo='S') and (ahorro<>0) then
       beneficio_s:=true ;

    if (tipo='O') and (ahorro<>0) then
       beneficio_o:=true ;

    if (tipo='C') and (ahorro<>0) then
       beneficio_c:=true ;}

      {if beneficio_s AND beneficio_o AND  beneficio_c then
            cantidad_r:=cantidad_r+1 ;}


    Repeat
          Read(Arch,tipo)    //Lectura hasta encontrar caracter del rubro
          Until (tipo = 'C') or (tipo = 'O') or (tipo = 'F') or (tipo = 'S');



         writeln(codigo,'El monto es ',monto_total:4:2);
    end;
  close(arch);

  writeln('Tuvieron descuento en 3 rubros ',cantidad_r);

  readln();
end.

