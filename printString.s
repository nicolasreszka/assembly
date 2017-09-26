# Auteur : Nicolas Reszka
# Fonction : Ecrit une chaine de characteres sur la ligne de commande

	.text
	.type printString @function # Definition de la fonction
	.global printString

# Arguments : 
# %rdx : Longeur de la chaine 
# %rsi : chaine de charactere a ecrire dans la console

printString:
	push	%rbp		# Prologue
	movq	%rsp, %rbp 	#
	movq	$1, %rax   	# Numero d'appel systeme
	movq	$1, %rdi   	# Ecrire dans la console
	syscall		  		# Appel systeme
	leave		  		# Epilogue
	ret 		  		#


