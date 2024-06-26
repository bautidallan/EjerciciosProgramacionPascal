program ejercicio11_guia3;
var
  arch:text;
  saldo,cantidad:integer;
  accion:char;

begin
  assign(arch,'jorge.txt');
  reset(arch);
  readln(arch,saldo);
  while NOT eof(arch) do
  begin
    readln(arch,accion,cantidad);
    saldo:=saldo+cantidad;
    readln(arch,accion,cantidad);
    saldo:=saldo-cantidad;

end;
  writeln(saldo);
  readln();
end.

