program Ejercicio5 ;
var
  superficie,alto,ancho,baldosas:real;



begin
  writeln('Ingrese alto y ancho');
  readln(alto,ancho);
  superficie:=alto*ancho;
  baldosas:=superficie /( 0.0625);
  writeln(baldosas) ;

end.

