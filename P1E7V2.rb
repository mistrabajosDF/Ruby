=begin
función contar que reciba dos String y retorne
la cantidad de veces que aparece el segundo en el primero, en una búsqueda case‑
insensitive
=end

def contar(texto, buscar)
  texto = texto.downcase
  buscar = buscar.downcase

  ocurrencias = texto.scan(Regexp.new(Regexp.escape(buscar)))

  ocurrencias.length
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "La")