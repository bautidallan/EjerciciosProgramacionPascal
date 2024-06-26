program folletosss;

type
  TVB=array[1..20] of byte;
  TVR=array[1..20] of real;
const
  X=1.0;
function CalcCosto(tipo:char; tam,pal:byte):real;
var
  valor:real;
begin
  valor:=pal*X;
  if (tipo='A')then
     valor:=valor*2;
  if (tipo='B')then
      valor:=valor*3;
  if (tipo='C')then
     valor:=valor*5;
  if (tam=2) then
     CalcCosto:=valor*(1.5)
  else
      CalcCosto:=valor;
end;
Procedure LeeFolleto(var costo:TVR; var maslarga,cantpal:TVB; var pos:byte);
var
  arch:text;
  pal,cantL,PML,tam:byte;
  tipo,letras:char;
begin
  assign(arch,'imprenta.txt');
  reset(arch);
  pos:=1;
  while not eof(arch) do
        begin
          read(arch,tipo,tam,letras);
          PML:=0;
          pal:=0;
          cantL:=0;
          while (letras<>'.') do
                begin
                  if (letras<>' ') then
                     read(arch,letras)
                  else
                      begin
                        pal:=pal+1;
                        while (letras<>'.')AND(letras<>' ') do
                              begin
                                cantL:=cantL+1;
                                read(arch,letras);
                              end;
                        if(cantL>PML) then
                           PML:=cantL;
                        cantL:=0;
                      end;
                end;
          cantpal[pos]:=pal;
          maslarga[pos]:=PML;
          costo[pos]:=CalcCosto(tipo,tam,pal);
          pos:=pos+1;
          readln(arch);
        end;
  close(arch);
end;
Procedure Escribe(costo: TVR; maslarga, cantpal: TVB; pos:byte);
Var
 i:byte;
Begin
Writeln( 'Cantidad Pal más larga Costo');
For i:= 1 to pos do
 begin
 Writeln (cantpal[i]:10, maslarga[i]:12, costo[i]:8:2) ;
End;

end;

var
  costo:TVR;
  maslarga,cantpal:TVB;
  pos,tam,pal:byte;
  tipo:char;
begin
  LeeFolleto(costo,maslarga,cantpal,pos);
  Escribe(costo,maslarga,cantpal,pos);
  readln();
end.



