program ejercicio1;
var
  N,num,max,pos,cont:integer;
  i:byte;

begin
  cont:=0;
  pos:=0;
  max:=-888;
  writeln('Ingrese el limite N');
  readln(N);

  for i:=1 to N do
     begin
     writeln('Ingrese num');
     readln(num);
     if num=max then
        cont:=cont+1;
     if num>max then
        begin
        max:=num;
        pos:=i;
        cont:=cont+1;

        end;

     end;
 writeln('El maximo es ',max , ' esta en el lugar ',pos,' y tuvo ',cont,' ocurrencias');
 readln();

end.

