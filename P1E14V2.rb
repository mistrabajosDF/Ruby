=begin
funcion listar_mejorada, además reciba opcionalmente un parámetro llamado pegamento (su valor por defecto debe ser ": ") 
que sea el que utilice para unir los pares de clave/valor.
=end

def listar_mejorada(hash, pegamento = ": ")
  hash.each_with_index.map do |(key, value), index|
    "#{index + 1}. #{key}#{pegamento}#{value}"
  end.join("\n")
end

resultado = listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 })
puts resultado

resultado = listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 }, " -> ")
puts resultado