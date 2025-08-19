=begin
Dado un color en RGB, se obtenenga su representación entera y hexadecimal. La notación entera
se define como red + green * 256 + blue * 256 * 256 y la hexadecimal como el resultado de expresar
en base 16 el valor de cada color y concatenarlos en orden.
=end

def notacion_hexadecimal(rgb)
  red, green, blue = rgb
  sprintf('#%02X%02X%02X', red, green, blue)
  # sprintf formatea los componentes RGB como números hexadecimales. # indica color hexadecimal.
  # %02X convierte un número a una cadena hexadecimal con al menos dos dígitos, rellenando con ceros si es necesario.
  #La cadena resultante será #RRGGBB
end

def notacion_entera(rgb)
  red, green, blue = rgb
  red + green * 256 + blue * 256 * 256
end

puts notacion_hexadecimal([0, 128, 255]) # => "#0080FF"
puts notacion_entera([0, 128, 255])      # => 16744448

