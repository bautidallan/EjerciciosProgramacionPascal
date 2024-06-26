program imprenta;
const
  maxElement=50;
type
  tvReal=array[1..maxElement]of real;
  tvCaracter=array[1..maxElement]of char;
  tv=array[1..maxElement]of integer;
  var
    t:string;
    vecCostos:tvReal;
    J,i:integer;
    CantPalabras,vecMasLarga:Tv;
function costo(J,tam:integer;cantPalabras:tv;tipo:char):Real;
var
  costoAux:real;
begin
  costoAux:=cantPalabras[j]*1;
  if tam=2 then
    costoAux:=costoAux*1.5;
  case tipo of
  'A':costoAux:=costoAux*2;
  'B':costoAux:=costoAux*3;
  'C':costoAux:=costoAux*5 ;
  end;
  costo:=costoAux;
end;
procedure leeArchivo(var vecCosto:tvReal;var CantPalabras,vecMasLarga:Tv;var J:integer);
var
  tam,longitudPalabra:integer;
  tipo,p:char;
  arch:text;
begin
  assign(arch,'imprenta.txt');
  reset(arch);
  J:=0;
  {Inicializo los vectores}

  while not eof(arch)do
    begin
       J:=J+1;
      read(arch,tipo,tam,p);
        while p<>'.' do  {Leo la linea hasta el punto}
          begin
            if p=' 'then  {Si es blanco leo otro xq puede ser espacio de palabra}
             read(arch,p)
            else
            begin
              cantPalabras[J]:=1+cantPalabras[J];         {Una vez que encuentro una palabra ,actualizo la cant de palabras de la linea}
              longitudPalabra:=0;                          {Reinicio la longitud y luego voy sumando hasta que encuentre un blanco}
              while (p<>'.')and (p<>' ')do
                begin
                  longitudPalabra:=longitudPalabra+1;    {La longitud se ira sumando mientras este en el ciclo}
                  read(arch,p);
                end;
              if longitudPalabra>vecMasLarga[J]then     {Si la longitud de esa palabra es mayor q la mayor longitud de la linea,actualizo}
               vecMasLarga[J]:=longitudPalabra;
            end;
          end;
         vecCosto[J]:=costo(J,tam,CantPalabras,tipo);
        readln(arch);
    end;
  close(arch);
end;
procedure BuscapalabraLarga(vecMasLarga:tv;vecCostos:tvReal;J:integer);
var
  i,masLarga,pos:integer;
begin
  masLarga:=-99;
     for i:=1 to J do
     begin
       if vecMasLarga[i]>masLarga then
        begin
          masLarga:=vecMasLarga[i];
                pos:=i;
        end;

     end;

     writeln('El costo es ',vecCostos[pos]:4:2);
end;
procedure BuscaCantidad(J:integer;vecCostos:tvReal;CantPalabras:tv);
var
  i,cantBuscada:integer;
begin
  i:=1;
  writeln('Ingrese cant buscada');
  readln(cantBuscada);
  while (i<=J)and (cantBuscada<>cantPalabras[i])do
    begin
      i:=i+1;
    end;
  if i>J then
    writeln('No hay una frase con exactamente ',cantBuscada ,' palabras')
    else
    writeln('Su costo es ',vecCostos[i]:4:2);
end;
begin
  {{Lectura de archivos}
  leeArchivo(vecCostos,cantPalabras,vecMasLarga,J);

  {Insiso A}
  buscapalabraLarga(vecMasLarga,vecCostos,J);

  {Insiso B}
  BuscaCantidad(J,vecCostos,CantPALABRAS); }

  t:='palabra';
  for i:=1 to 6 do
    writeln(t[i]);

  readln();
end.

