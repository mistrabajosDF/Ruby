=begin
función que busque los números naturales múltiplos de N números 
enteros que recibirá como parámetro en un arreglo.
=end

def multiplos_de(divisores, tope)
  suma = 0
  (1...tope).each do |numero|
    
    if divisores.all? { |divisor| numero % divisor == 0 }
      suma += numero
    end
  end
  return suma
end

puts multiplos_de([3, 5], 100) 
puts multiplos_de([3, 5, 17, 28, 65], 100_000)