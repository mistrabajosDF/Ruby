=begin
función genérica, que reciba como parámetro un String y un número n, 
y que realice una rotación de n lugares de las letras del String
y retorne el resultado.
=end

def rot(text, n)
  # Función para rotar un carácter dentro del rango dado
  rotate_char = ->(char, base, n) do
    if char.between?(base, base + 25)
      # Rotar el carácter y ajustar dentro del rango de A-Z o a-z
      ((char.ord - base.ord + n) % 26 + base.ord).chr
    else
      # Retornar el carácter sin cambios si no está en el rango
      char
    end
  end

  # Aplicar la rotación a cada carácter en el texto
  text.chars.map do |char|
    case char
    when 'A'..'Z'
      rotate_char.call(char, 'A', n)
    when 'a'..'z'
      rotate_char.call(char, 'a', n)
    else
      char
    end
  end.join
end

puts rot('Los gatitos son lo mejor.', 5)