=begin
función contar que reciba dos String y retorne
la cantidad de veces que aparece el segundo en el primero, en una búsqueda case‑
insensitive
=end

def contar (str, substr)
	puts str.upcase.scan(/(?=#{substr.upcase})/).count
	#Scan revisa la aparicion de algo en otro string y lo guarda en un array
	#por eso cuenta el largo para devolver la cantidad
end

contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "La")
