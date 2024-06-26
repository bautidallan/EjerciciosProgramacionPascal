Algoritmo ej1
	definir n como entero
	definir promedio,contador Como Real
	Definir rta Como Caracter
	promedio<-0
	acumulador<-0
	mientras rta<>"F"
		Escribir "Ingrese un numero"
		leer n
		acumulador<-acumulador+n
		promedio<-promedio+1
		Escribir "Queres otro numero"
		leer rta
	FinMientras
	contador<-acumulador/promedio
	Escribir contador
	
FinAlgoritmo
