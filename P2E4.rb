=begin
método que dado un número variable de parámetros de cualquier tipo, 
imprima la cantidad de caracteres que tiene su representación como String
y la representación que se utilizó para contarla.
=end

def longitud(*args)
  args.each do |arg|
    str_representation = arg.to_s
    puts "\"#{str_representation}\" --> #{str_representation.length}"
  end
end

longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)