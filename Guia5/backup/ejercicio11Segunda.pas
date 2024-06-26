program ejercicio11Segunda;
const
  r=50;
  type
    tv=array[1..r]of integer;
    tvS=array[1..r]of string;
procedure leeArchivo(var arrayP,arrayS:tv;var arrayCompetidores:tvS;var N:integer);
var
  c:char;
  pal:String;
  arch:text;
begin
  N:=0;
  assign(arch,'ejercicio11se.txt');
  reset(arch);
  while not eof(arch)do
       begin
          pal:='';
          N:=N+1;
          read(arch,c);
          while c <>' 'do
               begin
                  pal:=pal+c;
                  read(arch,c);
               end;
          arrayCompetidores[N]:=pal;
          read(arch,arrayP[N],arrayS[N]);
          readln(arch);
       end;
    close(arch);
end;
procedure supera(arrayP,arrayS:tv;arrayCompetidores:tvS;N:integer);
var
  i:integer  ;
begin
   for i:=1 to N do
     begin
       if arrayS[i]>arrayP[i] then
         writeln('El competidor ',arrayCompetidores[i],' supera con el segundo al primero');
     end;
end;
procedure mejorMarca(arrayP,arrayS:tv;arrayCompetidores:tvS;N:integer);
var
  pos,i,maxMarca:integer;
begin
  maxMarca:=-99;
     for i:=1 to N do
       begin
           if arrayP[i]>maxMarca then
              begin
                maxMarca:=arrayP[i];
                pos:=i;
             end;
           if arrayS[i]>maxMarca then
             begin
                maxMarca:=arrayS[i];
                pos:=i;
             end;
       end;
     writeln('El competidor ',arrayCompetidores[pos],' tiene la mejor marca de ',maxMarca);
end;
function BuscaAtleta(atleta:String;arrayCompetidores:TvS;N:integer):integer;
var
  pos,i:integer;
begin
  i:=1;
      while (i<N)and(atleta<>arrayCompetidores[i])do
           begin
              i:=i+1;
           end;

      if i<N then
        BuscaAtleta:=i
      else
         BuscaAtleta:=0;
end;
procedure muestraMarcas(arrayP,arrayS:tv;arrayCompetidores:tvS;N:integer;var atleta:String);
var
  pos:integer;
begin
    writeln('Ingrese el atleta que desea conocer las marcas');
    readln(atleta);
    pos:=BuscaAtleta(atleta,arrayCompetidores,N);
    writeln('Las marcas son ',arrayP[pos],arrayS[pos]);
end;

var
  atleta:string;
  N:integer;
  arrayP,arrayS :tv;
  arrayCompetidores:tvS;
begin
  leeArchivo(arrayP,arrayS,arrayCompetidores,N);
  supera(arrayP,arrayS,arrayCompetidores,N);
  mejorMarca(arrayP,arrayS,arrayCompetidores,N);
  muestraMarcas(arrayP,arrayS,arrayCompetidores,N,atleta);
  readln();
end.

