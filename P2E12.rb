=begin
Modifica el ejercicio anterior para que GenericFactory sea un módulo
que se incluya como Mixin en las subclases
=end

module GenericFactory #Aca se cambio para que sea un modulo
  def self.included(clase)
    #Se llama cuando el módulo se incluye en una clase
    #Añade el módulo ClassMethods como métodos de clase en dicha clase para que create sea accesible desde la clase
    clase.extend(MetodosDeClase)
  end

  module MetodosDeClase 
    #Contiene métodos que deben ser accesibles en la clase que incluye genericfactory 
    #Se hace asi para separarlos de los metodos de instancia
    def create(**args)
      new(**args)
    end
  end

  def impresion #Este no seria de clase, seria de instancia
    puts object_id.to_s
    puts self.class.name
  end

  def initialize(**args)
    raise NotImplementedError, "Esta es una clase abstracta. Esto debe implementarse en las subclases."
  end
end

class Comida
  
  attr_accessor :nombre, :valor
  include GenericFactory #Aca se incluyo el modulo, ya no hereda de la clase
  
  def initialize(nombre:, valor:)
    @nombre = nombre
    @valor = valor
  end

  def to_s
    "Comida: #{@nombre}, Valor: #{@valor}"
  end
end

class Gato

  attr_accessor :descripcion, :nombre
  include GenericFactory

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

puts pizza.impresion
puts michi_negro.impresion
