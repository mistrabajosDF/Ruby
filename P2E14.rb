VALUE = 'global'
module A
  VALUE = 'A'
  class B
    VALUE = 'B'
    def self.value
      VALUE
    end
    def value
      'iB'
    end
  end

  def self.value
    VALUE
  end
end

class C
  class D
    VALUE = 'D'

    def self.value
      VALUE
    end
  end
  
  module E
    def self.value
      VALUE
    end
  end

  def self.value
    VALUE
  end
end

class F < C
  VALUE = 'F'
end

puts "A.value " + A.value #A Llama al metodo de clase definido en el modulo A
puts "A::B.value " + A::B.value #B Llama al método de clase value de la clase B, dentro del modulo A
puts "C::D.value " + C::D.value #D Llama al método de clase value en la clase D
puts "C::E.value " + C::E.value #Global No tiene uno definido, asi que sube a buscar
puts "F.value " + F.value #Global Si bien tiene un value definido, no tiene un método que lo retorne, asi que sube a buscar

puts "A::value " + A::value #A Llama al método de clase value definido en el módulo A
#puts "A.new.value " + A.new.value #undefined method `new' for A:Module (NoMethodError)
#puts "B.value " + B.value #uninitialized constant B (NameError) No se puede acceder directamente a B sin pasar por A ya que esta adentro
puts "C::D.value " + C::D.value #D REPETIDO ARRIBA
puts "C.value " + C.value #Global No tiene uno definido, asi que sube a buscar
puts "F.superclass.value " + F.superclass.value #Global F.superclass= a C. Misma situacion que arriba