=begin
Invoca el metodo del ejercicio anterior para 
ordenar un conjunto de números provistos en forma de arreglo.
=end

def ordenar(*numeros)
  numeros.sort
end

entrada = [10, 9, 1, 2, 3, 5, 7, 8]
puts ordenar(*entrada).inspect