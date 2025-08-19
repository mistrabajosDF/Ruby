=begin
método que reciba como parámetro un arreglo de números, los ordene y 
devuelva el resultado.
=end

def ordenar_arreglo(arreglo)
  return arreglo.sort
end

puts ordenar_arreglo([1, 4, 6, 2, 3, 0, 10]).inspect 