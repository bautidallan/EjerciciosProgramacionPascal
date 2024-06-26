program parcialEncriptaciones;
const
  MAX=50;
type
  tvNom=array[1..MAX]of string;
  tv=array[1..MAX]of integer;
procedure cargaDatos(var vNom:tvNom;var vApuntes,vTarea,vForos:tv;var N:byte);
var
  X,diasSinAcceso:integer;
  caracter:char;
  pal:string;
  arch:text;
  apuntes,tarea,foros:byte;
begin
   writeln('Ingrese la cantidad limite de dias sin acceso');
   readln(X);
   assign(arch,'encriptado.txt');
   reset(arch);

   while not eof(arch)do
     begin
       pal:='';
       read(arch,caracter);
       while caracter<>'.' do
           begin
              if (caracter>='A') and (caracter<='Z') then
                   pal:=pal+caracter;
              read(arch,caracter);
           end;
       read(arch,diasSinAcceso);
       if (diasSinAcceso<X) then
          begin
             read(arch,apuntes,tarea,foros);
             N:=N+1;
             vNom[N]:=pal;
             vApuntes[N]:=apuntes;
             vTarea[N]:=tarea;
             vForos[N]:=foros;
          end;
       readln(arch);
     end;
  close(arch);
end;
procedure insisoA(vNom:tvNom;vApuntes,Vforos,vTarea:tv;N:integer);
var
  porcentajeTarea:real;
  accesos:byte;
  i:byte;
begin
    for i:=1 to N do
       begin
         porcentajeTarea:=0;
         accesos:=0;
         accesos:=vForos[i]+vApuntes[i]+vTarea[i];
         porcentajeTarea:=(vTarea[i]*100)/accesos;
         writeln('El alumno ', vNom[i],' accedio ',accesos,' de los cuales ',porcentajeTarea:4:2 ,'% son de tareas')
       end;
end;
procedure insisoC(vNom:tvNom;vTarea,vForos:tv;N:integer);
var
  maxAlumno:string;
  maxAccesoTareas:integer;
  i:byte;
begin
  maxAccesoTareas:=-99;
   for i:=1 to N do
      begin
         if vForos[i]=0 then
            begin
               if vTarea[i]>maxAccesoTareas then
                   begin
                      maxAccesoTareas:=vTarea[i];
                      maxAlumno:=vNom[i];
                   end;
            end;
      end;
   writeln('El alumno ',maxAlumno,' fue el alumno con mas acceso a tareas sin haber accedido a los foros ,accedio ',maxAccesoTareas,' veces');
end;
var
  vNom:tvNom;
  vApuntes,vTarea,vForos:tv;
  N:byte;
begin
  cargaDatos(vNom,vApuntes,vTarea,vForos,N);
  insisoA(vNom,vApuntes,vForos,vTarea,N);
  insisoC(vNom,vTarea,vForos,N);
  readln();
end.


