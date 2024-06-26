program ejercicio12Segunda;
const
  MaxElement=50;
type
  tvClave=array[1..MaxElement]of string;
  tvP=array[1..MaxElement]of real;
  tvChar=array[1..MaxElement]of char;

procedure leeArchivo(var arrayClave:tvClave;var arrayPromedios:tvP;var arrayUltimo:tvChar;var M:integer);
var
  aux:Real;
  clave:String;
  c,b:char;
  cantEspeciales,i:integer;
  arch:text;
begin
   M:=0;
   assign(arch,'ej12.txt');
   reset(arch);
   while not eof(arch)do
    begin
       CantEspeciales:=0;
       clave:=' ' ;
       read(arch,c);
        while c<>' 'do
         begin
             if (c<'1') and (c>'123')then
               cantEspeciales:=cantEspeciales+1 ;
                if (cantEspeciales<=3) and (c>'1') then
                    clave:=clave+c;                                                                                                        0
               read(arch,c);
         end;
        if cantEspeciales<=3 then
        begin
             M:=M+1;
             arrayClave[M]:=clave;
             {Calculo de promedio}
       for i:=1 to 3 do
           begin
              read(arch,aux);
              arrayPromedios[M]:=arrayPromedios[M]+aux;
           end;
       arrayPromedios[M]:=arrayPromedios[M] /3;
       read(arch,b);
       while b=' 'do
        begin
           read(arch,b);
        end;
       arrayUltimo[M]:=b;
       end;
        readln(arch);
end;
    close(arch);
end;

var
  arrayUltimo:tvChar;
  arrayClave:tvClave;
  arrayPromedios:tvP;
  i,M:integer;
begin
leeArchivo(arrayClave,arrayPromedios,arrayUltimo,M);
    for i:=1 to M do
      begin
          writeln(arrayClave[i],' ',arrayPromedios[i]:4:2,' ',arrayUltimo[i]);
      end;
   readln();
end.



