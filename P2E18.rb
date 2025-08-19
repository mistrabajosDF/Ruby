=begin
enumerador que calcule la serie de Fibonacci.
=end

fibonacci = Enumerator.new do |caller|
  i1, i2 = 1, 1
  loop do
    caller.yield i1   #Despues de cada uno devuelve el valor y se queda ahi.No suma nada
    puts "valor i1 previo: " + i1.to_s
    puts "valor i2 previo: " + i2.to_s
    i1, i2 = i2, i1+i2 #La operacion de i2= i1 + i2 toma el i1 previo a esta linea, no se ve afectado por el cambio de valor
    puts "valor i1: " + i1.to_s
    puts "valor i2: " + i2.to_s
  end
end

6.times { puts fibonacci.next }