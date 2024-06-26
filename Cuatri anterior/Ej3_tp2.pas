program Ej3_tp2;
              var
                temp:real;

begin
  writeln('Ingrese temperatura') ;
  readln(temp);
  if temp<0 then
     writeln('No salgo de casa')
  else if temp<20 then
     writeln('Hace frio')
  else if temp<=25 then
     writeln('Barbaro')
  else if temp>29 then
     writeln('Que calor!!!')  ;
end.

