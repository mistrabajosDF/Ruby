=begin
función genérica, que reciba como parámetro un String y un número n, 
y que realice una rotación de n lugares de las letras del String
y retorne el resultado.
=end

def generica(texto, num)
	
	salida=""
	
	texto.each_byte do|byte|
		#Si esta entre A y M o a y m
		if ((byte>=65) && (byte<=77)) || ((byte>=97) && (byte<=109))
			letra=byte+num
			
		#Si esta entre N y Z o n y z
		elsif ((byte>=78) && (byte<=90)) || ((byte>=110) && (byte<=122))
			letra=byte-num
		
		#Otros caracteres
		else 
			letra = byte
		end
		
		salida=salida+letra.chr
	end
	return salida
end

puts generica('Los gatitos son lo mejor.', 5)
