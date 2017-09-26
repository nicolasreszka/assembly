# Auteur : Nicolas Reszka
# Fonction : Ecrit un entier naturel sur la ligne de commande

	.bss
	.lcomm L,64	# Taille du buffer
	.text				
	.type printInt @function # Definition de la fonction
	.global printInt

# Arguments : 
# %rax : l'entier naturel a ecrire dans la console

printInt:
	push	%rbp 		# Prologue
	movq	%rsp, %rbp  #
	movq	$L, %rsi	# Allocation de la memoire
	addq	$63, %rsi 	# Changement du sens d'ecriture
	movb	$10, (%rsi) # Ajout d'un /n a la fin de la ligne
	movq	$10, %rcx 	# Initialisation du diviseur
	movq	 $1, %r8 	# Initialisation de l'iterateur

	loop:
		xorq	%rdx, %rdx  # Zero-ification du registre
		divq	%rcx 	    # Division par 10
		addq	$0x30, %rdx # Conversion en char
		decq	%rsi 		# Preparer le charactere suivant pour la lecture
		movb	%dl, (%rsi) # Deplacer d'un bit
		incq	%r8 		# Incrementation de l'iterateur
		cmpq	$0, %rax 	# Condition d'arret de la boucle
		jz write 		 	# Sortir de la boucle
		jne loop 		 	# Continuer la boucle

write:
	movq	$1, %rax	# Numero d'appel systeme
	movq	$1, %rdi	# Ecrire dans la console
	movq	%r8, %rdx	# Nombre d'octets a ecrire
	syscall		   		# Appel systeme
	leave		   		# Epilogue
	ret 		   		#


