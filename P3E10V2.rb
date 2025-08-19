=begin
Método que reciba: la ruta a un archivo y un bloque. 
Abre el archivo, lee su contenido y procesa cada
linea con el bloque recibido.
Considerar excepciones pueden ocurrir, manejarlas e imprimir el msj.
El método deberá retornar la cantidad de líneas procesadas.
=end


def test (ruta)
	  begin  
		File.open(ruta, 'r') do |f1|  
		while line = f1.gets
			begin
			  line.delete!("\n")
			  result = yield line		  
			  puts ("Resultado de sumarle 2 a #{line}: #{result}")
			rescue ArgumentError
				puts "invalid value for Integer() '#{line}'(ArgumentError)"
			end
		end  
		end
		rescue SystemCallError
			puts ("Ups, revisa si tu archivo existe")
	  end
end


test('origen.txt') {|line| Integer(line)+2}




