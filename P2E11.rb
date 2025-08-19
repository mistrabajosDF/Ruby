=begin
Dada la clase abstracta GenericFactory, implementa subclases que
permitan la creación de instancias de dichas clases mediante el uso del método
create, de manera tal que luego puedas usar esa lógica para instanciar objetos sin invocar
directamente el constructor new.
=end

class GenericFactory
  def self.create(**args)
    new(**args)
  end

  def initialize(**args)
    raise NotImplementedError, "Esta es una clase abstracta. Esto debe implementarse en las subclases."
  end
end


class Comida < GenericFactory
  attr_accessor :nombre, :description #Get y set
  
  def initialize(nombre:, valor:) #Si lo escribis con los : pueden ir en cualquier orden, pero en la invocacion hay que especificar que es c/u
    @nombre = nombre
    @valor = valor
  end

  def to_s #Print
    "Comida: #{@nombre}, Valor: #{@valor}"
  end
end


class Gato < GenericFactory
  attr_accessor :descripcion, :nombre
  
  def initialize(descripcion:, nombre:)
    @descripcion = descripcion
    @nombre = nombre
  end

  def to_s
    "Gato: Nombre: #{@nombre}, #{@descripcion}"
  end
end


pizza = Comida.create(nombre: "pizza", valor: 5000)
michi_negro = Gato.create(descripcion: "Mordedor", nombre: "Chomu")

puts pizza.to_s
puts michi_negro.to_s 
