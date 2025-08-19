=begin
Partiendo del script anterior, implementar una nueva clase de excepción que 
indique que la entrada del usuario no es un valor numérico entero válido.
=end

class NoUno < StandardError
  attr_reader :thing
  def initialize(msg="My default message", thing="apple")
    @thing = thing
    super(msg)
  end
end

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

numeros = []
for i in(1..cantidad)
    puts 'Ingrese un número'
	begin
		numero = Integer(gets)
		if numero == 1
			raise NoUno.new("my message", "No podes ingresar 1")
		end
	rescue ArgumentError
		puts "Ingresa solo numeros enteros"
		retry
	rescue => e
		puts e.thing
		retry
	else
		numeros.append(numero)
	end
end
	
# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { |x| x / (x - 1) rescue "1/0 no se puede procesar"}
puts 'El resultado es: %s' % resultado.join(', ')
