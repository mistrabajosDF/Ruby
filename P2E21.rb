=begin
enumerador que genere series de números primos con algún tope, ya sea que se detenga al alcanzar o superar un valor, 
o que termine su ejecución al encontrar el enésimo número primo.
=end

class PrimeEnumerator
  def initialize(limit: nil, count: nil)
    @limit = limit
    @count = count
    @primes = []
    @current = 2  #Primer primo
  end

  def each
    while should_continue?
      if prime?(@current)
        @primes << @current
        yield @current
      end
      @current += 1
    end
  end

  private

  def should_continue?
    return @primes.size < @count if @count
    return @current <= @limit if @limit
    true
  end

  def prime?(number)
    return false if number < 2
    (2..Math.sqrt(number)).none? { |i| number % i == 0 }
  end
end

puts "Primos hasta 20:"
prime_enum_limit = PrimeEnumerator.new(limit: 100)
prime_enum_limit.each { |prime| puts prime }

puts "Los primeros 10 primos:"
prime_enum_count = PrimeEnumerator.new(count: 10)
prime_enum_count.each { |prime| puts prime }