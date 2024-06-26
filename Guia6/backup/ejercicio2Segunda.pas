program ejercicio2Segunda;
const
  maxELEMENT=50;
type
  str8=String[8];
  mat=array[1..maxElement,1..maxElement] of integer;
  tvNom=array[1..Maxelement]of str8;
procedure leeArchivo(var notas:mat;var nombres:tvNom;var N,M:byte);
var
  j,i,h:integer;
  arch:text;
begin
    assign(arch,'ejercicio2.txt');
    reset(arch);
    readln(arch,M);
    while not eof(arch) do
      begin
        N:=N+1;
        read(arch,nombres[N]);
        for j:=1 to M do
          begin
             read(arch,notas[N,j]);
          end;
        readln(arch);
      end;
end;
procedure aprueba(notas:mat;nombres:tvNom;N,M:byte);
var
  contAprobados,i,j:byte;
begin
    contAprobados:=0;
    i:=1;
    while (i<=N) do
      begin
        contAprobados:=0;
        j:=1 ;
         while (j<=M) do
           begin
               if notas[i,j]>=7 then
                     begin
                      j:=j+1 ;
                      contAprobados:=contAprobados+1;
                     end
                else
                 j:=M+1;
           end;
         if contAprobados=M then
               writeln('El alumno ',nombres[i],'aprobo todos los parciales');
         i:=i+1;
      end;
end;
function promedio(notas:mat;N,M:byte):real;
var
  aux:Real;
  j:byte;
begin
    aux:=0;
      for j:=1 to M do
        begin
          aux:=aux+notas[N,j];
        end;
      promedio:=aux/M;
end;
procedure generaProm(notas:mat;N,M:byte;nombres:tvNom);
var
  i:byte;
  prom:Real;
begin
   for i:=1 to N do
     begin
       prom:= promedio(notas,i,M);
       if prom>=7 then
             writeln('El alumno ',nombres[i],'Promociono')
        else if (prom<7) and (prom>=5)then
             writeln('El alumno ',nombres[i],'habilito')
        else
          writeln('El alumno ',nombres[i],'desaprobo');
     end;
end;
var
  notas:mat;
  nombres:tvNom;
  N,M:byte;
begin
  {Lectura de archivos}
  leeArchivo(notas,nombres,N,M);

  {Quienes aprobaron?}
  aprueba(notas,nombres,N,M);
   write('Puto');
  {Promedios}
  generaProm(notas,N,M,nombres);
  write('Puto');
  readln();
end.

