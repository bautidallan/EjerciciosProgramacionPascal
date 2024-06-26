program Ej2_tp3;
const
  sueldo_basico=1500;
  cargas=0.89;
  seguro=500;
  var
         cant_anios,n,i:integer;
         mejor_sueldo,sueldo,promedio,acumulador,contador:real;
         mejor_pago,nombre_ap:string;
begin
  mejor_sueldo:=0
  promedio:=0;
  acumulador:=0;
  contador:=0;
  writeln('Ingrese cant de empleados');
  readln(n);
  for i:=1 to n do
  begin
       writeln('Ingrese nombre y apellido');
       readln(nombre_ap)  ;
      writeln('Ingrese la antiguedad');
      readln(cant_anios);
      if cant_anios<5 then
         sueldo:=sueldo_basico*1.05
      else if cant_anios<10 then
         sueldo:=sueldo_basico*1.08
      else if cant_anios<15 then
         sueldo:=sueldo_basico*1.12
      else
      sueldo:=sueldo_basico*1.20;
       sueldo:=(sueldo*cargas)-seguro;
       writeln('El sueldo es',sueldo:8:2);
       writeln('El nombre es ',nombre_ap);
       contador:=contador+1;
       acumulador:=acumulador+sueldo;
       if sueldo>mejor_sueldo then
          begin
             mejor_sueldo:=sueldo;
             mejor_pago:=nombre_ap;
          end;


  end;
  promedio:=acumulador/contador ;
  writeln(promedio);
 writeln(mejor_sueldo,mejor_pago) ;


  ;

end.

