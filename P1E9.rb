=begin
Dado un string, implementa:
• string_reverso: retorna el string con los caracteres en orden inverso.
• string_sin_espacio: elimina los espacios en blanco que contenga.
• string_a_arreglo_ascii: retorna un arreglo con cada uno de los caracteres converti‑
dos a su correspondiente valor ASCII.
• string_remplaza_vocal: cambia las vocales por números:
– "a" o "A" por "4", "e" o "E" por "3", "i" o "I" por "1", "o" u "O" por "0", y "u" o "U" por "6".
=end

def string_reverso (texto)
	puts "String reverso: #{texto.reverse}"
end

def string_sin_espacio (texto)
	puts "String sin espacio: #{texto.gsub(" ", "")}" #/\s+/ es lo mismo que poner ' '
end

def string_reemplaza_vocal (texto)
	puts "Reemplaza vocal:" 
	puts texto.gsub('A', '4').gsub('a', '4').gsub('E', '3').gsub('e', '3').gsub('I', '1').gsub('i', '1').gsub('O', '0').gsub('o', '0').gsub('U', '6').gsub('u', '6')
end

def string_a_arreglo_ascii (texto)
	a = []
	puts "Cada caracter a ASCII:" 
	texto.each_byte do |c|
		a.append(c)
	end
	p a	#Asi imprime el arreglo en la misma linea, si no lo encolumna
end

string_reverso ("Los gatitos son lo mejor")
string_sin_espacio ("Los gatitos son lo mejor")
string_reemplaza_vocal ("Los gatitos son lo mejor")
string_a_arreglo_ascii ("Los gatitos son lo mejor")
