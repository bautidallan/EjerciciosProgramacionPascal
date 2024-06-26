program ejercicio15;
var
  arch:text;
  aux,x,y:char;


begin
  assign(arch,'palabras.txt');
  reset(arch);
  while not eof(arch) do
   begin
      writeln('Ingrese una letra por teclado');
      readln(x);
      read(arch,aux);
      if x=aux then
        writeln('Coinciden')
        else
          begin
          writeln('No coinciden');
          read(arch,aux);
          end;
   end;
  readln();
end.

