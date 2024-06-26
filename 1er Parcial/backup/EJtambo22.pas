program EJtambo22;
type
  str4=string[4];
  tvSt=array[1..100]of str4;
  tv=array[1..100]of real;
var
  n:integer;
  {arch:text}
  vecCod:tvSt;
  vecTot,vecEntregas:tv;
function posicion(vecCod:tvSt;n:integer;codigo:str4):integer;
var
  i:byte;
begin
     i:=1;
     while (i<=n) and (VecCod[i]<>codigo)do
         begin
          i:=1+1
         end;
      if i<=n then
       posicion:=i
      else
        posicion:=0;
end;
procedure Leer({var arch:text}var vecCod:tvSt; var vecTot,vecEntregas:tv;var n:integer);
var
  arch:text;
  litro:real;
  codigo:str4;
  i,dia:integer;
begin
     n:=0;
    assign(arch,'tambos2.txt');
    reset(arch);
    while not eof(arch)do
        begin
          readln(arch,codigo,dia,litro);
          i:=posicion(vecCod,n,codigo);
              if i=0 then
                   begin
                    n:=n+1;
                    vecCod[n]:=codigo;
                    vecTot[n]:=litro;
                    vecEntregas[n]:=1;
                   end
                else
                  begin
                   vecTot[i]:=litro+vecTot[i];
                   vecEntregas[i]:=vecEntregas[i]+1;
                  end;
        end;
    close(arch);
end;
begin
  Leer(vecCod,vecTot,vecEntregas,n);
  readln();
end.

