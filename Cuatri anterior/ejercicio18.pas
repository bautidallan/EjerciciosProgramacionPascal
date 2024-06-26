program ejercicio18;


var
  arch:text;
  nombre:string;
  total:real;
  precio1,precio2,precio3,cant_ventas,suma_descuento1,suma_descuento2,
    suma_descuento3,suma_total:real;
  descu:char;


begin
  assign(arch,'Letras.txt');
  reset(arch);
  while NOT eof(arch) do
  begin
   readln(arch,nombre);
   readln(arch,cant_ventas);
   readln(arch,precio1,descu);
       if descu='S' then
     begin
       precio1:=precio1*0.9;
       suma_descuento1:=precio1*0.1
     end;
   readln(arch,precio2,descu);
       if descu='S' then
         begin
          precio2:=precio2*0.9;
          suma_descuento2:=precio2*0.1
         end;
   readln(arch,precio3,descu);
       if descu='S' then
         begin
          precio3:=precio3*0.9;
          suma_descuento3:=precio3*0.1
         end;
   suma_total:=suma_descuento1+suma_descuento2+suma_descuento3 ;
   total:=precio1+precio2+precio3;
   writeln(total:8:2);
   end;

   close(arch);
   readln();
end.

