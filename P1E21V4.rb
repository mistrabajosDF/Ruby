=begin
función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
(ambos) que sean menores que un número tope que reciba como parámetro.
=end

def multiplos_de_3_y_5 (n)
	print((1...n).filter {|i| i.modulo(3).zero? && i.modulo(5).zero?}.sum)
end

multiplos_de_3_y_5(100)
