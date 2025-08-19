=begin
función listar que reciba un Hash y retorne un String con los pares de
clave/valor formateados en una lista ordenada en texto plano.
=end

def listar(hash)
  hash.each_with_index.map do |(key, value), index| #Si sacas lo de index queda pero sin enumerar
    "#{index + 1}. #{key.capitalize}: #{value} \n" #Aca le da el formato
  end
end

puts listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })

#  hash.sort_by { |key, value| key.to_s }.each_with_index.map do |(key, value), index|
# "#{index + 1}. #{key}: #{value}"
# end.join("\n")