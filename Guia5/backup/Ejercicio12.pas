program Ejercicio12;
type
  {str15=string[15];}
  tv=array[1..100]of real;
  tv2=array[1..100]of string;
  tv3=array[1..100]of char;
  var
    max:real;
    pal,maxNombre,clave:string;
    k:integer;
    arch:text;
    vecClave:tv2;
    vecProm:tv;
    vecCar:tv3;
Function prom(num1,num2,num3:real):real;
begin
  prom:=(num1+num2+num3)/3;
end;
Function Especial(car:char):boolean;
begin
   if (car in['a'..'z']) or(car in['A'..'Z']) or (car in['0'..'9'])then
      Especial:=false
   else
      Especial:=true;
end;
Procedure leer(var arch:text;var vecCar:tv3;var vecProm:tv;var vecClave:tv2;var pal:string;var k:integer);
var
  a,b,c:real;
  car,pr:char;
  i:integer;
begin
  k:=0 ;
  assign(arch,'ej12.txt') ;
  reset(arch);
   while not eof (arch) do
           begin
              pal:='';
              i:=0;
              read(arch,car);
              while car<>'' do
                      begin
                         if Especial(car)then
                            i:=i+1
                         else
                            begin
                              pal:=pal+car;
                            end;
                             read(arch,car);
                      end;
              if i<=3 then
                 begin
                 read(arch,a,b,c,pr);

                   while pr='' do
                         begin
                           read(arch,pr);
                         end;
                   if pr<>car then
                       begin
                        k:=k+1;
                        vecClave[k]:=pal;
                        vecProm[k]:=prom(a,b,c);
                        vecCar[k]:=pr;
                       end;

                 end;
              readln(arch);
           end;
   close(arch);
end;
Procedure Maximo(var vecProm:tv;var vecClave:tv2;var max:real;var maxNombre:string);
var
  i:byte;
begin
   max:=-100;
    for i:=1 to k do
    begin
       if vecProm[i]>max then
          begin
            max:=vecProm[i];
            maxNombre:=vecClave[i];
          end;
    end;
   writeln('El maximo promedio es ',max,'y la clave es ',maxNombre);
end;

Procedure Busqueda(vecCar:tv3;vecClave:tv2;vecProm:tv);
var
  i:byte;
begin
   writeln('Ingrese clave');
   readln(clave);
   for i:=1 to k do
   begin
      if clave=vecClave[i] then
         writeln('El promedio es ',vecProm[i],'y la letra es ',vecCar[i])
      else
         writeln('No existe esa contraseña gil');

   end;
end;
procedure muestra(vecCar:tv3;vecClave:tv2;vecProm:tv);
var
  i:byte;
  begin
     for i:=1 to k do
        writeln(vecCar[i],vecClave[i],vecProm[i]);
  end;

begin
Leer(arch,vecCar,vecProm,vecClave,pal,k);
Maximo(vecProm,vecClave,max,maxNombre);
Busqueda(vecCar,vecClave,vecProm);
Muestra(vecCar,vecClave,vecProm);
readln();
end.

