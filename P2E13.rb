=begin
Extende TrueClass y FalseClass para que ambas respondan al método de instancia opposite, 
que debe retornar el valor opuesto al que recibe la invocación al método.
=end

class TrueClass
  def opposite
    puts "Invoca clase true"
    false
  end
end

class FalseClass
  def opposite
    puts "Invoca clase false"
    true
  end
end

#true y false son instancias de las clases TrueClass y FalseClass, por eso no se hace new
puts false.opposite
puts true.opposite
puts true.opposite.opposite