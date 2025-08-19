=begin
método cuanto_falta? que opcionalmente reciba como parámetro un objeto
Time y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro
no es provisto, asume que la consulta es para la medianoche de hoy.
=end

def cuanto_falta?(fecha = nil)
  fecha ||= Time.new(Time.now.year, Time.now.month, Time.now.day, 0, 0, 0)
  #|| asigna el valor solo si fecha es = nil o false, es decir
  
  diferencia = ((fecha - Time.now) / 60).round #Redondea
  
end

puts cuanto_falta?(Time.new(2032, 12, 31, 23, 59, 59))
puts cuanto_falta?