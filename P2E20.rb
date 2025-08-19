=begin
Extender la clase Array con el método randomly:
• Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del arreglo
en orden aleatorio, sin repetir los elementos sobre los que se lo invoca.
• Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno, los ele‑
mentos del arreglo en orden aleatorio
=end

class Array
  def randomly(&block)
    elementos_mezclados = shuffle  # Mezcla los elementos del arreglo
    #Se puede hacer esto por estar dentro de la clase array (Es metodo de esta). Al llamar a shuffle asi 
    #se asume que se refiere a self, que es el array que está invocando el método.Funciona = con: self.shuffle

    if block_given? #Valida si hay bloque 
      elementos_mezclados.each(&block)  #Para cada elemento invoca el bloque, y asi se imprime
    else
      Enumerator.new do |yielder|
        elementos_mezclados.each { |element| yielder << element }  #Para cada elemento se llama al enum con yield
      end
    end
  end
end

puts "Ejemplo con bloque: "
[1, 2, 3, 4, 5].randomly { |num| puts num }

puts "Ejemplo con enumerador: "
enum = [1, 2, 3, 4, 5].randomly
5.times { puts enum.next }
puts "Ejemplo con enumerador para que imprima todo independientemente del largo del array: "
enum.each { |num| puts num }  # Imprime todos los elementos