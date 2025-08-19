=begin
función rot13 que encripte un String recibido como parámetro utilizando
el algoritmo ROT13
=end

def rot13(texto)
	
	mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	minusculas = "abcdefghijklmnopqrstuvwxyz"
	cant_l = 26
	limite_inferior_mayusculas = 65
	limite_inferior_minusculas = 97

	cadena_con_rotaciones = ""

	for letra in texto.chars
		
		# Si no es una letra queda igual
		if !letra.match(/^[[:alpha:]]$/)
			cadena_con_rotaciones += letra
			next
		end
		
		# Suponemos que la letra es mayúscula
		alfabeto = mayusculas
		limite = limite_inferior_mayusculas
		
		# Pero comprobamos y cambiamos si es necesario
		if letra == letra.downcase # ¿Es minúscula?
			alfabeto = minusculas
			limite = limite_inferior_minusculas
		end

		valor_ascii = letra.ord
		
		# Rotar
		nueva_posicion = (valor_ascii - limite + 13) % cant_l
		
		# Y ver cuál carácter está en esa posición
		cadena_con_rotaciones += alfabeto[nueva_posicion]
	end
	# Regresar nueva cadena
	cadena_con_rotaciones
end

mensaje = "Los gatitos son lo mejor."
puts "El mensaje original es '#{mensaje}'"
# El mensaje original es 'Programando en Ruby desde parzibyte.me'
mensaje_cifrado = rot13 mensaje 
puts "El mensaje cifrado es '#{mensaje_cifrado}'"
# El mensaje cifrado es 'Cebtenznaqb ra Ehol qrfqr cnemvolgr.zr'
mensaje_descifrado = rot13 mensaje_cifrado
puts "El mensaje descifrado es '#{mensaje_descifrado}'" 
# El mensaje descifrado es 'Programando en Ruby desde parzibyte.me'
