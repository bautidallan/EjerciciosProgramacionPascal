
program Noticias;
const
  MAX=50;
 type
    str10=String[10];
    str3=string[3];
    tm=array[1..MAX,1..MAX]of integer;
    Treg=record
      cod:str3;
      tipo:byte;
    end;
    tv=array[1..MAX]of Treg;
    tvS=array[1..MAX]of str10;
    tvC=array[1..MAX]of str3;
procedure generavec(var tipoNoticia:tvS;var M:byte);
var
 pal:string;
 c,b:char;
 arch:text;
 i,j:byte;
begin
  M:=0;
  assign(arch,'TipoNoticias.txt');
  reset(arch);
  while not eof (arch) do
  begin
       read(arch,i,tipoNoticia[i]);
       if i> M then
         M:=i;
     readln(arch);
  end;
end;
procedure generaCodigos(var codigos:tvC;var N:byte);
begin

end;

procedure generaMatriz();
var
 arch:text;
begin
end;
var
 tipoNoticia:tvS;
 M:byte;
begin
  generaVec(tipoNoticia,M);
  readln();
end.

