=begin
enumerador que genere series de números primos con algún tope, ya sea que se detenga al alcanzar o superar un valor, 
o que termine su ejecución al encontrar el enésimo número primo.
=end

nprimos = []

numeros_primos = Enumerator.new do |caller| #Entiende next y cada vez ejecuta y devuelve el elem que quedo
    primo = 1
    divisor = 2
    puts "Calculando primos hasta 100..."
    loop do                     #Por que o cuando corta?????
      while (primo.modulo(divisor)!=0) && (divisor<primo)
        divisor=divisor+1
      end
      if (divisor>=primo)
        nprimos.append(primo)
      end
      caller.yield primo          #Desp de el primer next ejecuta y se queda ahi
      primo = primo +1
      divisor=2
    end
end

100.times { numeros_primos.next }
puts "Lista de numeros primos:"
p nprimos