=begin
función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
(ambos) que sean menores que un número tope que reciba como parámetro.
=end

def multiplos_de_3_y_5(max)
	num=0
	total=0
	while (num<= max)
		if (yield num)
			total=total+num
		end
		num=num+1
	end
	puts "El resultado de la suma de los multiplos de 3 y 5 hasta #{max} es #{total}"
	
end

multiplos_de_3_y_5(100) {|x| ((x%5 == 0) && (x%3 == 0))}



