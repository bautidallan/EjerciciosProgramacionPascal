program encriptaciones;
const
  maxElement=50;
type
tvNombre=array[1..maxElement]of string;
tv=array[1..maxElement]of integer;
var
  n:integer;
  vNom:tvNombre;
  vApuntes,vTarea,vForo:tv;
procedure leeArchivo(var vApuntes,vTarea,vForo:tv;var vNom:TvNombre;var n:integer);
var
  X,cantDiasSinAcceso:byte;
  nombre:string;
  c:char;
  arch:text;
begin
    writeln('Ingrese el limite de dias para tomar como valida la linea');
    readln(X);
    N:=0;
    assign(arch,'encriptado.txt');
    reset(arch);
    while not eof (arch)do
    begin
       nombre:=''  ;
        read(arch,c);
        while c<>'.'do
          begin
             if (c>'@') and (c<'[')then
                nombre:=nombre+c;
             read(arch,c);
          end;
         read(arch,cantDiasSinAcceso);
         if cantDiasSinAcceso<X then
            begin
              N:=N+1;
              vNom[N]:=nombre;
              read(arch,vApuntes[N],vTarea[N],vForo[N]);
            end;
         readln(arch);
    end;
    close(arch);
end;
function porcentaje(cantTotal:integer;vTarea:tv;i:integer):real;
begin
    porcentaje:=(vTarea[i]*100)/cantTotal;
end;
procedure informaAlumnos(vApuntes,vTarea,vForo:Tv;vNom:tvNombre;n:integer);
var

  cantTotal,i:integer;
begin
    for i:=1 to N do
      begin
        cantTotal:=0;
        cantTotal:=vApuntes[i]+vTarea[i]+vForo[i];
        writeln(vNom[i],' tuvo una cantidad total de accesos de ',cantTotal,' y de tareas fueron ',porcentaje(cantTotal,vTarea,i):4:2,'%');
      end;
end;
procedure accedeForos(vForos,vTarea:tv;vNom:TvNombre;n:integer);
var
    maxAccesoTareas,i:integer;
    maxNombre:String;
begin
    maxAccesoTareas:=-99;
    for i:=1 to N do
      begin
        if vForos[i]=0 then
           begin
             if vTarea[i]>maxAccesoTareas then
                begin
                  maxAccesoTareas:=vTarea[i];
                  maxNombre:=vNom[i];
                end;
           end;
      end;
    writeln('El/La que mas accedio a las tareas sin acceder a los foros es ',maxNombre);
end;
begin
  leeArchivo(vApuntes,vTarea,vForo,vNom,n);

  {insiso A}
   informaAlumnos(vApuntes,vTarea,vForo,vNom,n);

   {insiso B}
    accedeForos(vForo,vtarea,vNom,N);
   readln();
end.

