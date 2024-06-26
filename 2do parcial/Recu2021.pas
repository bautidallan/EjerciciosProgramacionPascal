program Recu2021;
const
  MDepto=6;
type
  str12=string[12];
  str3=string[3];
  Treg=record
     apellido:str12;
     categoria:str3;
     ocupantes:integer;
     Prop:char;
     end;
  Tmat=Array[1..50,1..50]of Treg;
  Treg2=record
     categoria2:str3;
     descripcion:string[10];
     importe:real;
     end;
  Treg3=record
     ape:str12;
     piso:integer;
  end;
  Tv2=array[1..50]of Treg3;
  Tv=array[1..50]of Treg2;
  var
    vecProp:Tv2;
    matProp:Tmat;
    vecCat:Tv;
    H,M, N,X:integer;
procedure leeArch(var matProp:Tmat;var N:integer);
var
  espacio:char;
  i,j:integer;
  arch:text;
begin
  assign(arch,'edificio.txt');
  reset(arch);
  readln(arch,N);
  while not eof(arch) do
     begin
        read(arch,i,j);
        with matProp[i,j]do
            begin
            read(arch,espacio,apellido,categoria,ocupantes,espacio,Prop);
            end;
        readln(arch);
     end;
  close(arch);
end;
function ocupado(matProp:Tmat;N,M:integer):boolean;
begin
          if M=1 then
             begin
             if matProp[N,1].ocupantes>2 then
                ocupado:=true
             end
           else
             if matProp[N,M].ocupantes>2 then
                ocupado:=ocupado(matProp,N,M-1)
             else
               ocupado:=false;
end;
procedure generaVector(var vecCat:Tv;var X:integer);
var
  espacio:char;
  arch:text;
begin
  assign(arch,'categorias1.txt');
  reset(arch);
  N:=0;
  while not eof(arch)do
     begin
        N:=N+1;
          with vecCat[N] do
              begin
                 read(arch,categoria2,espacio,descripcion,importe);
              end;
        readln(arch);
     end;
  close(arch);
end;
procedure incisoA(matProp:Tmat;N:integer;var M:integer);
var
  i,cont:integer;
begin
     M:=MDepto;
     for i:=1 to N do
       begin
          if ocupado(matProp,N,M) then
             cont:=cont+1;
       end;
     writeln('La cantidad de filas que cumplen es ',cont);
end;
function sumaCat(matProp:Tmat;N,M,MDepto:integer;rubroB:str3):integer;
begin
     if (N=1) and (M=1) then
          begin
        if matProp[1,1].categoria=rubroB then
           sumaCat:=1
           end
      else
        if (M=1)then
           begin
           if  matProp[N,M].categoria=rubroB then
           sumaCat:=1+sumaCat(matProp,N-1,MDepto,MDepto,rubroB)
                 else
               sumaCat:=sumaCat(matProp,N-1,MDepto,MDepto,rubroB);
           end
        else
          if matProp[1,1].categoria=rubroB then
              sumaCat:=sumaCat(matProp,N,M-1,MDepto,rubroB)+1
           else
             sumaCat:=sumaCat(matProp,N,M-1,MDepto,rubroB);
end;
procedure buscaCat(matProp:Tmat;vecCat:Tv;N,X:integer);
var
  rubroB:str3;
begin
   writeln('Ingrese categoria buscada');
   readln(rubroB);
end;
procedure propietario(var vecProp:Tv2;matProp:Tmat;N:integer;var H:integer);
var
  i,j:integer;
begin
    for i:=1 to N do
      for j:=1 to MDepto do
         begin
            if matProp[i,j].Prop='S'then
               H:=H+1;
                with vecProp[H] do
                    begin
                       ape:=matProp[i,j].apellido;
                       piso:=i;
                    end;
         end;
end;
begin
  leeArch(matProp,N);
  generaVector(vecCat,X);
  incisoA(matProp,N,M);
  propietario(vecProp,matProp,N,H);
  readln();

end.

