program ejercicio15;
var
  arch:text;
  aux,x,y:char;


begin
  {Insiso B}

  assign(arch,'palabras.txt');
  reset(arch);
  writeln('Ingrese una letra por teclado');
  readln(x);
  while not eof(arch) do
   begin
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

