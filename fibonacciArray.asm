.data
# crear un arreglo con espacio para 11 numeros enteros
      myArray: .space 100		# aqui se debe de multiplicar por 4 las cantidades de números de la serie que debemos de calcular
# Creando variables de etiquetas 
	saludo: .asciiz "**********************Suma de Fibonacci**********************\n"
	delimitador: .asciiz "*********************************************************\n"
	mensaje_num_oro: .asciiz "El numero de oro mas proximo de la serie es:\n "
	coma: .asciiz ","
	salto: .asciiz "\n"
	num_oro_m: .asciiz "El verdadero número de oro es: \n"
	num_oro: .double 1.61803398874988
	
	
.text
main:
# load immediate carga el valor de 21 en $v1
li $v1,25		# Se ingresa la cantidad de números que queremos calcular
add $t0,$zero,$zero
addi $t1,$zero,1

# ******** Para mostrar los 2 primero números de la serie ****
li $v0,4
la $a0, saludo
syscall

li $v0,1		# se avisa que se mostrar un mensaje tipo int
move $a0,$t0		# se mueve lo que este en $t0 a $a0
syscall			# muestra lo que este en $a0

li $v0,4		# se avisa que se mostrar un mensaje tipo string		
la $a0,coma		# se mueve lo que este en $t0 a $a0
syscall			# muestra lo que este en $a0
 

li $v0,1		# se avisa que se mostrar un mensaje tipo int
move $a0,$t1
syscall

# ****************************************************************

# coloca inicialmente en $at se guarda el puntero al inicio de myArray
sw $t0,myArray($t0)		#se inicializa el primer valor del array a 1
add $s3,$at,$zero		#se añade el array a $s3

# $s3 puntero a myArray
sll $s0,$t1,2			

# al el valor de $at se modifica por lo cual usaremos $s3 como puntero a myArray
sw $t1,myArray($s0)	
	
# si $v1 es igual a cero retorna 0 en $v0
beq $v1,$zero,fail0

# si $v1 es igual a 1 retorna 1 en $v0
beq $v1,$t1,fail1

# $t2 funciona como el int i = 2 de un for
add $t2,$t1,$t1

loop1:
# si $t2 es igual al valor en $v1 el for termina
beq $t2,$v1,final

# en $t3 y $t4 se guardan los numeros anteriores a $t2
addi $t3,$t2,-1
addi $t4,$t2,-2

# se multiplican por 4 lo valores en $t3 y $t4
sll $t3,$t3,2
sll $t4,$t4,2

# en $t5 y $t6 se guardan punteros a las 2 posiciones anteriores
add $t5,$t3,$s3
add $t6,$t4,$s3

# en $t7 y $t8 se cargan lo valores en la posiciones de $t5 y $t6 respentivamente
lw $t7,0($t5)
lw $t8,0($t6)

# $t0 se guardan la suma de $t7 y $t8 que dan como resultado el proximo valor de la serie
add $t0,$t7,$t8

# se multiplica por 4 el valor en $t2(i) y se guarda en $t9
sll $t9,$t2,2

# $t9 se convierte en un puntero hacia el proximo bloque vacio del array
add $t9,$t9,$s3

# se guarda el valor de $t0 en el ultimo bloque vacio
sw $t0,0($t9)
li $v0,4
la $a0,coma
syscall 

li $v0,1
move $a0,$t0
syscall

# funciona como el i++ de un for
addi $t2,$t2,1

# se salta al inicio del ciclo
j loop1

fail0:
addi $v0,$zero,1

fail1:
addi $v0,$zero,1

final:
# se guarda en $v0 el ultimo valor del arreglo
add $v0,$zero,$t0

# Esto es para al final de la seria agregar el salto de linea
li $v0, 4		
la $a0, salto
syscall 

li $v0,4
la $a0, delimitador
syscall


# Segundo parte del proyecto imprimir el numero de oro mas proximo
# mientras mas larga sea la suma mas exacto llegara a ser el número de oro

# ****************************************************************************************************************
#Para imprimir el mensaje de numero de oro
li $v0, 4		
la $a0, mensaje_num_oro
syscall 


#Se muestra en pantalla el resultado del numero de oro  
mtc1 $t0,$f1		# convirtiendo el último número de la serie a flotante
mtc1 $t7,$f2		# convirtiendo el penúltimo número de la serie a flotante
div.s $f3,$f1,$f2	# dividiendo ambos números y guardandoloes en f3(como flotantes con una precision simple) 
li $v0,2		# Se va imprimir un flotante
movf.s $f12,$f3		# se movera a f12(aqui van los flotantes a imprimirse) lo que este en f3
syscall 		# llamada al sistema

# Se agrega un salto de linea
li $v0, 4		
la $a0, salto
syscall 

# Mostrando el verdadero número de oro
li $v0, 4		
la $a0, num_oro_m
syscall 

ldc1 $f2,num_oro
li $v0,3
movf.d $f12,$f2 	# Lee lo que esta en num_oro para ponerlo en pantalla
syscall

# *******************************************************************************************************************

