program ejercicioParcial1C;
type
  str7=string[7];
  str3=string[3] ;
  tvP=array[1..100]of str7 ;
  tvMulta=array[1..100]of real;
  tvZ=array [1..100]of str3;
var
  vecInf:tvMulta;
  vecP:tvP;
  factor:real;
  b,c:char;
  vecMulta,vecFactor:tvMulta;
  vecZonasG,zonas:tvZ;
  arch,archZo:text;
  j,tipo,n,contNoinf:integer;
  velocidad:real;
  zonaX,zona:str3;
  patente:str7;
function Costo(tipo:integer;zonas:tvZ;vecFactor:tvMulta;zona:str3):real;
var
  i:byte;
  aux:real;
begin
i:=1;
  while (zonas[i]<>zona) do
   begin          //Busco la posicion donde se ubica la zona deseada
        i:=1+i;
      case tipo of                          //Calculo el costo de la multa en base al tipo de automotor
         1:Costo:=1000*vecFactor[i];
         2:Costo:=2000*vecFactor[i];
         3:Costo:=5000*vecFactor[i];
      end;
  end;
end;
function multa(tipo:integer;velocidad:real):boolean;
begin
       case tipo of
          1: if velocidad>100 then
                multa:=true
             else
             multa:=false;
          2: if velocidad>110 then        //Determino si la velocidad es para multa o no
                multa:=true
             else
                multa:=false;
          3: if velocidad>90 then
                multa:=true
            else
               multa:=false;


  end;

end;

Procedure leeFactor(var archZo:text;var j:integer;var c:char ;var zonas:tvZ; var vecFactor:tvMulta);
begin
     j:=0;
     assign(archZo,'zonas2.txt');
     reset(archZo);
     while not eof(archZo)do
      begin
          j:=j+1;
          read(archZo,zonas[j],c,vecFactor[j]);
          readln(archZo);
      end;
  close(archZo);
end;
Procedure leerRadar(zonas:tvZ;vecFactor:tvMulta;var vecInf:tvMulta; var zona:str3; var vecZonasG:tvZ; var vecP:tvP;var arch:text;var n:integer;var tipo:integer;var velocidad:real;var b:char;var contNoinf:integer);
begin
     n:=0;
    assign(arch,'radar.txt');
    reset(arch);
      while not eof (arch)do
         begin
          n:=n+1;
          read(arch,tipo,velocidad,b,zona,b,patente);
          if multa(tipo,velocidad)then
                 begin                             //Llamo a funcion multa y verifico si es o no infraccion
                 vecZonasG[n]:=zona;
                 vecP[n]:=patente;
                 vecInf[n]:=Costo(tipo,zonas,vecFactor,zona);  //Llamo a la funcion  costo para calcular cuanto debe pagar por la multa
                end
          else
          contNoinf:=contNoinf+1;
          readln(arch);
         end;
  close(arch);
end;
procedure buscaZona(vecZonasG:tvZ);
var
  zonaB:str3;
  i,cont:byte;
begin
    cont:=0;
    writeln('Ingrese zona a consultar');
    readln(zonaB);
    for i:=1 to n do
       if vecZonasG[i]=zonaB then
          cont:=cont+1;
writeln('La zona ingresada tiene ',cont,'multas');
end;
begin
  leeFactor(archZo,j,c,zonas,vecFactor);
  leerRadar(zonas,vecFactor,vecInf,zona,vecZonasG,vecP,arch,n,tipo,velocidad,b,contNoinf);
  writeln('La cant que no pertenecen a infracciones son :',contNoinf);
  buscaZona(vecZonasG);
  readln();
end.
