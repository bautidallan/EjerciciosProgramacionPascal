{Se pide leer los datos y almacenarlos en estructuras adecuadas. Luego, obtener e informar:
a) Cuántos pisos tienen todos sus departamentos ocupados por más de 2 personas.  {Recursivo!!!}
b) Dada una categoría CATEG ingresada por teclado calcular lo que debería abonarse en
concepto de expensas en un mes para dicha categoría.      {Recursivo}
c) Generar un arreglo con los apellidos y pisos de los ocupantes que son propietarios de los
departamentos identificados con un número (entre 1 y 6) ingresado por teclado. Luego
mostrar el arreglo generado.
}
program parcialEdificios;
const
  MAX=50;
  type
  str12=String[12];
  str3=String[3];
  Treg1=record
  apellido:str12;
  categoria:Str3;
  ocupantes:byte;
  propietario:char;
  end;
  TCat =record
   cate:Str3;
   valor:real;
  end;
  tm=array[1..MAX,1..6]of Treg1;
  tv=array[1..MAX]of Tcat;
 procedure leeArchivo(var edificio:tm;var N:byte);
 var
   b:char;
   piso,depto:byte;
   arch:text;
 begin
   assign(arch,'edificio.txt');
   reset(arch);
   readln(arch,N);
   while not eof(arch)do
   begin
       read(arch,piso,depto);
       read(arch,b,edificio[piso,depto].apellido,edificio[piso,depto].categoria,edificio[piso,depto].ocupantes,b,edificio[piso,depto].propietario);
       readln(arch);
   end;

 end;
procedure generaCat(var tipos:tv);
var
  b:char;
  descripcion:String[10]  ;
  pos:byte;
  arch:Text;
begin
    pos:=0;
    assign(arch,'categorias1.txt');
    reset(arch);
    while not eof(arch) do
      begin
         pos:=pos+1;
         read(arch,tipos[pos].cate,b,descripcion,tipos[pos].valor);
         readln(arch);
      end;

end;
function cuentaPisos(edificio:tm;i,j,M:byte):byte;
 begin
     if i=0 then
       cuentaPisos:=0
     else
       begin
       if (i=1)and (j=1)then
         begin
          if edificio[i,j].ocupantes>2 then
              cuentaPisos:=1
          else
            cuentaPisos:=0;
          end
       else
       begin
          if j=1 then
            begin
             if edificio[i,j].ocupantes>2 then
              cuentaPisos:=1+cuentaPisos(edificio,i-1,M,M)
              else
                 cuentaPisos:=cuentaPisos(edificio,i-1,M,M)
             end
          else
             if edificio[i,j].ocupantes>2 then
                cuentaPisos:=cuentaPisos(edificio,i,j-1,M)
                else
                   cuentaPisos:=cuentaPisos(edificio,i-1,M,M);
        end;
    end;

 end;
procedure cuentaCategorias(var cuentaProp,cuentaNoProp:integer;edificio:tm;i,j,M:byte;cat:str3);
begin
    if (i=1) and (j=1) then
      begin
       if edificio[i,j].categoria=cat then
         if edificio[i,j].propietario='S'then
           cuentaProp:=1+cuentaProp
           else
             cuentaNoProp:=1+cuentaNoProp
      end
    else
    begin
       if j=1 then
         begin
            if edificio[i,j].categoria=cat then
              begin
                if edificio[i,j].propietario='S'then
                    begin
                       cuentaProp:=1+cuentaProp;
                       cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i-1,M,M,cat);
                    end
                  else
                   begin
                     cuentaNoProp:=1+cuentaNoProp;
                     cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i-1,M,M,cat);
                   end
              end
            else
              cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i-1,M,M,cat);
         end
       else
         begin
              if edificio[i,j].categoria=cat then
              begin
                if edificio[i,j].propietario='S'then
                   begin
                       cuentaProp:=1+cuentaProp;
                       cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i,j-1,M,cat);
                   end
                  else
                   begin
                     cuentaNoProp:=1+cuentaNoProp;
                     cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i,j-1,M,cat);
                   end
              end
            else
              cuentaCategorias(cuentaProp,cuentaNoProp,edificio,i,j-1,M,cat);
         end
    end;


end;
function busca(cat:Str3;N:byte;tipos:tv):byte;
var
  i:byte;
begin
    i:=0;
    while (i<=N) and (tipos[i].cate<>cat) do
      i:=i+1;

    if i<=N then
      busca:=i
    else
      busca:=0;
end;
procedure buscaCategoria(edificio:tm;N,M:byte;var cuentaNoProp,cuentaProp:integer;tipos:tv);
var
  precio,expensas:Real;
  pos:byte;
  cat:Str3;
begin
    expensas:=0;
    precio:=0;
    writeln('Ingrese la categoria buscada');
    readln(cat);
    cuentaCategorias(cuentaProp,cuentaNoProp,edificio,N,M,M,cat);
    pos:=busca(cat,N,tipos);
    if pos<>0 then
      precio:=tipos[pos].valor
    else
      writeln('No existe man');

    expensas:=(cuentaNoProp*precio+(precio*0.9)*cuentaProp);
    writeln(expensas:4:2);

end;
var
  edificio:tm;
  i,j,N,M,cantPiso:byte;
  cuentaProp,cuentaNoProp:integer;
  tipos:tv;
begin
  leeArchivo(edificio,N);
  generaCat(tipos);
  M:=6;
  cantPiso:=cuentaPisos(edificio,N,M,M);
  if cantPiso>0 then
     writeln('La cantidad de pisos que tienen ocupados TODOS sus deptos por mas de 2 personas son ',cantPiso)
     else
        writeln('Ninguno');
  buscaCategoria(edificio,N,M,cuentaNoProp,cuentaProp,tipos);
  readln();

end.

