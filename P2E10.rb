=begin
Implementá elMixin Countable que permita que cualquier clase cuente la cantidad de
veces que los métodos definidos en ella son invocados. El Mixin debe tener los siguientes métodos:
1. count_invocations_of(sym): contabiliza las invocaciones al método de instancia cuyo nombre es sym (un
símbolo).
2. invoked?(sym): devuelve un valor booleano indicando si el
método llamado sym fue invocado al menos una vez en la instancia receptora.
3. invoked(sym): devuelve la cantidad de veces que el método
identificado por sym fue invocado en la instancia receptora.
=end

module Countable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def count_invocations_of(sym)
      #método de clase que al invocarse realiza las tareas necesarias para contabilizar las invocaciones al método de instancia cuyo nombre es sym (un símbolo).
      
      # Almacena el nombre del método a contar
      invocations = "@#{sym}_invocations"
      
      # Define un método que mantiene la cuenta
      define_method(sym) do |*args|
        # Inicializa la cuenta si es la primera invocación
        instance_variable_set(invocations, instance_variable_get(invocations).to_i + 1)
        # Llama al método original
        super(*args)
      end
    end
  end

  def invoked?(sym)
    instance_variable_get("@#{sym}_invocations").to_i > 0
  end

  def invoked(sym)
    instance_variable_get("@#{sym}_invocations").to_i
  end
end


class Greeter
  include Countable
  
  def hi
    puts 'Hey!'
  end
  
  def bye
    puts 'See you!'
  end

  # Indica que se quiere llevar la cuenta de invocaciones del método `hi`
  count_invocations_of :hi
end


a = Greeter.new
b = Greeter.new

puts a.invoked?(:hi)  # => false
puts b.invoked?(:hi)  # => false

a.hi                  # Imprime "Hey!"
puts a.invoked(:hi)   # => 1
puts b.invoked(:hi)   # => 0
