=begin
Método que reciba: la ruta a un archivo y un bloque. 
Abre el archivo, lee su contenido y procesa cada
linea con el bloque recibido.
Considerar excepciones pueden ocurrir, manejarlas e imprimir el msj.
El método deberá retornar la cantidad de líneas procesadas.
=end

def procesar_archivo(ruta, &block) #Puede no escribirse el &block y anda igual
  lineas_procesadas = 0

  begin
    File.open(ruta, 'r') do |archivo|
      archivo.each_line do |linea|
        linea.strip! #esto hace que el salto de linea lo imprima como "" y no como /n
        begin
          #resultado = yield(linea) #Con yield llamas al bloque para cada linea. Hace lo mismo que el de abajo, puede ir cualquiera
          resultado = block.call(linea) #Este necesita si o si que este &block en el encabezado de la funcion, para saber que es
          puts resultado
          lineas_procesadas += 1
        rescue StandardError => e
          puts "Error encontrado: #{e.message} (#{e.class})"
        end
      end
    end
  rescue Errno::ENOENT => e
    puts "Error al abrir el archivo: #{e.message} (#{e.class})"
  rescue StandardError => e
    puts "Error inesperado: #{e.message} (#{e.class})"
  end

  lineas_procesadas
end


resultado = procesar_archivo('datos.txt') { |linea| Integer(linea) }
puts "Líneas procesadas correctamente: #{resultado}"