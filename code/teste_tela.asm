.data
	string1: .asciiz "Testando"
	string2: .asciiz "daniels gostoso"
.text
	
	li $v0, 48	
	li $a0, 0xff
	syscall
	
	
	la $t0, 0xff000000
	li $t1, 0
	li $a0, 240
	li $a1, 0x00
	jal carrega_pixel

	li $a0, 40
	jal carrega_pixel_lado
	
	la $t0, 0xff000000
#	addi $t0, $t0, 12800
	jal carrega_pixel_lado
	
	li $a0, 240
	jal carrega_pixel
	
		
	li $v0, 4
	la $a0,string1
	li $a1,5
	li $a2,5
	li $a3,0xFF00
	syscall

loop_entrada:	li $v0,12
	syscall
	
	move $s0, $v0
			
	bne $s0, 0x67, loop_entrada	
								
	li $v0, 4
	la $a0,string2
	li $a1,5
	li $a2,15
	li $a3,0xFF00
	syscall
	
	
	j fim	
carrega_pixel: beq $t1, $a0, fim_loop
	 	sb $a1, 0($t0)
	 	addi $t0, $t0, 1
	 	addi $t1, $t1, 1
	 	j carrega_pixel
fim_loop: 	li $t1, 0
		jr $ra

	
carrega_pixel_lado: beq $t1, $a0, fim_loop
	 	sb $a1, 0($t0)
	 	addi $t0, $t0, 0x140
		addi $t1, $t1, 1
	 	j carrega_pixel_lado



fim:		j fim


	
	