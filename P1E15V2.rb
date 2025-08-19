#sustituye cada letra por la que está trece posiciones por delante en el alfabeto. 
#A se convierte en N, B se convierte en O y así hasta la M, que se convierte en Z. 
#Luego invierte: N se convierte en A, O se convierte en B y así hasta la Z, que se convierte en M.

def rot13(texto)
	
	salida=""
	
	texto.each_byte do|byte|
		#Si esta entre A y M o a y m
		if ((byte>=65) && (byte<=77)) || ((byte>=97) && (byte<=109))
			letra=byte+13
			
		#Si esta entre N y Z o n y z
		elsif ((byte>=78) && (byte<=90)) || ((byte>=110) && (byte<=122))
			letra=byte-13
		
		#Otros caracteres
		else 
			letra = byte
		end
		
		salida=salida+letra.chr
	end
		return salida
end

puts (rot13 ("Los gatitos son lo mejor."))
