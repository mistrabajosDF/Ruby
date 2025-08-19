=begin
método da_nil? que reciba un bloque, lo invoque y retorne si el valor de retorno del
bloque fue nil
=end

def da_nil?(&block)
  #método que acepta un bloque. & convierte el bloque en un objeto
  puts "Valor del bloque: " + block.call.to_s
  block.call.nil?
  #ejecuta el bloque y obtiene su valor de retorno. Da true si es nil
end

puts da_nil? {} 
puts da_nil? {nil}
puts da_nil? { 'Algo distinto de nil' }
#puts da_nil? do  ASI NO ANDA
#  'Algo distinto de nil'
#end