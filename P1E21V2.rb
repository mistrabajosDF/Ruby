=begin
función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
(ambos) que sean menores que un número tope que reciba como parámetro.
=end

def multiplos_de_3_y_5(tope)
  suma = 0
  (1...tope).each do |numero|
    (numero % 3 == 0 && numero % 5 == 0)? suma+=numero : nil
  end
  suma
end

puts multiplos_de_3_y_5(100)