=begin
Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, 
reciba todos los números como parámetros separados.
=end

def ordenar(*numeros)
  numeros.sort
end

puts ordenar(1, 4, 6, 2, 3, 5, 0, 10, 9).inspect