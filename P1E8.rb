=begin
Modificá la función contar para que sólo considere como aparición del segundo 
String cuando se trate de palabras completas
=end

def contar (str, substr)
	puts str.upcase.scan(/\b#{(substr.upcase)}\b/).count
	#Scan revisa la aparicion de algo en otro string y lo guarda en un array
	#, por eso cuenta el largo para devolver la cantidad
end

contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "La")
