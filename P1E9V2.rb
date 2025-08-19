=begin
Dado un string, implementa:
• string_reverso: retorna el string con los caracteres en orden inverso.
• string_sin_espacio: elimina los espacios en blanco que contenga.
• string_a_arreglo_ascii: retorna un arreglo con cada uno de los caracteres converti‑
dos a su correspondiente valor ASCII.
• string_remplaza_vocal: cambia las vocales por números:
– "a" o "A" por "4", "e" o "E" por "3", "i" o "I" por "1", "o" u "O" por "0", y "u" o "U" por "6".
=end

def string_reverso(cadena)
  cadena.reverse
end

def string_sin_espacio(cadena)
  cadena.gsub(/\s+/, '')  #/\s+/ es lo mismo que poner ' ', es el espacio en blanco
end

def string_a_arreglo_ascii(cadena)
  cadena.chars.map(&:ord) #Chars hace un arreglo con cada letra del string
  #map aplica un codigo a cada elemento del array y devuelve resultados
  #&:ord { |char| char.ord } devuelve su valor ASCII correspondiente
end

def string_remplaza_vocal(cadena)
  cadena.tr('aeiouAEIOU', '4310643106') #Reemplaza cada carater del 1º argumento por el que se corresponde posicionalmente en el 2º
end

cadena = "HOLA Mundo"

puts string_reverso(cadena) 
puts string_sin_espacio(cadena) 
p string_a_arreglo_ascii(cadena)
puts string_remplaza_vocal(cadena)