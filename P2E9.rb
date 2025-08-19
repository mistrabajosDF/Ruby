=begin
Implementá el módulo Reverso para utilizar como Mixin e incluilo en alguna clase para probarlo. 
Debe contener:
1. #di_tcejbo: Imprime el object_id del receptor en espejo (en orden inverso).
2. #ssalc: Imprime el nombre de la clase del receptor en espejo.
=end

module Reverso
  def di_tcejbo
    # Imprime el object_id en espejo
    puts object_id.to_s.reverse
  end

  def ssalc
    # Imprime el nombre de la clase en espejo
    puts self.class.name.reverse
  end
end

class Gatito
  attr_accessor :nombre

  include Reverso
  
  def initialize (nombre)
    @nombre = nombre
  end
end


objeto = Gatito.new("Chomu")
objeto.di_tcejbo  
objeto.ssalc      
puts "Nombre: " + objeto.nombre