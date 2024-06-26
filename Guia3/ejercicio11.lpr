program ejercicio11;
var
  arch:text;
  cod:char;
  saldoInicial,monto:real;

begin
  assign(arch,'banco.txt');
  reset(arch);
  readln(arch,saldoInicial);
  while not eof(arch)do
  begin
    readln(arch,cod,monto);
    if cod='d' then
       saldoInicial:=saldoInicial+monto
    else
      saldoInicial:=saldoInicial-monto;
  end;

  writeln('El saldo que le quedo es ',saldoInicial:4:2);
  readln();
end.

