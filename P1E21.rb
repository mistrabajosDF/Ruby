=begin
función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
(ambos) que sean menores que un número tope que reciba como parámetro.
=end

def multiplos_de_3_y_5(max)
	num=1
	total=0
	while (num<= max)
		if ((num%5 == 0) && (num%3 == 0))
			total=total+num
		end
		num=num+1
	end
	
	#SOLUCION 1
	#puts "El resultado de la suma de los multiplos de 3 y 5 hasta #{max} es #{total}"
	
	#SOLUCION 2
	yield total
	
end

#SOLUCION 1
#multiplos_de_3_y_5(100)

#SOLUCION 2
multiplos_de_3_y_5(100) {|total| print "El resultado de la suma de los multiplos de 3 y 5 hasta el numero dado es #{total}"}


