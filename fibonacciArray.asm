.text
main:
add $t0,$zero,$zero
addi $t1,$zero,1
sw $t0,0($a0)
sw $t0,4($a0)
beq $a1,$zero,fail0
beq $a1,$t1,fail1
add $t2,$t1,$t1
loop1:
beq $t2,$a1,final
addi $t3,$t2,-1
addi $t4,$t2,-2
sll $t3,$t3,2
sll $t4,$t4,2
add $t5,$t3,$a0
add $t6,$t4,$a0
lw $t7,0($t5)
lw $t8,0($t6)
add $t0,$t7,$t8
sll $t9,$t2,2
sw $t0,0($t9)
addi $t2,$t2,1
j loop1
fail0:
add $v0,$zero,$zero
fail1:
addi $v0,$zero,1
final:
add $v0,$zero,$t0
.data

