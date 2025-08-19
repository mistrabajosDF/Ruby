=begin
Modificá la función contar para que sólo considere como aparición del segundo 
String cuando se trate de palabras completas
=end

def contar(texto, buscar)
  texto = texto.downcase
  buscar = buscar.downcase

  patron = /\b#{Regexp.escape(buscar)}\b/

  ocurrencias = texto.scan(patron)

  puts (ocurrencias.length)
end


contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "La")