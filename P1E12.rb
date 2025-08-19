=begin
función longitud que dado un arreglo de String,
retorne un nuevo arreglo donde cada elemento es la longitud del String que se encuentra en
la misma posición del arreglo recibido como parámetro.
=end

def longitud (lista)
	lista.map {|item| item.length}
	#map le pide el length a cada elemento del arreglo (Cada item)
end

puts longitud (["aaa", "bbbb", ""])
