=begin
Script tolerante a fallos, intentando siempre que se pueda recuperar y volver a intentar.
Lee no menos de 15 números desde teclado y luego imprime el resultado de la división
de cada número por su entero inmediato anterior.
Primero se pide indicar la cantidad de números que ingresará.
=end

puts 'Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división de cada número por su entero inmediato anterior. Como primer paso se pide al usuario que indique la cantidad de números que ingresará.'
puts ' '
cantidad = 0

while cantidad < 5
    puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
	begin
		cantidad = Integer(gets)
	rescue ArgumentError
		puts "Ingresa la cantidad con numeros enteros"
	end
end

# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
    puts 'Ingrese un número'
	begin
		numero = Integer(gets)
	rescue ArgumentError
		puts "Ingresa solo numeros enteros"
		retry
	end
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { |x| x / (x - 1) rescue "1/0 no se puede procesar"}
puts 'El resultado es: %s' % resultado.join(', ')
