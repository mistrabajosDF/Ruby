=begin
clase Palabra:
• Se instancia con un argumento obligatorio (un String) que será la palabra que represente.
• Si la palabra contiene al menos un espacio, debe arrojar NoEsUnaPalabra.
• Si la palabra es un String vacío, debe arrojar una excepción EsUnStringVacio.

• La clase debe implementara:
– #vocales: retornar las vocales que contiene la palabra que representa.
– #consonantes: retornar las consonantes que contiene la palabra.
– #longitud: retornar la cantidad de caracteres.
– #es_panvocalica?: retornar un valor booleano indicando si la palabra es contiene las 5 vocales.
– #es_palindroma?: que debe retornar un valor boolean indicando si la palabra se lee igual en un sentido que en otro, 
teniendo al menos 3 letras.
– #gritando: retornar la palabra que representa en mayúsculas.
– #en_jaquer: retornar la palabra que representa con las vocales cambiadas por números.
=end

class NoEsUnaPalabra < StandardError; end
class EsUnStringVacio < StandardError; end

class Palabra
  attr_reader :palabra

  def initialize(palabra)
    @palabra = palabra.strip #Saca los espacios

    if @palabra.empty? || @palabra == " "
      raise EsUnStringVacio, "Es un string vacío" 
    end
    raise NoEsUnaPalabra, "#{@palabra} no es una palabra" if @palabra.match?(/\s+/)
    #\s = carácter de espacio/tab. + = uno o más
  end

  def vocales
    @palabra.downcase.chars.select { |char| "aeiou".include?(char) }.uniq
    #Con chars se genera un array de caracteres
    #Al pasar la verificacion se va haciendo otro con los resultados
  end

  def consonantes
    @palabra.downcase.chars.select { |char| ("a".."z").include?(char) && !("aeiou".include?(char)) }.uniq
  end

  def longitud
    @palabra.length
  end

  def es_panvocalica? #Si tiene todas las vocales
    (["a", "e", "i", "o", "u"] - vocales).empty?
  end

  def es_palindroma?
    return false if @palabra.length < 3
    @palabra.downcase == @palabra.downcase.reverse
  end

  def gritando
    @palabra.upcase
  end

  def en_jaquer
    @palabra.gsub('a', '4')
             .gsub('e', '3')
             .gsub('i', '1')
             .gsub('o', '0')
             .gsub('u', '2')
  end
end

# Ejemplo de uso
begin
  palabra = Palabra.new("neuquen")
  puts "Vocales: #{palabra.vocales.join(', ')}" #Join separa los elementos del array y los concatena con ', '
  puts "Consonantes: #{palabra.consonantes.join(', ')}"
  puts "Longitud: #{palabra.longitud}"
  puts "Es panvocálica: #{palabra.es_panvocalica?}"
  puts "Es palíndroma: #{palabra.es_palindroma?}"
  puts "Gritando: #{palabra.gritando}"
  puts "En jaquer: #{palabra.en_jaquer}"
rescue StandardError => e
  puts e.message
end

