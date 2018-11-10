.data
# crear un arreglo con espacio para 11 numeros enteros
      myArray: .space 44
.text
main:
# load immediate carga el valor de 11 en $v1
li $v1,11
add $t0,$zero,$zero
addi $t1,$zero,1
# coloca inicialmente en $at se guarda el puntero al inicio de myArray
sw $t0,myArray($t0)
add $s3,$at,$zero
# $s3 puntero a myArray
sll $s0,$t1,2
# al el valor de $at se moifica por lo cual usaremos $s3 como puntero a myArray
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
# funciona como el i++ de un for
addi $t2,$t2,1
# se salta al inicio del ciclo
j loop1
fail0:
add $v0,$zero,$zero
fail1:
addi $v0,$zero,1
final:
# se guarda en $v0 el ultimo valor del arreglo
add $v0,$zero,$t0

