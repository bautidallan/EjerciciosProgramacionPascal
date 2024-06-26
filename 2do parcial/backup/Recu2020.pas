program Recu2020;
const
  Promos=3;
  Ndias=50;
type
  Treg=record
    dia:integer;
    turno:char;
  end;
  Tmat=array[1..Ndias,1..Promos]of integer;
  Tvec=array[1..50]of Treg;
  var
    matPromos:Tmat;
    VRdias:Tvec;
    M,i:integer;
procedure inicializaMat(var matPromos:Tmat;Ndias,M,Prom:integer);
begin
  if (M=1) AND (Ndias=1) then
     matPromos[1,1]:=0
  else
      if M=1 then
         inicializaMat(matPromos,Ndias-1,Promos,Promos)
      else
          inicializaMat(matPromos,Ndias,M-1,Promos);

  matPromos[Ndias,M]:=0;

end;
procedure lectura(var matPromos:Tmat;var VRdias:Tvec;var i:integer);
var
  j,tipoProm,cantVentas:integer;
  blanco:char;
  arch:text;
begin
  assign(arch,'pizzeria.txt');
  reset(arch);
  i:=0;
  //Inicializar matriz
  while not eof(arch)do
    begin
      i:=i+1;
      read(arch,VRdias[i].dia,blanco,VRdias[i].turno,cantVentas);
        for j:=1 to cantVentas do
           begin
             read(arch,tipoProm);
             matPromos[i,tipoProm]:=matPromos[i,tipoProm]+1;
           end;
        readln(arch);
    end;
   close(arch);
end;
begin
  M:=promos;
  inicializaMat(matPromos,Ndias,M,Promos);
  lectura(matPromos,VRdias,i);
end.

