program ejercicio7;
type
  mat=array[1..20,1..20]of integer ;
var
  PS,PB:mat;
  N,M:integer;
procedure generaMat(var PS,PB:mat;var N,M:integer);
var
  P,L,CS,CB:integer;
  arch:text;
begin
  assign(arch,'ej7.txt');
  reset(arch);
  readln(arch,N,M);
  while not eof (arch) do
        begin
        readln(arch,P,L,CS,CB);
        PS[P,L]:=PS[P,L]+CS; //Armo matriz de cantidad de gente que sube
        PB[P,L]:=PB[P,L]+CB; //Armo matriz cant de gente q baja
        end;
  close(arch);
end;
procedure mayor(PB:mat;N,M:integer);
var
  suma,mayor,i,j:integer;
begin
     mayor:=-999;
     for j:=1 to M do
       begin
       suma:=0;
          for i:=1 to N do
            begin
              suma:=PB[i,j]+suma;
            end;
       if suma>mayor then
          mayor:=suma;
       end;
end;
procedure cantParadas(PS,PB:mat;N,M:integer);
var
  sumaSuben,sumaBajan,i,j:integer;
begin
    for j:=1 to M do
        begin
          for i:=1 to N do
              begin
              sumaSuben:=sumaSuben+PS[i,j];
              sumaBajan:=sumaBajan+PB[I,J];
              end;
           if sumaSuben<(0.4*sumaBajan)then
               writeln('La parada ',j,'cumple');
        end;
end;
begin
  generaMat(PS,PB,N,M);
  mayor(PB,N,M);
  cantParadas(PS,PB,N,M);
  writeln(N,M);
  readln();
end.
