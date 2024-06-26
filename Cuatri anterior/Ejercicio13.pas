program Ejercicio13;
var cant_pesos,cant_convertido:real;
  cambio:string;


begin
writeln('Ingrese cantidad de pesos a convertir') ;
readln(cant_pesos);
writeln('Ingrese a que quiere convertir');
readln(cambio);
case cambio of
'Dolar':cant_convertido:=cant_pesos/128.80;
'Euro':cant_convertido:=cant_pesos/150.10;
'Real':cant_convertido:=cant_pesos/28.50;
end;
writeln(cant_convertido);
end.

