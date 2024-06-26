program  Ejercicio_clase;
var
  nombre,nombre_menor:string;
  edad,menor:integer;


begin
  menor:=200 ;
  writeln('Ingrese nombre');
  readln(nombre);
  while upcase(nombre)<>'zzz' do
begin
   writeln('edad');
   readln(edad);
   if edad<menor then
     begin
     menor:=edad;
     nombre_menor:=nombre ;
     end;
   writeln('Ingrese nombre');
   readln(nombre);
end;
  writeln(menor);
end.

