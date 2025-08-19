=begin
script que le pida a quien lo ejecute su nombre, y que lo utilice para 
saludarl@ imprimiendo ¡Hola, <nombre>!.
=end


def saludo ()
	puts "Ingrese su nombre:"
	nombre = gets
	puts "Hola #{nombre}"
	puts "Presione enter para salir"
	a = gets
end

saludo()
