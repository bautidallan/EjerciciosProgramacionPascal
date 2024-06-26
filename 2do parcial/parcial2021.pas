program parcial2021;
type
  Treg=record
    colum:integer;
    porcentajeMayus:real;
  end;
Tmat=array[1..50,1..50]of char;
Tvec=array[1..50]of Treg;
var
  N,M:integer;
  matLetras:Tmat;
  vecReg:Tvec;
procedure lee(var matLetras:Tmat;var N,M:integer);
var
  j,i:integer;
  letra,espacio:char;
  arch:text;
begin
  assign(arch,'mayusculas.txt');
  reset(arch);
  readln(arch,N,M);
  while not eof(arch) do
    begin
       for i:=1 to N do
         begin
             for j:=1 to M do
                 begin
                   read(arch,letra,espacio);
                   matLetras[N,M]:=letra;
                 end;
          readln(arch);
         end;
    end;
end;
begin
  lee(matLetras,N,M);
  readln();
end.

